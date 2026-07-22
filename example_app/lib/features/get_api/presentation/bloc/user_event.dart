import 'package:flutter/foundation.dart';

import '../../data/model/user_list_request.dart';

@immutable
abstract class UserEvent {}

class FetchUserListEvent extends UserEvent {
  final UserListRequest request;

  FetchUserListEvent({required this.request});
}
