import 'package:get/get.dart';
import 'package:sample_app/app/modules/home/controllers/home_controller.dart';

import '../controllers/detail_task_controller.dart';

class DetailTaskBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailTaskController>(
      () => DetailTaskController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
