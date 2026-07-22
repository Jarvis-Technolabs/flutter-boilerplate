import 'package:example_app/core/base/bloc/api_base_bloc/api_base_bloc.dart';
import 'package:example_app/core/di/injection_container.dart';
import 'package:example_app/features/pagination_with_delete/presentation/bloc/pagination_bloc.dart';
import 'package:example_app/features/pagination_with_delete/presentation/screen/pagination_delete_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/base/base_page.dart';

class PaginationDeletePage extends BasePage {
  PaginationDeletePage({Key? key}) : super(key: key);

  @override
  _PaginationDeletePageState createState() => _PaginationDeletePageState();
}

class _PaginationDeletePageState extends BasePageState<PaginationDeletePage> {
  @override
  Widget getChildBlocWidget(BuildContext _) => BlocProvider(
        create: (context) => PaginationBloc(
            apiBaseBloc: BlocProvider.of<ApiBaseBloc>(context),
            paginationDataUseCase: sl(),
            deleteItemDataUseCase: sl()),
        child: PaginationDeleteScreen(),
      );
}
