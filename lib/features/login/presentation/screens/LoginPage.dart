import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/features/login/presentation/blocs/LoginBloc.dart';
import 'package:flutter_clean_architecture/features/login/presentation/widgets/login_form.dart';
import 'package:flutter_clean_architecture/core/util/injection_container.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: BlocProvider(
        builder: (context) {
          return LoginBloc(
            userRepository: sl(),
          );
        },
        child: LoginScreen(),
      ),
    );
  }
}
