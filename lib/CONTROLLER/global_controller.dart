import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../API/fetch_weather.dart';
import '../MODEL/weather_data.dart';

double globalLat = 45.4646227438477;
double globalLng = 9.192131254722357;

class GlobalController extends GetxController {
  // create various variables
  final RxBool _isLoading = true.obs;
  final RxDouble _latitude = 0.0.obs;
  final RxDouble _longitude = 0.0.obs;
  final RxInt _currentIndex = 0.obs;

  // instance for them to be called
  RxBool checkLoading() => _isLoading;
  RxDouble getLattitude() => _latitude;
  RxDouble getLongitude() => _longitude;

  final weatherData = WeatherData().obs;
  final bool enableGPS = false;

  WeatherData getData() {
    return weatherData.value;
  }

  @override
  void onInit() {
    if (_isLoading.isTrue) {
      getLocationGPS();
    } else if (enableGPS == false) {
      _latitude.value = globalLat;
      _longitude.value = globalLng;
      //getLocationMAN();
    } else {
      getIndex();
    }
    super.onInit();
  }

  getLocationGPS() async {
    bool isServiceEnabled;
    LocationPermission locationPermission;

    isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    // return if serivce is not enabled
    if (!isServiceEnabled) {
      return Future.error("Location not enabled");
    }

    // status of permission request
    locationPermission = await Geolocator.checkPermission();

    if (locationPermission == LocationPermission.deniedForever) {
      return Future.error("Location permisssion are denied forever");
    } else if (locationPermission == LocationPermission.denied) {
      // Request a new permission
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) {
        return Future.error("Location permisssion are denied");
      }
    }

    // getting the current position
    return await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high)
        .then((value) {
      // update our lattitude and longitude
      _latitude.value = value.latitude;
      _longitude.value = value.longitude;
      // calling our weather API
      return FetchWeatherAPI()
          .processData(globalLat,
              globalLng) // processData(value.latitude, value.longitude)
          .then((value) {
        weatherData.value = value;
        _isLoading.value = false;
      });
    });
  }

  getLocationMAN() async {
    // calling our weather API
    FetchWeatherAPI()
        .processData(globalLat,
            globalLng) // processData(value.latitude, value.longitude)
        .then((value) {
      weatherData.value = value;
      _isLoading.value = false;
    });
  }

  RxInt getIndex() {
    return _currentIndex;
  }
}
