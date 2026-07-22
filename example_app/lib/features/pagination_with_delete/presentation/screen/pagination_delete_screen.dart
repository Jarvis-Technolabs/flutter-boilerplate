import 'dart:async';

import 'package:example_app/core/base/screen/base_bloc_widget.dart';
import 'package:example_app/core/const/image_constants.dart';
import 'package:example_app/core/const/string_constants.dart';
import 'package:example_app/core/localizations/app_localizations.dart';
import 'package:example_app/core/ui/widget_extension/image_extension.dart';
import 'package:example_app/core/ui/widget_extension/widget_extension.dart';
import 'package:example_app/features/pagination_with_delete/data/model/delete_request_model.dart';
import 'package:example_app/features/pagination_with_delete/presentation/widget/pagination_mixin.dart';
import 'package:example_app/features/pagination_with_delete/presentation/bloc/pagination_bloc.dart';
import 'package:example_app/features/pagination_with_delete/presentation/bloc/pagination_event.dart';
import 'package:example_app/features/pagination_with_delete/presentation/bloc/pagination_state.dart';
import 'package:example_app/features/pagination_with_delete/presentation/widget/pagination_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart' as Toast;

import '../../../../core/localizations/localization_extension.dart';

class PaginationDeleteScreen extends BaseBlocWidget {
  @override
  State<PaginationDeleteScreen> createState() => _PaginationDeleteScreenState();
}

class _PaginationDeleteScreenState
    extends BaseBlocWidgetState<PaginationDeleteScreen>
    with ListingScreenPaginationMixin {
  int? itemIndex;
  StreamController<int> deleteStreamController = StreamController.broadcast();

  @override
  void initState() {
    super.initState();
    initData();
    fetchData();
  }

  fetchData() {
    BlocProvider.of<PaginationBloc>(context).add(FetchPaginationDataEvent(
        paginationRequestModel: paginationRequestModel));
  }

  @override
  Widget getCustomBloc() => Scaffold(
        backgroundColor: appColors.whiteColor,
        appBar: AppBar(
          foregroundColor: appColors.whiteColor,
          title: Text(context.tr(LABEL_PAGINATION_WITH_DELETE)),
        ),
        body: BlocBuilder<PaginationBloc, PaginationState>(
          builder: (_, state) {
            isLoading = false;
            if (state is DeleteItemDataState) {
              isLoading = false;
              Toast.Fluttertoast.showToast(
                msg: state.message,
                toastLength: Toast.Toast.LENGTH_LONG,
                gravity: Toast.ToastGravity.BOTTOM,
                backgroundColor: appColors.grayColor,
                textColor: appColors.whiteColor,
                timeInSecForIosWeb: 2,
              );
              dataList.removeAt(itemIndex ?? 0);
              deleteStreamController.add(itemIndex!);
            }
            if (state is DeleteItemDataErrorState) {
              isLoading = false;
              Toast.Fluttertoast.showToast(
                msg: state.message,
                toastLength: Toast.Toast.LENGTH_LONG,
                gravity: Toast.ToastGravity.BOTTOM,
                backgroundColor: appColors.grayColor,
                textColor: appColors.whiteColor,
                timeInSecForIosWeb: 2,
              );
            }
            if (state is PaginationLoadingState) {
              isLoading = true;
            }
            if (state is PaginationErrorState) {
              isLoading = false;
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.message),
              ));
            } else if (state is PaginationDataFetchedState) {
              isLoading = false;
              dataList.addAll(state.paginationResponse.data!);
              return getScreen();
            }
            if (dataList.isNotEmpty) {
              isLoading = false;
              return getScreen();
            }
            return getScreen();
          },
        ),
      );

  Widget getScreen() => Column(
        children: [
          Expanded(
            child: isLoading
                ? Center(
                    child: CircularProgressIndicator(
                      backgroundColor: appColors.redColor,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Color(0xff4062FF),
                      ),
                    ),
                  )
                : StreamBuilder<int>(
                    stream: deleteStreamController.stream,
                    builder: (_, snapshot) => PaginationWidget(
                          onRefresh: () {
                            dataList.clear();
                            initData();
                            fetchData();
                          },
                          onDataFetch: () async {
                            pageClass++;
                            paginationRequestModel.pageNumbers =
                                pageClass.toString();
                            fetchData();
                          },
                          paginatedWidget: ListView.builder(
                              itemCount: isLoading
                                  ? dataList.length + 1
                                  : dataList.length,
                              itemBuilder: (context, index) {
                                if (isLoading && index == dataList.length) {
                                  return Align(
                                    alignment: Alignment.center,
                                    child: Wrap(children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: screenUtil.setHeight(150)),
                                        child: CircularProgressIndicator(
                                          backgroundColor: appColors.redColor,
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            Color(0xff4062FF),
                                          ),
                                        ),
                                      )
                                    ]),
                                  );
                                }

                                return ListTile(
                                  title: Container(
                                    height: screenUtil.setHeight(200),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        IC_APP_LOGO.getImage(
                                            screenUtil: screenUtil,
                                            height: 100,
                                            boxFit: BoxFit.contain),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(dataList[index].brandTitle!)
                                                .paddingOnly(screenUtil,
                                                    paddingLeft: 40,
                                                    paddingTop: 20),
                                            IconButton(
                                                    onPressed: () {
                                                      itemIndex = index;
                                                      BlocProvider.of<
                                                                  PaginationBloc>(
                                                              context)
                                                          .add(DeleteItemEvent(
                                                              deleteRequestModel:
                                                                  DeleteRequestModel(
                                                                      brandId: dataList[
                                                                              index]
                                                                          .id!
                                                                          .toString())));
                                                    },
                                                    icon: Icon(Icons
                                                        .delete_forever_rounded))
                                                .paddingOnly(screenUtil,
                                                    paddingRight: 30)
                                          ],
                                        ),
                                        Divider(
                                          height: screenUtil.setHeight(1.5),
                                          color: appColors.grayColor,
                                        ).paddingOnly(screenUtil,
                                            paddingTop: 25)
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        )),
          ),
        ],
      );
}
