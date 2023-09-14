import 'package:bloc/bloc.dart';

import '../../api/model/failure.dart';
import '../../const/api_constants.dart';
import 'api_base_bloc/api_base_bloc.dart';
import 'api_base_bloc/api_base_bloc_event.dart';

abstract class BaseBloc<Event, State> extends Bloc<Event, State> {
  BaseBloc(this.apiBaseBlocObject, State initialState) : super(initialState);

  final ApiBaseBloc apiBaseBlocObject;

  ///Use delay where you want to pop the progress indicator dialog and immediately navigate to new screen
  Future<void> addDelayForDialogPopAndScreenNavigation() async =>
      await Future.delayed(
        Duration(
          milliseconds: 20,
        ),
      );

  ///Use below delay method where mock api is integrated.
  ///Todo: Please remove below method usage after API integration
  Future<void> mockAPIDelay() async => await Future.delayed(
        Duration(
          milliseconds: 300,
        ),
      );

  ///Use below error handling for screen where we are showing shimmer effect
  bool isUnAuthorised(Failure failure) {
    bool isUnAuthorised = failure.statusCode == UN_AUTHORISED_ERROR_CODE;
    if (isUnAuthorised) {
      apiBaseBlocObject.add(
        ErrorApiEvent(
          failure: failure,
        ),
      );
    }
    return isUnAuthorised;
  }
}
