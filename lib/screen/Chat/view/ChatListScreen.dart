import 'package:devsload/styles/Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatListScreen extends StatelessWidget {
  List<String> image_list = [
    "https://images.unsplash.com/photo-1603575448878-868a20723f5d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80",
    "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80",
    "https://images.unsplash.com/photo-1522556189639-b150ed9c4330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80",
    "https://images.unsplash.com/photo-1532073150508-0c1df022bdd1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=962&q=80",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0x44eef2fb),
        elevation: 0.0,
        centerTitle: false,
        title: Text(
          '채팅방리스트',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: AppColor.BackGroundColor,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: ListView.builder(
          shrinkWrap: true,
          itemBuilder: (_, index) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.w),
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColor.BackGroundColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Container(
                height: 62.w,
                child: Row(
                  children: [
                    Container(
                      width: 50.w,
                      height: 50.w,
                      child: Stack(
                        children: [
                          Container(width: 50.w, height: 50.w),
                          ...Profile_ListItem(
                                  itemCount: index, image_list: image_list)
                              .toList(),
                        ],
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: Container(
                        height: 50.w,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              // width: double.infinity,
                              child: Text(
                                '개발자 채팅앱 개발',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13.sp,
                                  color: Colors.black87,
                                ),
                              ),
                              alignment: Alignment.centerLeft,
                            ),
                            SizedBox(height: 2.w),
                            Container(
                              child: Text(
                                "이제 다들 주무시고 내일 아침\n 다시 화이팅 해 현재시간 04시 44분입니다",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12.sp,
                                  color: Colors.grey[500],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          index == 0
                              ? Container(
                                  child: Text('오전 11시 32분',
                                      style: TextStyle(
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey[400],
                                      )))
                              : Container(
                                  child: Text('11월 12일',
                                      style: TextStyle(
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey[400],
                                      ))),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          itemCount: 10,
        ),
      ),
    );
  }

  List<Widget> Profile_ListItem(
      {required int itemCount, required List<String> image_list}) {
    List<Widget> Profile_List = [];
    if (itemCount > 4 || itemCount == 0) {
      itemCount = 4;
    }
    switch (itemCount) {
      case 1:
        Profile_List.add(Positioned(
          width: 50.w,
          child: CircleAvatar(
            radius: 25.w,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 24.w,
              backgroundImage: NetworkImage(image_list[0]),
            ),
          ),
        ));
        break;
      case 2:
        Profile_List.add(Positioned(
          top: 0,
          left: 0,
          child: CircleAvatar(
            radius: 15.w,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 14.w,
              backgroundImage: NetworkImage(image_list[0]),
            ),
          ),
        ));
        Profile_List.add(Positioned(
          bottom: 0,
          right: 0,
          child: CircleAvatar(
            radius: 15.w,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 14.w,
              backgroundImage: NetworkImage(image_list[1]),
            ),
          ),
        ));
        break;
      case 3:
        Profile_List.add(Positioned(
          bottom: 2.5.w,
          right: 2.5.w,
          child: CircleAvatar(
            radius: 12.5.w,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 11.5.w,
              backgroundImage: NetworkImage(image_list[1]),
            ),
          ),
        ));
        Profile_List.add(Positioned(
          bottom: 2.5.w,
          left: 2.5.w,
          child: CircleAvatar(
            radius: 12.5.w,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 11.5.w,
              backgroundImage: NetworkImage(image_list[0]),
            ),
          ),
        ));
        Profile_List.add(Positioned(
          top: 2.5.w,
          left: 12.5.w,
          child: CircleAvatar(
            radius: 12.5.w,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 11.5.w,
              backgroundImage: NetworkImage(image_list[2]),
            ),
          ),
        ));
        break;
      default:
        Profile_List.add(Positioned(
          top: 3.5,
          left: 3.5,
          child: CircleAvatar(
            radius: 10.w,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 9.w,
              backgroundImage: NetworkImage(image_list[1]),
            ),
          ),
        ));
        Profile_List.add(Positioned(
          top: 3.5,
          right: 3.5,
          child: CircleAvatar(
            radius: 10.w,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 9.w,
              backgroundImage: NetworkImage(image_list[3]),
            ),
          ),
        ));
        Profile_List.add(Positioned(
          bottom: 3.5,
          right: 3.5,
          child: CircleAvatar(
            radius: 10.w,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 9.w,
              backgroundImage: NetworkImage(image_list[0]),
            ),
          ),
        ));
        Profile_List.add(Positioned(
          bottom: 3.5,
          left: 3.5,
          child: CircleAvatar(
            radius: 10.w,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 9.w,
              backgroundImage: NetworkImage(image_list[2]),
            ),
          ),
        ));
        break;
    }
    return Profile_List;
  }
}
