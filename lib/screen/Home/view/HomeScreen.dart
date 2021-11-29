import 'package:devsload/components/widget/skill.dart';
import 'package:devsload/styles/Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    final page_controller_1 =
        PageController(viewportFraction: 1, keepPage: true);
    final page_controller_2 =
        PageController(viewportFraction: 1, keepPage: true);
    final page_controller_3 =
        PageController(viewportFraction: 1, keepPage: true);
    List<String> stack_list = [
      "C",
      "C++",
      "C#",
      "Node",
      "Express",
      "Nest.js",
      "Nuxt.js",
      "Spring",
      "Java",
      "Flask",
      "Firebase",
      'Next.js',
      'Vue.js',
      'Python',
      'Django',
    ];
    List<String> image_list = [
      "https://images.unsplash.com/photo-1603575448878-868a20723f5d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80",
      "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80",
      "https://images.unsplash.com/photo-1522556189639-b150ed9c4330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80",
      "https://images.unsplash.com/photo-1532073150508-0c1df022bdd1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=962&q=80",
    ];
    List<Color> colorList = [
      Colors.orangeAccent,
      Colors.lightBlueAccent,
      Colors.purpleAccent,
      Colors.greenAccent,
      Colors.tealAccent,
    ];

    return Scaffold(
      backgroundColor: Color(0xFF8F69FD),
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 200.h,
              child: Stack(
                children: [
                  //Main Home
                  Container(
                    width: double.infinity,
                    height: 200.h,
                    decoration: BoxDecoration(
                      color: Color(0xFF8F69FD),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.all(5.w),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 3.w,
                              color: Color(0xFF9977F0),
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 35.w,
                            backgroundImage: NetworkImage(image_list[0]),
                          ),
                        ),
                        SizedBox(height: 10.w),
                        Container(
                          child: Text(
                            '홍길동',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: 5.w),
                        Container(
                          child: Text(
                            '2021년 1월 16일',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Options
                  Positioned(
                    top: statusBarHeight,
                    left: 0,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      height: 20.h,
                      width: 360.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            onPressed: () {},
                            padding: EdgeInsets.zero,
                            iconSize: 20.sp,
                            icon: Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                          ),
                          IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {},
                            iconSize: 20.sp,
                            icon: Icon(
                              Icons.settings,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColor.BackGroundColor,
                borderRadius: BorderRadius.vertical(top: Radius.circular(25.w)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.w),
                  _HeaderTitle(title: "현재 진행중인 프로젝트", More: "더보기"),
                  SizedBox(height: 10.w),
                  ProjectCardTemp(page_controller: page_controller_1),
                  SizedBox(height: 20.w),
                  _HeaderTitle(title: "현재 종료된 프로젝트", More: "더보기"),
                  SizedBox(height: 10.w),
                  // ProjectCard(page_controller: page_controller)

                  Container(
                    child: Column(
                      children: [
                        Container(
                            height: 180.w,
                            child: PageView.builder(
                              controller: page_controller_2,
                              itemBuilder: (_, index) {
                                return Container(
                                    color: Colors.transparent,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20.w, vertical: 10.w),
                                    child: Container(
                                      width: double.infinity,
                                      height: double.infinity,
                                      padding: EdgeInsets.all(10.w),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(15.w),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.2),
                                            spreadRadius: 5,
                                            blurRadius: 7,
                                            offset: Offset(0,
                                                3), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          _ProjectTitle(
                                            projectName: "개발자 채팅앱 리스트",
                                            developerCount: '100',
                                            owner_image: image_list[1],
                                          ),
                                          SizedBox(height: 10.w),
                                          Container(
                                            height: 48.h,
                                            child: Text(
                                              "멀티채팅방 구현이 목적입니다. ㅎㅎ",
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
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10.w),
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text('2021.01.11',
                                                        style: TextStyle(
                                                          fontSize: 8.sp,
                                                          fontWeight:
                                                              FontWeight.w200,
                                                        )),
                                                    Text('총 66 과정',
                                                        style: TextStyle(
                                                          fontSize: 8.sp,
                                                          fontWeight:
                                                              FontWeight.w200,
                                                        )),
                                                    Text('2021.12.13',
                                                        style: TextStyle(
                                                          fontSize: 8.sp,
                                                          fontWeight:
                                                              FontWeight.w200,
                                                        )),
                                                  ],
                                                ),
                                                SizedBox(height: 3.w),
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 2.w),
                                                  child: Container(
                                                    height: 3.w,
                                                    decoration: BoxDecoration(
                                                        color:
                                                            Colors.orangeAccent,
                                                        borderRadius:
                                                            BorderRadius
                                                                .horizontal(
                                                          left: Radius.circular(
                                                              3.w),
                                                          right:
                                                              Radius.circular(
                                                                  3.w),
                                                        )),
                                                    width: double.infinity,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ));
                              },
                              itemCount: 5,
                            )),
                        SizedBox(height: 10.w),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          alignment: Alignment.centerRight,
                          child: SmoothPageIndicator(
                            controller: page_controller_2,
                            count: 5,
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
                  ),
                  SizedBox(height: 20.w),
                  _HeaderTitle(title: "관심 프로젝트", More: "더보기"),
                  SizedBox(height: 10.w),
                  Container(
                    child: Column(
                      children: [
                        Container(
                            height: 180.w,
                            child: PageView.builder(
                              controller: page_controller_3,
                              itemBuilder: (_, index) {
                                return Container(
                                    color: Colors.transparent,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20.w, vertical: 10.w),
                                    child: Container(
                                      width: double.infinity,
                                      height: double.infinity,
                                      padding: EdgeInsets.all(10.w),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(15.w),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.2),
                                            spreadRadius: 5,
                                            blurRadius: 7,
                                            offset: Offset(0,
                                                3), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          _ProjectTitle(
                                            projectName: "개발자 채팅앱 리스트",
                                            developerCount: '100',
                                            owner_image: image_list[2],
                                          ),
                                          SizedBox(height: 10),
                                          Container(
                                            height: 48.h,
                                            child: Text(
                                              "멀티채팅방 구현이 목적입니다. ㅎㅎ",
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
                                          Container(
                                            width: double.infinity,
                                            child: Wrap(
                                              children: [
                                                ...List.generate(
                                                  5,
                                                  (index) => Container(
                                                    padding: EdgeInsets.only(
                                                        top: 5.w, right: 5.w),
                                                    child: Skill(
                                                      skill: stack_list[index],
                                                      color: colorList[index],
                                                    ),
                                                  ),
                                                ).toList(),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ));
                              },
                              itemCount: 5,
                            )),
                        SizedBox(height: 10.w),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          alignment: Alignment.centerRight,
                          child: SmoothPageIndicator(
                            controller: page_controller_3,
                            count: 5,
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
                  ),
                  SizedBox(height: 20.w),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row _ProjectTitle({
    required String projectName,
    required String developerCount,
    required String owner_image,
  }) {
    List<String> image_list = [
      "https://images.unsplash.com/photo-1603575448878-868a20723f5d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80",
      "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80",
      "https://images.unsplash.com/photo-1522556189639-b150ed9c4330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80",
      "https://images.unsplash.com/photo-1532073150508-0c1df022bdd1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=962&q=80",
    ];
    return Row(
      children: [
        CircleAvatar(
          radius: 15.w,
          backgroundColor: Colors.purple,
          child: CircleAvatar(
            radius: 14.w,
            backgroundImage: NetworkImage(owner_image),
          ),
        ),
        SizedBox(width: 5.w),
        Text(
          projectName,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black54,
            fontSize: 13.sp,
          ),
        ),
        Expanded(child: Container()),
        Container(
          child: Stack(
            children: List.generate(
              3,
              (index) => index == 0
                  ? Container(
                      width: 90.w,
                      child: CircleAvatar(
                        radius: 15.w,
                        backgroundColor: Colors.pink,
                        child: CircleAvatar(
                          radius: 14.w,
                          backgroundImage: NetworkImage(image_list[index + 1]),
                        ),
                      ),
                    )
                  : Positioned(
                      left: 15.w * index,
                      right: -15.w * index,
                      child: CircleAvatar(
                        radius: 15.w,
                        backgroundColor: Colors.pink,
                        child: CircleAvatar(
                          radius: 14.w,
                          backgroundImage: NetworkImage(image_list[index + 1]),
                        ),
                      ),
                    ),
            ),
          ),
        ),
      ],
    );
  }

  Container _HeaderTitle({required String title, required String More}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            More,
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

// Temp Current ProjectCard
class ProjectCardTemp extends StatelessWidget {
  final PageController page_controller;

  const ProjectCardTemp({
    required this.page_controller,
  });

  @override
  Widget build(BuildContext context) {
    List<String> image_list = [
      "https://images.unsplash.com/photo-1603575448878-868a20723f5d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80",
      "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80",
      "https://images.unsplash.com/photo-1522556189639-b150ed9c4330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80",
      "https://images.unsplash.com/photo-1532073150508-0c1df022bdd1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=962&q=80",
    ];
    return Container(
      child: Column(
        children: [
          Container(
            height: 180.w,
            child: PageView.builder(
              itemCount: 5,
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
                              backgroundColor: Colors.pink,
                              child: CircleAvatar(
                                radius: 14.w,
                                backgroundImage: NetworkImage(image_list[0]),
                              ),
                            ),
                            SizedBox(width: 5.w),
                            Text(
                              "개발자채팅앱 리스트",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black54,
                                fontSize: 13.sp,
                              ),
                            ),
                            Expanded(child: Container()),
                            Container(
                              child: Stack(
                                children: List.generate(
                                  3,
                                  (index) => index == 0
                                      ? Container(
                                          width: 90.w,
                                          child: CircleAvatar(
                                            radius: 15.w,
                                            backgroundColor: Colors.pink,
                                            child: CircleAvatar(
                                              radius: 14.w,
                                              backgroundImage: NetworkImage(
                                                  image_list[index + 1]),
                                            ),
                                          ),
                                        )
                                      : Positioned(
                                          left: 15.w * index,
                                          right: -15.w * index,
                                          child: CircleAvatar(
                                            radius: 15.w,
                                            backgroundColor: Colors.pink,
                                            child: CircleAvatar(
                                              radius: 14.w,
                                              backgroundImage: NetworkImage(
                                                  image_list[index + 1]),
                                            ),
                                          ),
                                        ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5.w),
                        Container(
                          height: 48.h,
                          child: Text(
                            "멀티채팅방 구현이 목적입니다. ㅎㅎ",
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
                            5,
                            (index) {
                              var value = (3 / 5) * 100;
                              return Expanded(
                                child: Column(
                                  children: [
                                    Container(
                                      height: 3.w,
                                      decoration: BoxDecoration(
                                        color: (index >= 3)
                                            ? Colors.grey[100]
                                            : Colors.greenAccent,
                                        borderRadius: index == 0 || index == 4
                                            ? BorderRadius.horizontal(
                                                left: index == 0
                                                    ? Radius.circular(3.w)
                                                    : Radius.zero,
                                                right: index == 4
                                                    ? Radius.circular(3.w)
                                                    : Radius.zero,
                                              )
                                            : null,
                                      ),
                                      width: double.infinity,
                                    ),
                                    SizedBox(height: 5.w),
                                    index == 2
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
                              "이미지 업로드",
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
              count: 5,
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

// Temp End ProjectList
