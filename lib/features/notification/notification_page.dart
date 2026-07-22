import 'package:flutter_clean_architecture/core/di/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/core/base/base_page.dart';
import 'package:flutter_clean_architecture/core/base/bloc/api_base_bloc/api_base_bloc.dart';

import 'presentation/bloc/notification_bloc.dart';
import 'presentation/screen/notification_screen.dart';

class NotificationPage extends BasePage {
  NotificationPage({Key? key}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends BasePageState<NotificationPage> {
  @override
  Widget getChildBlocWidget(BuildContext _) => BlocProvider(
        create: (context) => NotificationBloc(
          apiBaseBloc: BlocProvider.of<ApiBaseBloc>(context),
          getNotificationUseCase: sl(),
        ),
        child: NotificationScreen(),
      );
}
