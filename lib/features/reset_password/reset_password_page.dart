import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/core/base/base_page.dart';
import 'package:flutter_clean_architecture/core/base/bloc/api_base_bloc/api_base_bloc.dart';
import 'package:flutter_clean_architecture/core/di/injection_container.dart';
import 'package:flutter_clean_architecture/features/forgot_password/data/model/forgotPassword_response_model.dart';

import 'presentation/bloc/reset_password_bloc.dart';
import 'presentation/screen/reset_password_screen.dart';

class ResetPasswordPage extends BasePage {
  final ForgotPasswordResponseModel? forgotPasswordResponseModel;
  ResetPasswordPage({
    Key? key,
    required this.forgotPasswordResponseModel,
  }) : super(key: key);

  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends BasePageState<ResetPasswordPage> {
  @override
  Widget getChildBlocWidget(BuildContext _) => BlocProvider(
        create: (context) => ResetPasswordBloc(
          apiBaseBloc: BlocProvider.of<ApiBaseBloc>(context),
          resetPasswordUseCase: sl(),
        ),
        child: ResetPasswordScreen(
          forgotPasswordResponseModel: widget.forgotPasswordResponseModel,
        ),
      );
}
