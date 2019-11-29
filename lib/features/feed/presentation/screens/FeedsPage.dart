import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/core/models/error/no_params.dart';
import 'package:flutter_clean_architecture/features/feed/presentation/bloc/authentication_bloc.dart';
import 'package:flutter_clean_architecture/features/feed/presentation/bloc/feeds_bloc.dart';

import '../widgets/feeds_screen.dart';

class FeedsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FeedsPageState();
}

class _FeedsPageState extends State<FeedsPage> {
  @override
  Widget build(BuildContext context) => BlocProvider<FeedsBloc>(
        builder: (context) {
          FeedsBloc bloc =
              FeedsBloc(BlocProvider.of<AuthenticationBloc>(context));
          bloc.add(NoParams());
          return bloc;
        },
        child: FeedsScreen(),
      );
}
