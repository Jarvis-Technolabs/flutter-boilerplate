import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/core/api/model/failure.dart';
import 'package:flutter_clean_architecture/core/api/model/success.dart';
import 'package:flutter_clean_architecture/core/base/bloc/api_base_bloc/api_base_bloc.dart';
import 'package:flutter_clean_architecture/core/base/bloc/base_bloc.dart';
import 'package:flutter_clean_architecture/features/notification/data/model/get_notification_response_model.dart';
import 'package:flutter_clean_architecture/features/notification/domain/usecases/get_notification_usecase.dart';

import 'notification_event.dart';
import 'notification_state.dart';

class NotificationBloc extends BaseBloc<NotificationEvent, NotificationState> {
  final GetNotificationUseCase getNotificationUseCase;
  NotificationBloc({
    required this.getNotificationUseCase,
    required ApiBaseBloc apiBaseBloc,
  }) : super(apiBaseBloc, NotificationStateInitialState()) {
    on<GetNotificationEvent>(getNotificationEvent);
  }

  Future<void> getNotificationEvent(
    GetNotificationEvent event,
    Emitter emit,
  ) async {
    if (!event.isNextPageCall) {
      emit(GetNotificationDataLoadingState());
    }
    await mockAPIDelay();
    Either<Failure, Success> result =
        await getNotificationUseCase(event.getNotificationRequest);
    await result.fold(
      (failure) async {
        if (!isUnAuthorised(failure)) {
          if (event.isNextPageCall) {
            emit(
              GetNotificationNextPageErrorState(
                message: failure.errorMessage,
                statusCode: failure.statusCode,
              ),
            );
          } else {
            emit(
              GetNotificationErrorState(
                message: failure.errorMessage,
                statusCode: failure.statusCode,
              ),
            );
          }
        }
      },
      (data) async {
        GetNotificationResponseModel getNotificationResponseModel = data.data;
        emit(
          GetNotificationState(
            response: getNotificationResponseModel,
            message: data.message ?? '',
          ),
        );
      },
    );
  }
}
