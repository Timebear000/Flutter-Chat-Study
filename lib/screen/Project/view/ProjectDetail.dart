import 'package:devsload/components/widget/skill.dart';
import 'package:devsload/styles/Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProjectDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: AppColor.BackGroundColor,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.only(bottom: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              color: Colors.indigoAccent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: statusBarHeight),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(vertical: 10.w),
                    child: Text(
                      '플러터 공부하자!',
                      style: TextStyle(
                        fontSize: 18.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 25.w,
                          backgroundImage: NetworkImage(
                            "https://images.unsplash.com/photo-1603575448878-868a20723f5d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80",
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Kim YoHwan',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            //      Expanded(child: Container()),
                            Text(
                              '서울 / 3년차',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.w),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Text(
                      '플러터 개발자 교육자료를 만들기 위한 프로젝트\n경력많은 개발자 분들 많은 참여 부탁드립니다.\n같이 개발자 양성 및 육성에 많은 도움 바랍니다.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w600,
                        height: 1.4,
                      ),
                    ),
                  ),
                  SizedBox(height: 30.w),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                children: [
                  SizedBox(height: 10.w),
                  Text('스택'),
                  SizedBox(height: 10.w),
                  Wrap(
                    spacing: 2.w,
                    runSpacing: 2.w,
                    children: [
                      ...List.generate(
                        10,
                        (index) => Skill(skill: 'C+'),
                      )
                    ],
                  ),
                  SizedBox(height: 20.w),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('개발 일정'),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.keyboard_arrow_down_rounded,
                            color: Colors.blue[900]),
                      )
                    ],
                  ),
                  SizedBox(height: 10.w),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 5.w,
                      ),
                      SizedBox(width: 10.w),
                      Text('이미지 업로드 S3 '),
                      Expanded(child: Container()),
                      Text('진행중..'),
                    ],
                  ),
                  SizedBox(height: 10.w),
                  ...List.generate(
                      5,
                      (index) => _todoItem(
                          success: index % 2 == 0, todo: '프로젝트 셋팅')).toList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _todoItem(
      {required bool success, required String todo, String? time}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              success
                  ? Icon(
                      Icons.check_circle_outline_rounded,
                      color: Colors.green,
                      size: 16.w,
                    )
                  : Icon(
                      Icons.check_box_outline_blank_rounded,
                      color: Colors.amber[800],
                      size: 16.w,
                    ),
              SizedBox(width: 5.w),
              Text(
                todo,
                style: TextStyle(
                  color: success ? Colors.grey[500] : Colors.black87,
                  fontSize: 12.sp,
                ),
              ),
            ],
          ),
          SizedBox(height: 1.w),
          time != null
              ? Row(
                  children: [
                    SizedBox(width: 21.w),
                    Text(time,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 8.sp,
                        )),
                  ],
                )
              : Container(),
        ],
      ),
    );
  }
}
