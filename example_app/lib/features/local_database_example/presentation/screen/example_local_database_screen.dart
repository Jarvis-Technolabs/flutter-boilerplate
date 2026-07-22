import 'dart:async';

import 'package:example_app/core/base/screen/base_bloc_widget.dart';
import 'package:example_app/core/ui/theme/text_style_extension/text_style_extension.dart';
import 'package:example_app/core/ui/widget_extension/widget_extension.dart';
import 'package:example_app/core/ui/widgets/button.dart';
import 'package:example_app/features/local_database_example/data/datasource/example_local_data_source.dart';
import 'package:flutter/material.dart';

import '../../../../core/const/string_constants.dart';
import '../../../../core/database/app_db.dart';
import '../../../../core/di/injection_container.dart';
import '../../../../core/localizations/app_localizations.dart';
import '../../../../core/localizations/localization_extension.dart';
import '../../../../core/ui/widgets/custom_textfield_widget.dart';

class ExampleLocalDataBaseScreen extends BaseBlocWidget {
  ExampleLocalDataBaseScreen();

  @override
  State<ExampleLocalDataBaseScreen> createState() =>
      _ExampleLocalDataBaseScreenState();
}

class _ExampleLocalDataBaseScreenState
    extends BaseBlocWidgetState<ExampleLocalDataBaseScreen> {
  List<ExampleTable> exampleTableList = [];
  TextEditingController _titleTextEditingController = TextEditingController();
  TextEditingController _rankTextEditingController = TextEditingController();
  StreamController<bool?> refreshTableStreamController = StreamController();
  StreamController<bool> isInsertUpdateButtonEnabledStreamController =
      StreamController();
  late ExampleLocalDataSource exampleLocalDataSource;

  @override
  void initState() {
    /// initialize local database datasource
    exampleLocalDataSource = sl();

    /// retrieve all the records
    fetchAllExampleTableRecords();
    super.initState();
  }

  /// fetch all the records from the table
  void fetchAllExampleTableRecords() async {
    exampleTableList = await exampleLocalDataSource.getAllData();
    refreshTableStreamController.add(null);
    refreshTableStreamController.add(true);
  }

  @override
  Widget getCustomBloc() => Scaffold(
        backgroundColor: appColors.screenBgColor,
        appBar: AppBar(
          title: context.tr(LABEL_LOCAL_DATABASE_CRUD)
              .getWhiteColor17W500Inter(
                  screenUtil: screenUtil, appColors: appColors),
        ),
        body: Column(
          children: [
            Column(
              children: [
                CustomTextFieldWidget(
                  controller: _rankTextEditingController,
                  labelText: context.tr(LABEL_RANK),
                  hintText: context.tr(LABEL_RANK),
                  errorText: "",
                  onChanged: (value) {
                    validateFields();
                  },
                  isMandatoryField: true,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                ).paddingOnly(
                  screenUtil,
                  paddingBottom: 20,
                ),
                CustomTextFieldWidget(
                  controller: _titleTextEditingController,
                  labelText:
                      context.tr(LABEL_TITLE),
                  hintText: context.tr(LABEL_TITLE),
                  onChanged: (value) {
                    validateFields();
                  },
                  isMandatoryField: true,
                  textInputAction: TextInputAction.next,
                ).paddingOnly(
                  screenUtil,
                  paddingBottom: 30,
                ),
                StreamBuilder<bool>(
                  stream: isInsertUpdateButtonEnabledStreamController.stream,
                  initialData: false,
                  builder: (context, snapshot) {
                    return PrimaryButton(
                      title:
                          "${context.tr(LABEL_INSERT) + "/" + context.tr(LABEL_UPDATE)}",
                      backgroundColor: appColors.primaryColor,
                      buttonTextColor: appColors.whiteColor,
                      selectHandler: (_rankTextEditingController
                                  .text.isNotEmpty &&
                              _titleTextEditingController.text.isNotEmpty)
                          ? () async {
                              hideKeyBoard();

                              /// insert or update : if primary key record already exist in table then record will update else insert
                              await exampleLocalDataSource.insertData(
                                  ExampleTable(
                                      rank: int.parse(
                                          _rankTextEditingController.text),
                                      title: _titleTextEditingController.text));

                              /// fetch updated records
                              fetchAllExampleTableRecords();
                            }
                          : null,
                    ).paddingOnly(
                      screenUtil,
                      paddingBottom: 30,
                    );
                  },
                ),
              ],
            ),
            Expanded(
              child: StreamBuilder<bool?>(
                  stream: refreshTableStreamController.stream,
                  builder: (context, snapshot) {
                    return ListView.builder(
                      itemCount: exampleTableList.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            title: Text(exampleTableList[index].title),
                            subtitle: Text(
                                exampleTableList[index].rank.toString() ?? ''),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                    onPressed: () async {
                                      hideKeyBoard();

                                      /// delete all records from the table
                                      await exampleLocalDataSource.deleteData(
                                          exampleTableList[index].rank);

                                      /// fetch updated records
                                      fetchAllExampleTableRecords();
                                    },
                                    icon: Icon(
                                      Icons.delete,
                                      color: appColors.primaryColor,
                                    ))
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }),
            ),
          ],
        ).paddingAll(padding: 20, screenUtil: screenUtil),
      );

  validateFields() {
    if (_rankTextEditingController.text.isNotEmpty &&
        _titleTextEditingController.text.isNotEmpty) {
      isInsertUpdateButtonEnabledStreamController.add(true);
    } else {
      isInsertUpdateButtonEnabledStreamController.add(false);
    }
  }

  void hideKeyBoard() {
    FocusScope.of(context).unfocus();
  }
}
