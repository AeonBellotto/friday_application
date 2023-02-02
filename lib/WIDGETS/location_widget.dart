import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:friday_application/UTILITIES/theme.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:location_geocoder/location_geocoder.dart';
import '../CONTROLLER/global_controller.dart';

class LocationWidget extends StatefulWidget {
  const LocationWidget({super.key});

  @override
  State<LocationWidget> createState() => _LocationWidgetState();
}

class _LocationWidgetState extends State<LocationWidget> {
  String city = "";
  String country = "";

  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);

  static String _apiKey = "AIzaSyB3SZ7M8QX8nYTgZvMykZ3NYNwTxjIdrKY";
  late LocatitonGeocoder geocoder = LocatitonGeocoder(_apiKey);

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _getAddress(globalLat, globalLng);
      });
    });
  }

  /*
    @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _getAddress(globalController.getLattitude().value,
            globalController.getLongitude().value);
        double test = globalController.getLattitude().value;
        print("Lat in LOCWID : $test");
      });
    });
  }
  */

  getAddress(latitude, longitude) async {
    List<Placemark> placemark =
        await placemarkFromCoordinates(latitude, longitude);
    Placemark place = placemark[0];
    setState(() {
      city = place.locality!;
      country = place.isoCountryCode!;
    });
  }

  ///converts `coordinates` to actual `address` using google map api
  _getAddress(latitude, longitude) async {
    final address = await geocoder
        .findAddressesFromCoordinates(Coordinates(latitude, longitude));
    setState(() {
      city = address.first.locality!;
      country = address.first.countryCode!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.place_outlined, size: 18, color: baseColor.withOpacity(0.5)),
        Text(
          " ",
          style: TextStyle(fontSize: 15, color: baseColor.withOpacity(0.5)),
        ),
        Text(
          city,
          style: TextStyle(fontSize: 15, color: baseColor.withOpacity(0.5)),
        ),
        Text(
          ", ",
          style: TextStyle(fontSize: 15, color: baseColor.withOpacity(0.5)),
        ),
        Text(
          country,
          style: TextStyle(fontSize: 15, color: baseColor.withOpacity(0.5)),
        ),
      ],
    );
  }
}
