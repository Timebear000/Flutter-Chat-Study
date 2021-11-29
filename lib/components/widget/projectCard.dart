import 'package:devsload/styles/Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProjectCard extends StatelessWidget {
  final List<dynamic> projectList;
  final PageController page_controller;

  const ProjectCard({
    required this.page_controller,
    required this.projectList,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: 180.w,
            child: PageView.builder(
              itemCount: projectList.length,
              controller: page_controller,
              itemBuilder: (_, index) {
                return Container(
                  color: Colors.transparent,
                  padding:
                  EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.w),
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    padding: EdgeInsets.all(10.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.w),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 15.w,
                            ),
                            SizedBox(width: 5.w),
                            Text(
                              projectList[index].projectName,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black54,
                                fontSize: 13.sp,
                              ),
                            ),
                            Expanded(child: Container()),
                            Icon(
                              Icons.group,
                              color: AppColor.mainColor,
                            ),
                            Text(
                              projectList[index].developer.length,
                              style: TextStyle(
                                fontSize: 13.sp,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5.w),
                        Container(
                          child: Text(
                            projectList[index].desc,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 13.sp,
                              color: Colors.grey[400],
                              height: 1.3,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        SizedBox(height: 10.w),
                        Row(
                          children: List.generate(
                            3,
                                (index) {
                              var value = (projectList[index].todoSuccessCount /
                                  projectList[index].todoList.length) *
                                  100;
                              return Expanded(
                                child: Column(
                                  children: [
                                    Container(
                                      height: 3.w,
                                      decoration: BoxDecoration(
                                        color: (index >= 1)
                                            ? Colors.grey[100]
                                            : Colors.greenAccent,
                                        borderRadius: index == 0 ||
                                            index ==
                                                projectList[index]
                                                    .todoList
                                                    .length
                                            ? BorderRadius.horizontal(
                                          left: index == 0
                                              ? Radius.circular(3.w)
                                              : Radius.zero,
                                          right: index ==
                                              projectList[index]
                                                  .todoList
                                                  .length
                                              ? Radius.circular(3.w)
                                              : Radius.zero,
                                        )
                                            : null,
                                      ),
                                      width: double.infinity,
                                    ),
                                    SizedBox(height: 5.w),
                                    index == 0
                                        ? Container(
                                      height: 13.w,
                                      width: double.infinity,
                                      child: Text(
                                        '${value.toStringAsFixed(2)}%',
                                        style: TextStyle(
                                            fontSize: 11.sp,
                                            color: Colors.grey[300]),
                                      ),
                                      alignment: Alignment.centerRight,
                                    )
                                        : Container(
                                      height: 13.w,
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 5.w),
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 3.w,
                              backgroundColor: Colors.deepOrangeAccent,
                            ),
                            SizedBox(width: 5.w),
                            Text(
                              projectList[index]
                                  .todoList[projectList[index].todoSuccessCount]
                                  .todo,
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 8.sp,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 10.w),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            alignment: Alignment.centerRight,
            child: SmoothPageIndicator(
              controller: page_controller,
              count: projectList.length,
              effect: ScrollingDotsEffect(
                spacing: 8.0,
                radius: 8.0,
                dotWidth: 8.0,
                dotHeight: 8.0,
                paintStyle: PaintingStyle.fill,
                strokeWidth: 1.5,
                dotColor: Colors.grey,
                activeDotColor: Colors.indigo,
              ),
              onDotClicked: (index) {},
            ),
          ),
        ],
      ),
    );
  }
}

/**
 *


 */
