import 'dart:async';

import 'package:example_app/core/base/screen/base_bloc_widget.dart';
import 'package:example_app/core/localizations/localization_extension.dart';
import 'package:example_app/core/ui/theme/text_style_extension/text_style_extension.dart';
import 'package:example_app/core/ui/widgets/loading_indicator.dart';
import 'package:example_app/core/util/permission_util/permission_util.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../../core/const/string_constants.dart';
import '../../../../../core/localizations/app_localizations.dart';

class GoogleMapExampleScreen extends BaseBlocWidget {
  @override
  State<GoogleMapExampleScreen> createState() => _GoogleMapExampleScreenState();
}

class _GoogleMapExampleScreenState
    extends BaseBlocWidgetState<GoogleMapExampleScreen> {
  /// Declare the GoogleMapController like below
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  LatLng defaultLatLng = LatLng(37.42796133580664, -122.085749655962);
  Set<Marker> _markers = {};

  /// Location permission handling and get current location LatLng
  Future<LatLng> getCurrentLocationLatLong() async {
    bool isPermissionGranted = await PermissionUtil().getLocationPermission(
        context: context,
        permissionDescriptionText: context.tr(LABEL_LOCATION_PERMISSION_DESC),
        screenUtil: screenUtil,
        appColors: appColors);
    if (isPermissionGranted) {
      /// fetch LatLng using the geoLocator
      final position = await GeolocatorPlatform.instance.getCurrentPosition();
      defaultLatLng = LatLng(position.latitude, position.longitude);

      /// add marker to the current location
      _markers.add(Marker(
          markerId: MarkerId("1"), draggable: true, position: defaultLatLng));
      return LatLng(position.latitude, position.longitude);
    } else {
      return defaultLatLng;
    }
  }

  @override
  Widget getCustomBloc() => Scaffold(
        backgroundColor: appColors.screenBgColor,
        appBar: AppBar(
          title: context.tr(LABEL_GOOGLE_MAP_EXAMPLE)
              .getWhiteColor17W500Inter(
                screenUtil: screenUtil,
                appColors: appColors,
              ),
        ),
        body: FutureBuilder<LatLng>(
          future: getCurrentLocationLatLong(),
          builder: (_, snapshot) {
            if (snapshot.hasData) {
              return Stack(
                children: [
                  GoogleMap(
                    mapType: MapType.normal,
                    // change mapType
                    markers: _markers,
                    // assign markers
                    compassEnabled: true,
                    mapToolbarEnabled: true,
                    zoomControlsEnabled: true,
                    scrollGesturesEnabled: true,
                    myLocationEnabled: true,
                    initialCameraPosition: CameraPosition(
                      target: defaultLatLng,
                    ),
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                  ),
                ],
              );
            }
            return CommonCircularProgressIndicator(
              screenUtil: screenUtil,
              appColors: appColors,
            );
          },
        ),
      );
}
