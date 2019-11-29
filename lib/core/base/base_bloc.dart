import 'package:bloc/bloc.dart';
import 'package:flutter_clean_architecture/features/feed/presentation/bloc/authentication_bloc.dart';

abstract class BaseBloc<Event, State> extends Bloc<Event, State> {
  BaseBloc(this.baseBlocObject);

  final AuthenticationBloc baseBlocObject;
}
