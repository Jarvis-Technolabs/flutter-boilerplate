import 'package:example_app/core/base/screen/base_bloc_widget.dart';
import 'package:example_app/core/localizations/localization_extension.dart';
import 'package:example_app/core/ui/theme/text_style_extension/text_style_extension.dart';
import 'package:example_app/core/ui/widget_extension/widget_extension.dart';
import 'package:example_app/core/ui/widgets/custom_info_overlay_widget.dart';
import 'package:example_app/features/get_api/data/model/user_list_request.dart';
import 'package:example_app/features/get_api/presentation/bloc/user_bloc.dart';
import 'package:example_app/features/get_api/presentation/bloc/user_event.dart';
import 'package:example_app/features/get_api/presentation/bloc/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/const/string_constants.dart';
import '../../../../core/localizations/app_localizations.dart';
import '../../../../core/ui/widgets/loading_indicator.dart';
import '../../../../core/ui/widgets/pagination_widget.dart';
import '../../data/model/user_list_response.dart';
import '../widget/user_list_item_widget.dart';
import '../widget/user_list_shimmer_widget.dart';

class GetApiScreen extends BaseBlocWidget {
  @override
  State<GetApiScreen> createState() => _GetApiScreenState();
}

class _GetApiScreenState extends BaseBlocWidgetState<GetApiScreen> {
  List<Data>? userList = [];
  late int totalPage;
  late int totalItem;
  int currentPage = 1; // initialPageNo

  @override
  void initState() {
    /// call api for fetch user list
    callUserListAPI();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget getCustomBloc() => Scaffold(
      backgroundColor: appColors.screenBgColor,
      appBar: AppBar(
        title: context.tr(LABEL_GET_API_IMPLEMENTATION)
            .getWhiteColor17W500Inter(
                screenUtil: screenUtil, appColors: appColors),
      ),
      body: BlocConsumer<UserBloc, UserState>(
        listener: (_, state) {
          /// manage UserBloc states
          if (state is GetUserListFailureState) {
            showSnackBarWithActionWidget(
                contentWidget: context.tr(state.message)
                    .getWhiteColor14W400Inter(
                        screenUtil: screenUtil, appColors: appColors),
                durationInSecond: 10,
                context: context,
                backgroundColor: appColors.primaryColor,
                actionLabel:
                    context.tr(LABEL_RETRY),
                actionTextColor: appColors.whiteColor,
                actionOnPress: () => callUserListAPI());
          }
        },
        builder: (context, state) {
          if (state is UserInitialState) {
            return UserListShimmerWidget();
          }
          if (state is GetUserListSuccessState) {
            if (currentPage == 1)
              userList!.clear(); // clear userList when page is initialPage
            userList!.addAll(
                state.response.data!); // add all new list as per the page
            totalItem = state.response.total!; // initialise totalItems
            totalPage = state.response.totalPages!; // initialise totalPages

            return PaginationWidget(
              currentPage: currentPage,
              totalPage: totalPage,
              initialPage: 1, // pass initialPageNo
              refreshIndicatorBackgroundColor: appColors.whiteColor,
              refreshIndicatorColor: appColors.primaryColor,
              onDataFetch: (int page) {
                currentPage = page;
                callUserListAPI();
              },
              isHandleEmptyWidget: userList!.isEmpty ? true : false,
              onPullToRefresh: (int page) {
                currentPage = page;
                callUserListAPI();
              },
              listViewWidget: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: userList!.isNotEmpty
                      ? userList!.length + 1
                      : 0, // add length+1 for show loading indicator
                  itemBuilder: (_, index) {
                    return userList!.length == index
                        ? userList!.length !=
                                totalItem // userList length and totalItem not same then show loading indicator
                            ? CommonCircularProgressIndicator(
                                screenUtil: screenUtil,
                                appColors: appColors,
                              ).paddingAll(padding: 40, screenUtil: screenUtil)
                            : SizedBox()
                        : UserListItemWidget(
                            user: userList![index],
                          );
                  }),
            );
          }
          return SizedBox.shrink();
        },
      ));

  /// call UserBloc's FetchUserListEvent event
  callUserListAPI() {
    BlocProvider.of<UserBloc>(context)
        .add(FetchUserListEvent(request: UserListRequest(page: currentPage)));
  }
}
