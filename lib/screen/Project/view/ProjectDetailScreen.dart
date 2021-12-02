import 'package:devsload/components/widget/skill.dart';
import 'package:devsload/routes/app_pages.dart';
import 'package:devsload/styles/Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ProjectDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    List<dynamic> users = [
      {
        "image":
            "https://images.unsplash.com/photo-1603575448878-868a20723f5d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80",
        "username": "김순환",
        "location": "서울",
        "career": "3년차",
      },
      {
        "image":
            "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80",
        "username": "윤동진",
        "location": "광주",
        "career": "3년차",
      },
      {
        "image":
            "https://images.unsplash.com/photo-1603575448878-868a20723f5d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80",
        "username": "서동권",
        "location": "인천",
        "career": "15년차",
      },
      {
        "image":
            "https://images.unsplash.com/photo-1603575448878-868a20723f5d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80",
        "username": "김순환",
        "location": "서울",
        "career": "0년차",
      },
      {
        "image":
            "https://images.unsplash.com/photo-1603575448878-868a20723f5d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80",
        "username": "김순환",
        "location": "서울",
        "career": "3년차",
      },
      {
        "image":
            "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80",
        "username": "윤동진",
        "location": "광주",
        "career": "3년차",
      },
      {
        "image":
            "https://images.unsplash.com/photo-1603575448878-868a20723f5d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80",
        "username": "서동권",
        "location": "인천",
        "career": "15년차",
      },
      {
        "image":
            "https://images.unsplash.com/photo-1603575448878-868a20723f5d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80",
        "username": "김순환",
        "location": "서울",
        "career": "0년차",
      },
      {
        "image":
            "https://images.unsplash.com/photo-1603575448878-868a20723f5d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80",
        "username": "김순환",
        "location": "서울",
        "career": "3년차",
      },
      {
        "image":
            "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80",
        "username": "윤동진",
        "location": "광주",
        "career": "3년차",
      },
      {
        "image":
            "https://images.unsplash.com/photo-1603575448878-868a20723f5d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80",
        "username": "서동권",
        "location": "인천",
        "career": "15년차",
      },
      {
        "image":
            "https://images.unsplash.com/photo-1603575448878-868a20723f5d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80",
        "username": "김순환",
        "location": "서울",
        "career": "0년차",
      },
      {
        "image":
            "https://images.unsplash.com/photo-1603575448878-868a20723f5d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80",
        "username": "김순환",
        "location": "서울",
        "career": "3년차",
      },
      {
        "image":
            "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80",
        "username": "윤동진",
        "location": "광주",
        "career": "3년차",
      },
      {
        "image":
            "https://images.unsplash.com/photo-1603575448878-868a20723f5d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80",
        "username": "서동권",
        "location": "인천",
        "career": "15년차",
      },
      {
        "image":
            "https://images.unsplash.com/photo-1603575448878-868a20723f5d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80",
        "username": "김순환",
        "location": "서울",
        "career": "0년차",
      },
      {
        "image":
            "https://images.unsplash.com/photo-1603575448878-868a20723f5d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80",
        "username": "김순환",
        "location": "서울",
        "career": "3년차",
      },
      {
        "image":
            "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80",
        "username": "윤동진",
        "location": "광주",
        "career": "3년차",
      },
      {
        "image":
            "https://images.unsplash.com/photo-1603575448878-868a20723f5d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80",
        "username": "서동권",
        "location": "인천",
        "career": "15년차",
      },
      {
        "image":
            "https://images.unsplash.com/photo-1603575448878-868a20723f5d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80",
        "username": "김순환",
        "location": "서울",
        "career": "0년차",
      }
    ];

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
                  Stack(
                    children: [
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
                      Positioned(
                          left: 10.w,
                          top: 0.w,
                          child: IconButton(
                            icon: Icon(
                              Icons.arrow_back_ios_new_rounded,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Get.back();
                            },
                          )),
                    ],
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
                        Expanded(child: Container()),
                        CircularPercentIndicator(
                          radius: 50.w,
                          lineWidth: 5.w,
                          percent: 3 / 4,
                          circularStrokeCap: CircularStrokeCap.round,
                          progressColor: Colors.orange[300],
                          backgroundColor: Colors.white,
                          // fillColor: Colors.green,
                          center: Text(
                            " 75%",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontSize: 14.sp,
                            ),
                          ),
                        )
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
                  _projectItemTitle(title: '개발스택'),
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
                      _projectItemTitle(title: '개발일정'),
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
                          success: index % 2 == 0,
                          todo: '프로젝트 셋팅',
                          time: "2020년 5월 21일 11시 30분 ")).toList(),
                  SizedBox(height: 20.w),
                  _projectItemTitle(title: '프로젝트 참여리스트'),
                  SizedBox(height: 10.w),
                  Container(
                    child: Wrap(
                      spacing: 15.w,
                      runSpacing: 10.w,
                      children: [
                        ...List.generate(
                            users.length,
                            (index) => Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    CircleAvatar(
                                      radius: 16.w,
                                      backgroundImage:
                                          NetworkImage(users[index]['image']),
                                    ),
                                    SizedBox(height: 3.w),
                                    Text(
                                      users[index]['username'],
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 8.sp,
                                      ),
                                    ),
                                    SizedBox(height: 3.w),
                                    Text(
                                      users[index]['location'] +
                                          " / " +
                                          users[index]['career'],
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 6.sp,
                                      ),
                                    ),
                                  ],
                                )).toList(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed("${Routes.CHATROOM}/314");
              },
              behavior: HitTestBehavior.translucent,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.indigoAccent,
                  borderRadius: BorderRadius.circular(5.w),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2.w,
                      blurRadius: 7.w,
                      offset: Offset(0, 3.w), //
                    ),
                  ],
                ),
                margin: EdgeInsets.symmetric(
                  horizontal: 20.w,
                  vertical: 10.w,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                  vertical: 10.w,
                ),
                child: Container(
                  child: Text(
                    '프로젝트 참여 신청',
                    style: TextStyle(
                      fontSize: 14.w,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  alignment: Alignment.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Text _projectItemTitle({required String title}) {
    return Text(
      title,
      style: TextStyle(
        color: Colors.black87,
        fontSize: 13.sp,
        fontWeight: FontWeight.w500,
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
              Expanded(child: Container()),
              success
                  ? Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.w),
                      decoration: BoxDecoration(
                        color: Colors.greenAccent,
                        // borderRadius: BorderRadius.circular(3.w),
                      ),
                      child: Text(
                        '진행완료',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 7.sp,
                          color: Colors.black87,
                        ),
                      ),
                    )
                  : Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.w),
                      decoration: BoxDecoration(
                        color: Colors.amber[900],
                        // borderRadius: BorderRadius.circular(3.w),
                      ),
                      child: Text(
                        '진행중',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 7.sp,
                          color: Colors.black87,
                        ),
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
