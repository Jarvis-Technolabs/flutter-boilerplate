import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/core/base/screen/base_bloc_widget.dart';
import 'package:flutter_clean_architecture/core/const/app_constants.dart';
import 'package:flutter_clean_architecture/core/const/string_constants.dart';
import 'package:flutter_clean_architecture/core/ui/theme/text_extension/text_extension.dart';
import 'package:flutter_clean_architecture/core/ui/widget_extension/widget_extension.dart';
import 'package:flutter_clean_architecture/core/ui/widgets/app_error_widget.dart';
import 'package:flutter_clean_architecture/core/ui/widgets/common_app_bar.dart';
import 'package:flutter_clean_architecture/core/ui/widgets/divider_widget.dart';
import 'package:flutter_clean_architecture/core/ui/widgets/pagination_widget.dart';
import 'package:flutter_clean_architecture/core/ui/widgets/shimmer/shimmer_list_item.dart';
import 'package:flutter_clean_architecture/features/notification/data/model/get_notification_request_model.dart';
import 'package:flutter_clean_architecture/features/notification/data/model/get_notification_response_model.dart';
import 'package:flutter_clean_architecture/features/notification/presentation/bloc/notification_event.dart';

import '../bloc/notification_bloc.dart';
import '../bloc/notification_state.dart';

class NotificationScreen extends BaseBlocWidget {
  NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends BaseBlocWidgetState<NotificationScreen> {
  List<Notifications> notificationList = [];
  int currentPage = 1;
  int totalNotification = 0;
  StreamController<bool> paginationLoadingStreamController =
      StreamController<bool>.broadcast();
  final StreamController<bool> refreshUIStreamController =
      StreamController<bool>.broadcast();
  GetNotificationResponseModel? getNotificationResponseModel;
  ScrollController scrollController = ScrollController();
  bool pageError = false;

  @override
  void initState() {
    currentPage = 1;
    callGetNotificationListAPI();
    super.initState();
  }

  void callGetNotificationListAPI({
    bool isNextPageCall = false,
  }) {
    BlocProvider.of<NotificationBloc>(context).add(
      GetNotificationEvent(
        getNotificationRequest: GetNotificationRequest(
          pageNo: currentPage,
        ),
        isNextPageCall: isNextPageCall,
      ),
    );
  }

  @override
  Widget getCustomBloc() => Scaffold(
        appBar: CommonAppBar(
          title: LABEL_NOTIFICATION,
        ),
        backgroundColor: appColors.screenBgColor,
        body: BlocConsumer<NotificationBloc, NotificationState>(
          listener: (_, state) {
            if (state is GetNotificationState) {
              getNotificationResponseModel = state.response;
              pageError = false;
              if (getNotificationResponseModel != null) {
                if (currentPage == 1) {
                  notificationList =
                      getNotificationResponseModel!.notifications ?? [];
                } else {
                  notificationList.addAll(
                      getNotificationResponseModel!.notifications ?? []);
                  removePageLoading();
                }
                totalNotification = getNotificationResponseModel!.total ?? 0;
              }
            }
            if (state is GetNotificationNextPageErrorState) {
              pageError = true;
              removePageLoading();
              showAppErrorSnackBar(
                context: context,
                appColors: appColors,
                message: state.message,
                onRetry: () async {
                  showPageLoading();
                  callGetNotificationListAPI(
                    isNextPageCall: true,
                  );
                },
              );
            }
          },
          builder: (_, state) {
            if (state is GetNotificationDataLoadingState) {
              return shimmerNotificationList();
            }
            if (state is GetNotificationErrorState) {
              return AppErrorWidget(
                message: state.message,
                onRetry: () {
                  callGetNotificationListAPI();
                },
              );
            }
            return getNotificationResponseModel != null
                ? screenBody()
                : SizedBox.shrink();
          },
        ),
      );

  Widget screenBody() => PaginationWidget(
        paginationLoadingStreamController: paginationLoadingStreamController,
        currentPage: currentPage,
        itemCount: notificationList.length,
        totalRecordsCount: totalNotification,
        onRefresh: () {
          currentPage = 1;
          callGetNotificationListAPI();
        },
        onDataFetch: () {
          if (!pageError) {
            currentPage++;
          }
          callGetNotificationListAPI(isNextPageCall: true);
        },
        separatorBuilder: (_, index) => DividerWidget(),
        itemBuilder: (_, index) => notificationItem(
          notificationList[index],
        ),
      );

  void showPageLoading() {
    paginationLoadingStreamController.add(true);
  }

  void removePageLoading() {
    paginationLoadingStreamController.add(false);
  }

  Widget shimmerNotificationList() => ListView.separated(
        separatorBuilder: (_, int index) => DividerWidget(),
        shrinkWrap: true,
        itemCount: PER_PAGE_ITEM_COUNT,
        itemBuilder: (_, int index) => ShimmerListItemWidget().paddingSymmetric(
          screenUtil: screenUtil,
          horizontalPadding: 16,
          verticalPadding: 8,
        ),
      );

  Widget notificationItem(
    Notifications notification,
  ) =>
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          notification.title!.getText16W500Text(
            screenUtil: screenUtil,
            appColors: appColors,
            maxLine: 2,
          ),
          notification.description!.getDescriptionText14W500Text(
            maxLine: 8,
            screenUtil: screenUtil,
            appColors: appColors,
          )
        ],
      ).paddingSymmetric(
        horizontalPadding: 16,
        verticalPadding: 8,
        screenUtil: screenUtil,
      );
}
