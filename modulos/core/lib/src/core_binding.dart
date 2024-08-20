import 'package:dependencies/dependencies.dart';

class CoreBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<CoreController>(
      CoreController(),
    );
  }
}