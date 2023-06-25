import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sample_app/app/util/pallete.dart';

import '../controllers/detail_task_controller.dart';

class DetailTaskView extends GetView<DetailTaskController> {
  const DetailTaskView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.find<DetailTaskController>();
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 28,),
                InkWell(
                  onTap: ()=>Get.back(),
                  child: Icon(CupertinoIcons.chevron_left,color: primary,size: 30,),
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Task Preview',style: TextStyle(fontSize: 24,color: primary,fontWeight: FontWeight.w600),),
                    InkWell(
                      onTap: controller.Delete,
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: primary.withOpacity(.05)
                        ),
                        child: Icon(CupertinoIcons.delete,color: primary,size: 22,),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 40,),
                Text('Task',style: TextStyle(fontWeight: FontWeight.w300),),
                SizedBox(height: 4,),
                Text(controller.task.value,style: TextStyle(fontWeight: FontWeight.w300,fontSize: 20),),
                SizedBox(height: 16,),
                Divider(),
                SizedBox(height: 24,),
                Text('Type',style: TextStyle(fontWeight: FontWeight.w300),),
                SizedBox(height: 4,),
                Text(controller.type.value,style: TextStyle(fontWeight: FontWeight.w300,fontSize: 20),),
                SizedBox(height: 16,),
                Divider(),
                SizedBox(height: 24,),
                Text('Priority',style: TextStyle(fontWeight: FontWeight.w300),),
                SizedBox(height: 4,),
                Text(controller.priority.value,style: TextStyle(fontWeight: FontWeight.w300,fontSize: 20),),
                SizedBox(height: 16,),
                Divider(),
                SizedBox(height: 24,),
                Text('Timeframe',style: TextStyle(fontWeight: FontWeight.w300),),
                SizedBox(height: 4,),
                Text(controller.timeFrame.value,style: TextStyle(fontWeight: FontWeight.w300,fontSize: 20),),
                SizedBox(height: 16,),
                Divider(),
                SizedBox(height: 24,),
                Text('Description',style: TextStyle(fontWeight: FontWeight.w300),),
                SizedBox(height: 4,),
                Text(controller.description.value,style: TextStyle(fontWeight: FontWeight.w300,fontSize: 20),),
                // Text(controller.task!.value)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
