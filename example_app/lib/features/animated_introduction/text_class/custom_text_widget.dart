import 'package:flutter/cupertino.dart';

class HeadingTextWidget extends StatelessWidget {
  final String text;
  final Color color;
  double size;
  HeadingTextWidget(
      {Key? key, required this.text, required this.color, this.size = 12})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}

class DescTextWidget extends StatelessWidget {
  final String text;
  final Color color;
  double size;
  DescTextWidget(
      {Key? key, required this.text, required this.color, this.size = 12})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
