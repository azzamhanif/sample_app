import 'package:get/get.dart';
import 'package:sample_app/app/data/models/task_model.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  RxList<Task> data = <Task>[].obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
