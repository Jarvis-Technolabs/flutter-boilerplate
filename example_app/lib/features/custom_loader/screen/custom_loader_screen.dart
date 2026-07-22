import 'dart:async';
import 'dart:math';

import 'package:country_picker/country_picker.dart';
import 'package:example_app/core/base/screen/base_bloc_widget.dart';
import 'package:flutter/material.dart';

import '../../../core/const/string_constants.dart';
import '../../../core/localizations/app_localizations.dart';
import '../../../core/localizations/localization_extension.dart';

class CustomLoaderScreen extends BaseBlocWidget {
  @override
  State<CustomLoaderScreen> createState() => _CustomLoaderScreenState();
}

class _CustomLoaderScreenState extends BaseBlocWidgetState<CustomLoaderScreen> {
  bool showLoader = false;

  List quotesList = [
    {
      "id": 1,
      "quote": "People who love to eat are always the best people",
      "quoteBy": "Oscar Wilde"
    },
    {
      "id": 2,
      "quote": "Food is our common ground, a universal experience",
      "quoteBy": "James Beard"
    },
    {
      "id": 3,
      "quote":
          "All you need is love. But a little chocolate now and then doesn't hurt",
      "quoteBy": "Charles M. Schulz"
    },
    {
      "id": 4,
      "quote": "A party without cake is just a meeting",
      "quoteBy": "Julia Child"
    },
    {
      "id": 5,
      "quote": "First we eat, then we do everything else",
      "quoteBy": "M.F.K. Fisher"
    },
    {"id": 6, "quote": "Food should be fun", "quoteBy": "Thomas Keller"},
    {"id": 7, "quote": "Food is memories", "quoteBy": "José Andrés"},
    {
      "id": 8,
      "quote": "Laughter is brightest in the place where the food is",
      "quoteBy": " Irish Proverb"
    },
  ];

  dynamic selectedQuote;

  StreamController<bool> refreshLoaderState =
      StreamController<bool>.broadcast();

  void chooseRandomQuote() {
    /// Added true to show the loader
    showLoader = true;
    refreshLoaderState.add(showLoader);
    final random = Random();
    selectedQuote = quotesList[random.nextInt(quotesList.length)];
    Future.delayed(const Duration(seconds: 3), () {
      /// Added false to hide the loader
      showLoader = false;
      refreshLoaderState.add(showLoader);
    });
  }

  @override
  void initState() {
    super.initState();
    chooseRandomQuote();
  }

  @override
  Widget getCustomBloc() => Scaffold(
        backgroundColor: appColors.screenBgColor,
        appBar: AppBar(
          foregroundColor: appColors.whiteColor,
          title:
              Text(context.tr(LABEL_CUSTOM_LOADER)),
        ),
        body: StreamBuilder<bool>(
            key: UniqueKey(),
            stream: refreshLoaderState.stream,
            initialData: showLoader,
            builder: (_, snapshot) {
              return Center(
                child: snapshot.data!
                    ? showLoaderWidget()
                    : const Text("Page loaded"),
              );
            }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (!showLoader) {
              chooseRandomQuote();
            }
          },
          child: const Icon(Icons.add),
        ),
      );

  showLoaderWidget() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              selectedQuote["quote"],
              style: TextStyle(
                  color: appColors.primaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 12,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "${"-"} ${selectedQuote["quoteBy"]}",
                style: TextStyle(
                  color: appColors.primaryColor,
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            CircularProgressIndicator(
              color: appColors.primaryColor,
            ),
          ],
        ),
      );
}
