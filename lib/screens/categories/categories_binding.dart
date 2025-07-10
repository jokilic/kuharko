import 'package:get/get.dart';

import 'categories_controller.dart';

class CategoriesBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CategoriesController());
  }
}
