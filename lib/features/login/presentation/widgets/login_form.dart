import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/core/base/BaseScreen.dart';
import 'package:flutter_clean_architecture/core/util/internationalization/local/AppLocalizations.dart';
import 'package:flutter_clean_architecture/features/feed/presentation/screens/FeedsPage.dart';
import 'package:flutter_clean_architecture/features/login/data/entities/RegistrationRequest.dart';
import 'package:flutter_clean_architecture/features/login/presentation/blocs/LoginBloc.dart';
import 'package:flutter_clean_architecture/features/login/presentation/blocs/login_event.dart';
import 'package:flutter_clean_architecture/features/login/presentation/blocs/login_state.dart';

class LoginScreen extends BaseScreen {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends BaseScreenState<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  getCustomBloc() {
    _onLoginButtonPressed() {
      RegistrationRequest registrationRequestModel = RegistrationRequest(
          firstName: "Volunteertwol",
          lastName: "Volunteertwof",
          mobileNumber: "0772915703",
          deviceId: "dfc1d27a7abe0843",
          fcmId:
              "fep1fm7cC6g:APA91bHXXeDj0bSeMHV4qBPH-ZZuUlTiAUl2ERpnLns4Pz9fKarR31U9MT_1Npqa8clrKOLjAt0xPH6GEUCmPWuXN3IGdGpMGKIJMf095YQfE1rDBQVO",
          deviceToken: "4bec21fc-4214-4c5b-a4f3-440ccbd5aef0");
      BlocProvider.of<LoginBloc>(context).add(
        LoginButtonPressed(registrationRequest: registrationRequestModel),
      );
    }

    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text('${state.error}'),
              backgroundColor: Colors.red,
            ),
          );
        } else if (state is LoginSuccess) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => FeedsPage()));
        } else if (state is LoginFailure) {
          unauthenticated();
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Form(
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: 'username'),
                  controller: _usernameController,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'password'),
                  controller: _passwordController,
                  obscureText: true,
                ),
                RaisedButton(
                  onPressed:
                      state is! LoginLoading ? _onLoginButtonPressed : null,
                  child: Text(AppLocalizations.of(context).loginText),
                ),
                Container(
                  child: state is LoginLoading
                      ? CircularProgressIndicator()
                      : SizedBox(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
