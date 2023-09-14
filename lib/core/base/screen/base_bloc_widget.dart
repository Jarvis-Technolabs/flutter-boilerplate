import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/core/localizations/app_localizations.dart';

import '../../const/api_constants.dart';
import '../../const/string_constants.dart';
import '../../routes/routes.dart';
import '../../ui/widgets/custom_alert.dart';
import '../../ui/widgets/loading_dialog.dart';
import '../../ui/widgets/show_app_dialog.dart';
import '../../util/utilities.dart';
import '../bloc/api_base_bloc/api_base_bloc.dart';
import '../bloc/api_base_bloc/api_base_bloc_state.dart';
import 'base_screen.dart';

abstract class BaseBlocWidget extends BaseScreen {
  BaseBlocWidget({Key? key}) : super(key: key);
}

abstract class BaseBlocWidgetState<T extends BaseBlocWidget>
    extends BaseScreenState<T> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) => super.build(context);

  @override
  Widget body(BuildContext context) => MultiBlocListener(
        listeners: [
          BlocListener<ApiBaseBloc, ApiBaseBlocState>(
            listenWhen: (prevState, curState) => prevState != curState,
            listener: (ctx, state) {
              if (state is ApiErrorState) {
                ///Pop Progress indicator dialog
                hideDialog();

                ///Show Error dialog
                stateError(
                  apiError: state,
                );
              } else if (state is ApiLoadingState) {
                if (!isDialogShowing && ModalRoute.of(context)!.isCurrent) {
                  ///Show Progress indicator dialog
                  showDialogView();
                }
              } else if (state is ApiLoadedState && isDialogShowing) {
                ///Pop Progress indicator dialog
                hideDialog();
              }
            },
          ),
        ],
        child: getCustomBloc(),
      );

  Widget getCustomBloc();

  bool isDialogShowing = false;

  ///Show progress indicator dialog
  void showDialogView() {
    isDialogShowing = true;
    loadingDialog(
      context: context,
      screenUtil: screenUtil,
      appColors: appColors,
    );
  }

  ///Pop screen
  void hideDialog() {
    isDialogShowing = false;
    Navigator.of(context).pop();
  }

  ///Show error in dialog
  Future<bool?> stateError({
    required ApiErrorState apiError,
  }) async =>
      showAppDialog(
        context: context,
        appColors: appColors,
        screenUtil: screenUtil,
        barrierDismissible: false,
        child: WillPopScope(
          onWillPop: () async => false,
          child: CustomAlert(
            titleText:
                AppLocalizations.of(context).translate(apiError.title ?? LABEL_ERROR),
            descriptionText: apiError.message != null
                ? apiError.apiStatusCode == UN_AUTHORISED_ERROR_CODE ||
                        apiError.apiStatusCode == LOCAL_ERROR_CODE
                    ? AppLocalizations.of(context).translate(apiError.message!)
                    : apiError.message
                : "",
            buttonText: apiError.actionButtonText != null
                ? AppLocalizations.of(context)
                    .translate(apiError.actionButtonText!)
                : null,
            onClick: () async {
              if (apiError.apiStatusCode == UN_AUTHORISED_ERROR_CODE) {
                await logoutAndClearAppData(context);
              }
            },
          ),
        ),
      );

  ///Logout unauthorized user, clear data and navigate to splash or login screen
  Future<void> logoutAndClearAppData(BuildContext context) async {
    await Utilities.clearData();
    navigateAndRemoveAll(
      context: context,
      routeName: Routes.splash,
    );
  }

  @override
  void dispose() => super.dispose();
}
