import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_app/app/modules/home/controllers/home_controller.dart';
import 'package:sample_app/app/util/pallete.dart';

class DetailTaskController extends GetxController {
  //TODO: Implement DetailTaskController
  var task = ''.obs;
  var priority = ''.obs;
  var type = ''.obs;
  var timeFrame = ''.obs;
  var description = ''.obs;
  var index = 0.obs;
  HomeController homeController = Get.find<HomeController>();

  void LoadData(){
    index.value = Get.arguments['index'];
    task.value = Get.arguments['task'];
    priority.value = Get.arguments['priority'];
    type.value = Get.arguments['type'];
    timeFrame.value = Get.arguments['timeFrame'];
    description.value = Get.arguments['description'];
    print(task);
  }

  void Delete({title = 'Coution', body = 'Are you sure want to delete this file ?'}){
    Get.dialog(
      // barrierDismissible: false,
        Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.help_outline,color: primary,size: 60,),
                SizedBox(height: 16,),
                Center(
                  child: Text(title,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Color(
                      0xff252525)),),
                ),
                SizedBox(height:8,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(body,style: TextStyle(fontSize: 12,color: Color(
                      0xff4d4d4d)),),
                ),
                SizedBox(height: 16,),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          homeController.data.removeAt(index.value);
                          Get.back();
                          Get.back();
                          Get.snackbar('Success', 'Data has been deleted');
                        }, child: Center(
                        child: Container(
                          // height:50,
                          padding: EdgeInsets.all(8),
                          width: 100,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              border: Border.all(color: primary),
                              borderRadius: const BorderRadius.all(Radius.circular(10))
                          ),
                          child: Text(
                            "Yes",style: TextStyle(color: primary),
                          ),
                        ),
                      ),),
                      SizedBox(width: 8,),

                      InkWell(
                        onTap: () {
                          Get.back();
                        }, child: Center(
                        child: Container(
                          // height:50,
                          padding: EdgeInsets.all(8),
                          width: 100,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: primary,
                              borderRadius: const BorderRadius.all(Radius.circular(10))
                          ),
                          child: Text(
                            "No", style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),),
                    ],
                  ),
                ),

              ],
            ),
          ),
        )
    );
  }


  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    LoadData();
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
