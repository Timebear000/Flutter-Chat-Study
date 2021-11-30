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
        child: SingleChildScrollView(
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
                          Container(
                            padding: EdgeInsets.all(5.w),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 3.w,
                                color: Colors.white,
                              ),
                              shape: BoxShape.circle,
                            ),
                            child: CircleAvatar(
                              radius: 25.w,
                              backgroundImage: NetworkImage(
                                "https://images.unsplash.com/photo-1603575448878-868a20723f5d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80",
                              ),
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Text(
                            'Kim YoHwan',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Expanded(child: Container()),
                          Text(
                            'at 2021.01.13',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.bold,
                            ),
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
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                          height: 1.4,
                        ),
                      ),
                    ),
                    SizedBox(height: 30.w),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
