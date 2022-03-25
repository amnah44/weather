import 'package:get/get.dart';
import 'package:weatherflutter/ui/controller.dart';

class LocationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Controller>(() => Controller(city: 'baghdad'));
  }
}
