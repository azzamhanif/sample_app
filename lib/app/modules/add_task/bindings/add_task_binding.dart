import 'package:get/get.dart';
import 'package:sample_app/app/modules/home/controllers/home_controller.dart';

import '../controllers/add_task_controller.dart';

class AddTaskBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddTaskController>(
      () => AddTaskController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
