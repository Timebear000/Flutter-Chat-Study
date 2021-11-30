import 'package:devsload/components/widget/skill.dart';
import 'package:devsload/routes/app_pages.dart';
import 'package:devsload/styles/Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProjectScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.BackGroundColor,
      body: NestedScrollView(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.only(bottom: 18.w),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 30.w,
              ),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemBuilder: (_, index) {
                    return GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        Get.toNamed("${Routes.PROJECT_DETAIL}/1234");
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.w),
                          color: Colors.blue[100],
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        margin: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 10.w),
                        width: double.infinity,
                        height: 140.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10.w),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 17.w,
                                    backgroundColor: Colors.white,
                                    child: CircleAvatar(
                                        radius: 15.w,
                                        backgroundImage: NetworkImage(
                                          "https://images.unsplash.com/photo-1603575448878-868a20723f5d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80",
                                        )),
                                  ),
                                  SizedBox(width: 10.w),
                                  Expanded(
                                      child: Text(
                                    '자바스크립트 교육프로젝트 및 플러터 교육방 cpzmcmlmcalmclewm',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  )),
                                ],
                              ),
                            ),
                            SizedBox(height: 10.w),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                '자바 스크립트 초보들을 위한 개발자 양성 프로젝트 입니다.\n 같이 협조해주실 경력자 분들을 구합니다.\n자바 스크립트 초보들을 위한 개발자 양성 프로젝트 입니다.멍멍\n 같이 협조해주실 경력자 분들을 구합니다.자바 스크립트 초보들을 위한 개발자 양성 프로젝트 입니다.\n 같이 협조해주실 경력자 분들을 구합니다.자바 스크립트 초보들을 위한 개발자 양성 프로젝트 입니다.\n 같이 협조해주실 경력자 분들을 구합니자바 스크립트 초보들을 위한 개발자 양성 프로젝트 입니다.\n 같이 협조해주실 경력자 분들을 구합니다.자바 스크립트 초보들을 위한 개발자 양성 프로젝트 입니다.\n 같이 협조해주실 경력자 분들을 구합니다.다.',
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  height: 1.2,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            SizedBox(height: 10.w),
                            Container(
                              padding: EdgeInsets.only(right: 10.w),
                              width: double.infinity,
                              height: 18.w,
                              child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: 12,
                                itemBuilder: (_, index) => Container(
                                  margin: EdgeInsets.only(
                                    left: index == 0 ? 10.w : 0,
                                  ),
                                  height: 18.w,
                                  child: Center(
                                    child: Skill(
                                      skill: "React Native",
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 5.w, vertical: 2.w),
                                      magin: EdgeInsets.only(right: 3.w),
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: 20,
                ),
              ),
            ],
          ),
        ),
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxISScrollerd) =>
            [_projectAppBar()],
      ),
    );
  }

  SliverAppBar _projectAppBar() {
    return SliverAppBar(
      backgroundColor: Colors.indigoAccent[700],
      floating: true,
      automaticallyImplyLeading: false,
      pinned: true,
      snap: false,
      centerTitle: false,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20.w),
        ),
      ),
      stretch: true,
      title: Text('프로젝트'),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(65.w),
        child: Container(
            decoration: BoxDecoration(
              color: Colors.indigoAccent[700],
              borderRadius: BorderRadius.circular(30.w),
            ),
            width: double.infinity,
            height: 65.w,
            padding: EdgeInsets.only(bottom: 20.w, left: 20.w, right: 20.w),
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.w),
                ),
                height: 45,
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Search for something',
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
