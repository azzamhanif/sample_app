import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:sample_app/app/routes/app_pages.dart';
import 'package:sample_app/app/util/pallete.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => Container(
        margin: EdgeInsets.symmetric(horizontal: 16),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 32,),
                Text('Sample App',style: TextStyle(fontSize: 32,fontWeight: FontWeight.w600,color: primary),),
                SizedBox(height: 40,),
                InkWell(
                  onTap: ()=>Get.toNamed(Routes.TASK),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 24,vertical: 20),
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
                        // SvgPicture.asset('assets/icons/emojis.svg',),
                        Image.asset('assets/images/emojis.png'),
                        SizedBox(width: 24,),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Task',
                                style: TextStyle(fontSize: 22,color: greyscale3),
                              ),
                              Text(
                                controller.data.length.toString()+' Task',
                                style: TextStyle(fontSize: 14,color: subtitle),
                              ),
                            ],
                          ),
                        ),
                        Icon(CupertinoIcons.chevron_right,color: primary,)

                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ),
      ),
    ));
  }
}
