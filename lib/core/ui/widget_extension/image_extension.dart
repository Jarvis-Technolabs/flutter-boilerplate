import 'dart:convert';

import 'package:avatar_view/avatar_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../const/image_constants.dart';
import '../../util/screen_util/screen_util.dart';
import '../theme/colors/colors_inf.dart';

extension ImageExtension on String {
  ///SVG icon
  Widget getSvgIcon({
    required ScreenUtil screenUtil,
    ColorFilter? color,
    double imgHeight = 24.0,
    double imgWidth = 24.0,
    BoxFit fit = BoxFit.none
  }) =>
      SvgPicture.asset(
        this,
        height: screenUtil.setHeight(imgHeight),
        width: screenUtil.setHeight(imgWidth),
        colorFilter: color!,
        fit: fit,
      );

  ///Assets icon image with default size
  Image getIconImage({
    required ScreenUtil screenUtil,
    double height = 24.0,
    double width = 24.0,
    Color? imgColor,
    BoxFit? boxFit,
    double? scale,
  }) =>
      Image.asset(
        this,
        height: screenUtil.setHeight(height),
        width: screenUtil.setWidth(width),
        color: imgColor,
        fit: boxFit,
        scale: scale,
      );

  ///Asset image
  Image getImage({
    required ScreenUtil screenUtil,
    Color? imgColor,
    double? height,
    double? width,
    BoxFit? boxFit,
    double? scale,
  }) =>
      Image.asset(
        this,
        height: height != null ? screenUtil.setHeight(height) : null,
        width: width != null ? screenUtil.setWidth(width) : null,
        color: imgColor,
        fit: boxFit,
        scale: scale,
      );

  ///Show image using base64 string
  Image getImageFromBase64({
    required ScreenUtil screenUtil,
    double? height,
    double? width,
    Color? imgColor,
    BoxFit? boxFit,
    double scale = 1.0,
  }) =>
      Image.memory(
        base64Decode(this),
        height: height != null ? screenUtil.setHeight(height) : null,
        width: width != null ? screenUtil.setWidth(width) : null,
        color: imgColor,
        fit: boxFit,
        scale: scale,
      );

  ///Show image using url
  CachedNetworkImage getNetworkURLImage({
    required ScreenUtil screenUtil,
    required double height,
    required double width,
    required ColorsInf colorsInf,
    BoxFit? boxFit,
    Color? overlayColor,
  }) =>
      CachedNetworkImage(
        color: overlayColor != null ? overlayColor : null,
        colorBlendMode: BlendMode.color,
        imageUrl: this,
        height: screenUtil.setHeight(height),
        width: screenUtil.setWidth(width),
        fit: boxFit,
        placeholder: (context, url) => CircularProgressIndicator(
          color: colorsInf.primaryColor,
        ),
        errorWidget: (context, url, error) => errorWidget(
          screenUtil: screenUtil,
          width: width,
          height: height,
        ),
      );

  ///Show Circular image using url
  Widget getCircularURLImage({
    required ScreenUtil screenUtil,
    required double height,
    required double width,
    required ColorsInf colorsInf,
    Widget? placeHolder,
  }) =>
      CachedNetworkImage(
        imageUrl: this,
        height: screenUtil.setHeight(height),
        width: screenUtil.setWidth(width),
        imageBuilder: (_, imgProvider) => Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: imgProvider,
              fit: BoxFit.cover,
            ),
          ),
        ),
        placeholder: (context, url) =>
            placeHolder ??
            CircularProgressIndicator(
              color: colorsInf.primaryColor,
            ),
        errorWidget: (context, url, error) => errorWidget(
          screenUtil: screenUtil,
          width: width,
          height: height,
        ),
      );

  ///Show Avatar image using url
  AvatarView getAvatarViewUrlImage({
    required ScreenUtil screenUtil,
    required double size,
    required ColorsInf colorsInf,
    Widget? placeHolder,
    AvatarType? avatarType,
  }) =>
      AvatarView(
        radius: size,
        borderColor: colorsInf.descriptionTextColor,
        avatarType: avatarType ?? AvatarType.CIRCLE,
        backgroundColor: colorsInf.primaryColor,
        imagePath: this,
        placeHolder: placeHolder ??
            Container(
              child: Icon(
                Icons.person,
                size: size,
              ),
            ),
      );
}

///Error widget for
Widget errorWidget({
  required ScreenUtil screenUtil,
  required double height,
  required double width,
}) =>
    Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: IC_ERROR
              .getImage(
                screenUtil: screenUtil,
                height: height,
                width: width,
              )
              .image,
          fit: BoxFit.contain,
        ),
      ),
    );
