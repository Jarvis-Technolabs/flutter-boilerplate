import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/core/base/BaseScreen.dart';
import 'package:flutter_clean_architecture/features/feed/presentation/bloc/feeds_bloc.dart';
import 'package:flutter_clean_architecture/features/feed/presentation/bloc/feeds_state.dart';
import 'package:flutter_clean_architecture/features/feed/presentation/widgets/feed_list.dart';

class FeedsScreen extends BaseScreen {
  @override
  State<StatefulWidget> createState() => _FeedsScreenState();
}

class _FeedsScreenState extends BaseScreenState<FeedsScreen> {
  @override
  getCustomBloc() => BlocBuilder<FeedsBloc, FeedsState>(
        builder: (BuildContext context, FeedsState feedState) {
//          print("Bloc Test::  Screen!! " + feedState.toString());
          if (feedState is FeedsLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (feedState is FeedsError) {
            return Container(

              height: double.infinity,
              width: double.infinity,
              child: Text('Error fesfhdslfgdhfgdytg iysterf etched'),
            );
          } else if (feedState is FeedsLoaded) {
            return FeedList(feeds: feedState.feedItems);
          }

          return Container(
              color: Colors.orangeAccent,
              height: double.infinity,
              width: double.infinity);
        },
      );

}
