import 'package:get/get.dart';
import 'package:weatherflutter/models/controller.dart';

class LocationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LocationController>(() => LocationController());
  }
}
