import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

import '../../../../../core/base/screen/base_screen.dart';

class LottiePlayerAssets extends BaseScreen {
  final String asset;
  final VoidCallback? onComplete;
  final bool repeat;
  final bool reverse;
  final double? height;
  final double? width;

  const LottiePlayerAssets({
    super.key,
    required this.asset,
    this.onComplete,
    this.repeat = false,
    this.reverse = false,
    this.height,
    this.width,
  });

  @override
  State<LottiePlayerAssets> createState() => LottiePlayerState();
}

class LottiePlayerState extends BaseScreenState<LottiePlayerAssets>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        widget.onComplete?.call();
      }
    });
  }

  void replay() {
    _controller
      ..reset()
      ..forward();
  }

  @override
  Widget body(BuildContext context) {
    return Lottie.asset(
      widget.asset,
      controller: _controller,
      height: widget.height,
      width: widget.width,
      repeat: widget.repeat,
      reverse: widget.reverse,
      onLoaded: (composition) {
        _controller
          ..duration = composition.duration
          ..forward();
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
