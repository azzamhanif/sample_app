import 'package:get/get.dart';
import 'package:sample_app/app/modules/home/controllers/home_controller.dart';

import '../controllers/task_controller.dart';

class TaskBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TaskController>(
      () => TaskController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
