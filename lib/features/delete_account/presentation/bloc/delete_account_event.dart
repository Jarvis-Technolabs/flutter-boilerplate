import 'package:flutter/foundation.dart';
import 'package:flutter_clean_architecture/features/delete_account/data/model/delete_account_request_model.dart';

@immutable
abstract class DeleteAccountEvent {}

class DeleteEvent extends DeleteAccountEvent {
  final DeleteAccountRequestModel request;
  DeleteEvent({required this.request});
}
