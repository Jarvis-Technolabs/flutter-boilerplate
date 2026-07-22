import 'package:example_app/core/base/base_page.dart';
import 'package:example_app/core/base/bloc/api_base_bloc/api_base_bloc.dart';
import 'package:example_app/features/firebase_phone_auth/presentation/bloc/phone_auth_bloc.dart';
import 'package:example_app/features/firebase_phone_auth/presentation/screen/firebase_phone_auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/injection_container.dart';

class FirebasePhoneAuthPage extends BasePage {
  FirebasePhoneAuthPage({Key? key}) : super(key: key);

  @override
  _FirebasePhoneAuthPageState createState() => _FirebasePhoneAuthPageState();
}

class _FirebasePhoneAuthPageState extends BasePageState<FirebasePhoneAuthPage> {
  @override
  Widget getChildBlocWidget(BuildContext _) => BlocProvider<PhoneAuthBloc>(
        create: (context) => PhoneAuthBloc(
          apiBaseBloc: BlocProvider.of<ApiBaseBloc>(context),
          phoneAuthUseCase: sl(),
          verifyOtpUseCase: sl(),
        ),
        child: FirebasePhoneAuthScreen(),
      );
}
