import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_app/app/data/models/task_model.dart';
import 'package:sample_app/app/modules/home/controllers/home_controller.dart';
import 'package:sample_app/app/routes/app_pages.dart';

class AddTaskController extends GetxController {
  //TODO: Implement AddTaskController
  // var typeValue = 'Work'.obs;
  RxString? typeValue = 'Work'.obs;
  RxString? priorityValue = 'Needs done'.obs;
  RxString? timeFramesValue = 'None'.obs;
  HomeController homeController = Get.find<HomeController>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late TextEditingController taskController;
  late TextEditingController descriptionController;

  List<String> types = [
    'Work',
    'Personal project',
    'Self'
  ];

  List<String> priorities = [
    'Needs done',
    'Nice to have',
    'Nice idea'
  ];

  List<String> timeFrames = [
    'None',
    'Today',
    '3 Days',
    'Week',
    'Fortnight',
    'Month',
    '90 Days',
    'Year',
  ];

  String? TaskValidator(String? value){
    if(taskController.text.isEmpty)
      return 'Task cannot be empty';
    return null;
  }

  String? DescriptionValidator(String? value){
    if(descriptionController.text.isEmpty)
      return 'Description cannot be empty';
    return null;
  }

  void AddTask(){
    var isValid = formKey.currentState!.validate();
    if(isValid){
      homeController.data.add(Task(
        task: taskController.text,
        priority: priorityValue!.value,
        description: descriptionController.text,
        timeframe: timeFramesValue!.value,
        type: typeValue!.value,
      ));
      Get.back();
    }

  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    taskController = TextEditingController();
    descriptionController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    taskController.dispose();
    descriptionController.dispose();
  }

  void increment() => count.value++;
}
