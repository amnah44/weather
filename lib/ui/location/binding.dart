import 'package:get/get.dart';
import 'package:weatherflutter/ui/location/controller.dart';

class LocationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LocationController>(() => LocationController(city: 'baghdad'));
  }
}
