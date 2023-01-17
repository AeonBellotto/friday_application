import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
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

  @override
  void initState() {
    getAddress(globalController.getLattitude().value,
        globalController.getLongitude().value);
    super.initState();
  }

  getAddress(latitude, longitude) async {
    List<Placemark> placemark =
        await placemarkFromCoordinates(latitude, longitude);
    Placemark place = placemark[0];
    setState(() {
      city = place.locality!;
      country = place.isoCountryCode!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.place_outlined, size: 18, color: Colors.white54),
        const Text(
          " ",
          style: const TextStyle(fontSize: 15, color: Colors.white54),
        ),
        Text(
          city,
          style: const TextStyle(fontSize: 15, color: Colors.white54),
        ),
        const Text(
          ", ",
          style: const TextStyle(fontSize: 15, color: Colors.white54),
        ),
        Text(
          country,
          style: const TextStyle(fontSize: 15, color: Colors.white54),
        ),
      ],
    );
  }
}
