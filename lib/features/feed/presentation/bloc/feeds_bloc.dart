import 'package:flutter_clean_architecture/core/models/error/no_params.dart';
import 'package:flutter_clean_architecture/core/util/injection_container.dart';
import 'package:flutter_clean_architecture/features/feed/data/models/feeds_item.dart';
import 'package:flutter_clean_architecture/features/feed/domain/repositories/feeds_repository.dart';
import 'package:flutter_clean_architecture/features/feed/presentation/bloc/authentication_bloc.dart';
import 'package:flutter_clean_architecture/features/feed/presentation/bloc/feeds_state.dart';

import '../../../../core/base/base_bloc.dart';

class FeedsBloc extends BaseBloc<NoParams, FeedsState> {
  FeedsRepository repository;

  FeedsBloc(AuthenticationBloc authenticationBloc) : super(authenticationBloc) {
    repository = sl();
  }

  @override
  FeedsState get initialState => FeedsInitial();

  @override
  Stream<FeedsState> mapEventToState(NoParams event) async* {
    print("Bloc Test::  " +
        "   FeedsBlocBase mapEventToState" +
        state.toString());
    yield FeedsLoading();

    yield* getInstitutions(repository);

    final output = await repository.getApiStatus();

    final leftFunction = (failure) async* {
      baseBlocObject.objectModel = failure;
      baseBlocObject.add(NoParams());
      yield FeedsError("");
    };
    final rightFunction = (itemsLoaded) async* {
      yield* getInstitutions(repository);
    };
    yield* output.fold(leftFunction, rightFunction);
  }

  Stream<FeedsState> getInstitutions(FeedsRepository repository) async* {
    List<InstitutionsItem> arrays = await repository.getFeeds();
    yield FeedsLoaded(arrays);
  }
}
