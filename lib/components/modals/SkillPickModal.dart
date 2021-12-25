import 'package:devsload/models/skill.dart';
import 'package:devsload/services/AppCommonService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SkillPickModal extends StatefulWidget {
  List<SkillModel> list;
  SkillPickModal({required this.list});

  @override
  State<SkillPickModal> createState() => _SkillPickModalState();
}

class _SkillPickModalState extends State<SkillPickModal> {
  @override
  Widget build(BuildContext context) {
    List<SkillModel> skill_list = AppCommonService.to.skill_list;
    return Dialog(
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0.w)),
      child: Container(
          width: 200.w,
          height: 340.w,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.w),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3,
                blurRadius: 1,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            children: [
              Container(
                // padding: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 10.w),
                    Text('스택 목록 리스트',
                        style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                    Expanded(child: Container()),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.add_rounded),
                      iconSize: 20.sp,
                      color: Colors.white,
                      padding: EdgeInsets.zero,
                    ),
                    IconButton(
                      onPressed: () {
                        Get.back(result: widget.list);
                      },
                      icon: Icon(Icons.check_rounded),
                      iconSize: 20.sp,
                      color: Colors.white,
                      padding: EdgeInsets.zero,
                    ),
                    SizedBox(width: 10.w),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  // height: 300.w,
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: ListView.builder(
                    itemCount: skill_list.length,
                    itemBuilder: (_, index) {
                      return GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          if (widget.list.contains(skill_list[index])) {
                            widget.list.remove(skill_list[index]);
                            setState(() {});
                          } else {
                            widget.list.add(skill_list[index]);
                            setState(() {});
                          }
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 10.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 10.w,
                                child: widget.list.contains(skill_list[index])
                                    ? Icon(
                                        Icons.check_circle_outline,
                                        color: Colors.green,
                                      )
                                    : Icon(
                                        Icons.circle_outlined,
                                        color: Colors.blue,
                                      ),
                              ),
                              SizedBox(width: 10.w),
                              Container(child: Text(skill_list[index].name)),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
