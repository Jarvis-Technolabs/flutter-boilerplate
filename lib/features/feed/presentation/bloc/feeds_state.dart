import 'package:flutter_clean_architecture/features/feed/data/models/feeds_item.dart';

class FeedsState {}

class FeedsInitial extends FeedsState {}

class FeedsLoading extends FeedsState {}

class FeedsLoadingLinear extends FeedsState {}

class FeedsLoaded extends FeedsState {
  final List<InstitutionsItem> feedItems;

  FeedsLoaded(this.feedItems);
}

class FeedsError extends FeedsState {
  final String message;

  FeedsError(this.message);
}
