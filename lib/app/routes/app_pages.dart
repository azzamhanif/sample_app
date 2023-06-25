import 'package:get/get.dart';

import '../modules/add_task/bindings/add_task_binding.dart';
import '../modules/add_task/views/add_task_view.dart';
import '../modules/detail_task/bindings/detail_task_binding.dart';
import '../modules/detail_task/views/detail_task_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/task/bindings/task_binding.dart';
import '../modules/task/views/task_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.TASK,
      page: () => const TaskView(),
      binding: TaskBinding(),
    ),
    GetPage(
      name: _Paths.ADD_TASK,
      page: () => const AddTaskView(),
      binding: AddTaskBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_TASK,
      page: () => const DetailTaskView(),
      binding: DetailTaskBinding(),
    ),
  ];
}
