import 'package:get/get.dart';
import 'package:weatherflutter/weather/presentation/ui/controller.dart';

class LocationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Controller>(() => Controller(city: 'baghdad'));
  }
}
