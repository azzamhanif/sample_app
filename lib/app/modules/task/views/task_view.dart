import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sample_app/app/modules/home/controllers/home_controller.dart';
import 'package:sample_app/app/routes/app_pages.dart';
import 'package:sample_app/app/util/pallete.dart';

import '../controllers/task_controller.dart';

class TaskView extends GetView<TaskController> {
  const TaskView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find<HomeController>();
    return Scaffold(
      body: Obx(() => Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Task',style: TextStyle(fontSize: 24,color: primary,fontWeight: FontWeight.w600),),
                            Padding(
                              padding: const EdgeInsets.only(left: 4),
                              child: Text(homeController.data.length.toString()+' Task',style: TextStyle(fontSize: 14,color: subtitle),),
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: ()=>Get.toNamed(Routes.ADD_TASK),
                          child: Icon(Icons.add_circle_rounded,color: primary,size: 40,))
                      ],
                    ),
                    SizedBox(height: 32,),
                  ],
                ),
              ),
              if(homeController.data.isEmpty)
                SliverToBoxAdapter(
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: primary.withOpacity(.05),
                    ),
                    child: Center(child: Text('No Task Available Now',style: TextStyle(color: primary,fontWeight: FontWeight.w600),)),
                  ),
                ),
              if(homeController.data.isNotEmpty)
                SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) => InkWell(
                    onTap: ()=>Get.toNamed(Routes.DETAIL_TASK,arguments: {
                      'index':index,
                      'task':homeController.data[index].task,
                      'type':homeController.data[index].type,
                      'description':homeController.data[index].description,
                      'timeFrame':homeController.data[index].timeframe,
                      'priority':homeController.data[index].priority,

                    }),
                    child: Container(
                      margin: EdgeInsets.only(bottom: 16),
                      padding: EdgeInsets.symmetric(horizontal: 16,vertical: 24),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Colors.white,
                              primary3
                            ]
                        )
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(homeController.data[index].task!,style: TextStyle(fontSize: 16,overflow: TextOverflow.ellipsis),),
                                SizedBox(height: 8,),
                                Text(homeController.data[index].timeframe!,style: TextStyle(fontSize: 12,color: subtitle),),
                              ],
                            )
                          ),
                          Icon(CupertinoIcons.chevron_right,color: primary,)
                        ],
                      ),
                    ),
                  ),childCount: homeController.data.length)
                )
            ],
          ),
        ),
      ),
    ));
  }
}
