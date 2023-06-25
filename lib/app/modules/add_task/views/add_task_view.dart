import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sample_app/app/util/pallete.dart';

import '../controllers/add_task_controller.dart';

class AddTaskView extends GetView<AddTaskController> {
  const AddTaskView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 28,),
                  InkWell(
                    onTap: ()=>Get.back(),
                    child: Icon(CupertinoIcons.chevron_left,color: primary,size: 30,),
                  ),
                  SizedBox(height: 20,),
                  Text('New Task',style: TextStyle(fontSize: 24,color: primary,fontWeight: FontWeight.w600),),
                  SizedBox(height: 32,),
                  Text('Task',style: TextStyle(fontSize: 16),),
                  SizedBox(height: 4,),
                  TextFormField(
                      keyboardType: TextInputType.text,
                      controller: controller.taskController,
                      style: TextStyle(fontSize: 13,color: greyscale),
                      validator: (value)=>controller.TaskValidator(value!),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Title',
                        hintStyle: TextStyle(color: subtitle,fontSize: 13),
                        contentPadding:
                        const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: primary),
                          borderRadius: BorderRadius.circular(9),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: primary),
                          borderRadius: BorderRadius.circular(9),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: primary),
                          borderRadius: BorderRadius.circular(9),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: primary),
                          borderRadius: BorderRadius.circular(9),
                        ),
                      )
                  ),
                  SizedBox(height: 24,),

                  Text('Type',style: TextStyle(fontSize: 16),),
                  SizedBox(height: 4,),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: primary)
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        hint: Text('Select Type'),
                        // isDense: true,
                        isExpanded: true,
                        value: controller.typeValue!.value,
                        onChanged: (value){
                          controller.typeValue!.value = value!;
                        },
                        items: controller.types.map((data) => DropdownMenuItem<String>(
                          child: Text(data,style: TextStyle(fontSize: 13),),
                          value: data,
                        )).toList(),
                      ),
                    ),
                  ),
                  SizedBox(height: 24,),

                  Text('Priority',style: TextStyle(fontSize: 16),),
                  SizedBox(height: 4,),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: primary)
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        hint: Text('Select Priority'),
                        // isDense: true,
                        isExpanded: true,
                        value: controller.priorityValue!.value,
                        onChanged: (value){
                          controller.priorityValue!.value = value!;
                        },
                        items: controller.priorities.map((data) => DropdownMenuItem<String>(
                          child: Text(data,style: TextStyle(fontSize: 13),),
                          value: data,
                        )).toList(),
                      ),
                    ),
                  ),
                  SizedBox(height: 24,),

                  Text('Timeframe',style: TextStyle(fontSize: 16),),
                  SizedBox(height: 4,),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: primary)
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        hint: Text('Select Timeframe'),
                        // isDense: true,
                        isExpanded: true,
                        value: controller.timeFramesValue!.value,
                        onChanged: (value){
                          controller.timeFramesValue!.value = value!;
                        },
                        items: controller.timeFrames.map((data) => DropdownMenuItem<String>(
                          child: Text(data,style: TextStyle(fontSize: 13),),
                          value: data,
                        )).toList(),
                      ),
                    ),
                  ),
                  SizedBox(height: 24,),

                  Text('Description',style: TextStyle(fontSize: 16),),
                  SizedBox(height: 4,),
                  SizedBox(
                    height: 100,
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      maxLines: 6,
                      controller: controller.descriptionController,
                      style: TextStyle(fontSize: 13,color: greyscale),
                      validator: (value)=>controller.DescriptionValidator(value!),
                      decoration: InputDecoration(
                        enabled: true,
                        filled: true,
                        fillColor: Colors.white,
                        // hintText: 'Description task',
                        hintStyle: TextStyle(color: subtitle,fontSize: 13),
                        contentPadding:
                        const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: primary),
                          borderRadius: BorderRadius.circular(9),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: primary),
                          borderRadius: BorderRadius.circular(9),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: primary),
                          borderRadius: BorderRadius.circular(9),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: primary),
                          borderRadius: BorderRadius.circular(9),
                        ),
                      )
                    ),
                  ),
                  SizedBox(height: 64,),
                  InkWell(
                    onTap: ()=>controller.AddTask(),
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: primary,
                        borderRadius: BorderRadius.circular(12)
                      ),
                      child: Center(
                        child: Text('Submit',style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w600),),
                      ),
                    ),
                  ),
                  SizedBox(height: 24,)
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
