import 'package:devsload/styles/Colors.dart';
import 'package:devsload/styles/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatRoomScreen extends StatelessWidget {
  List<String> image_list = [
    "https://images.unsplash.com/photo-1603575448878-868a20723f5d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80",
    "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80",
    "https://images.unsplash.com/photo-1522556189639-b150ed9c4330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80",
    "https://images.unsplash.com/photo-1532073150508-0c1df022bdd1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=962&q=80",
  ];
  List<Map<String, dynamic>> chatmessage = [
    {
      "message": "Hello World Flutter K",
      "type": "text",
      "sendTime": "오전 1시 23분",
      "SendDay": "2021년 01월 23일",
      "sender": 1
    },
    {
      "message":
          "https://images.unsplash.com/photo-1603575448878-868a20723f5d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80",
      "type": "image",
      "sendTime": "오전 1시 23분",
      "SendDay": "2021년 01월 23일",
      "sender": 1
    },
    {
      "message": "Hello World Flutter K",
      "type": "text",
      "sendTime": "오전 3시 24분",
      "SendDay": "2021년 01월 23일",
      "sender": 2
    },
    {
      "message":
          "Hello World Flutter KHello World Flutter KHello World Flutter KHello World Flutter KHello World Flutter KHello World Flutter KHello World Flutter K",
      "type": "text",
      "sendTime": "오전 4시 32분",
      "SendDay": "2021년 01월 23일",
      "sender": 3
    },
    {
      "message": "Hello World Flutter K",
      "type": "text",
      "sendTime": "오전 12시 21분",
      "SendDay": "2021년 01월 24일",
      "sender": 2
    },
    {
      "message": "Hello World Flutter K",
      "type": "text",
      "sendTime": "오후 1시 4분",
      "SendDay": "2021년 01월 4일",
      "sender": 1
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          '자스웹개발자 컴컴',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0.0,
        backgroundColor: Color(0x8088888),
      ),
      body: Container(
        color: AppColor.BackGroundColor,
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            ListView.builder(
              itemCount: chatmessage.length,
              itemBuilder: (_, index) {
                return chatmessage[index]['sender'] == 1
                    ? Container(
                        margin: EdgeInsets.symmetric(
                            vertical: 5.w, horizontal: 10.w),
                        width: 300.w,
                        alignment: Alignment.bottomRight,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 10.w),
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(10.w),
                          ),
                          child: chatmessage[index]['type'] == "text"
                              ? Text(chatmessage[index]['message'])
                              : Container(
                                  width: 150.w,
                                  height: 150.w,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                    image: NetworkImage(image_list[1]),
                                    fit: BoxFit.fill,
                                  )),
                                ),
                        ),
                      )
                    : Container(
                        margin: EdgeInsets.fromLTRB(10, 10, 120, 10),
                        alignment: Alignment.bottomLeft,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.bottomCenter,
                              child: CircleAvatar(
                                  radius: 15.w,
                                  backgroundImage: NetworkImage(image_list[
                                      chatmessage[index]['sender']])),
                            ),
                            SizedBox(width: 5.w),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10.w, vertical: 10.w),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.w),
                                ),
                                child: chatmessage[index]['type'] == "text"
                                    ? Text(chatmessage[index]['message'])
                                    : Container(
                                        width: 150.w,
                                        height: 150.w,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                          image: NetworkImage(image_list[1]),
                                          fit: BoxFit.fill,
                                        )),
                                      ),
                              ),
                            ),
                          ],
                        ),
                      );
              },
            ),
            _SendMeesageInput(context),
          ],
        ),
      ),
    );
  }

  Widget _SendMeesageInput(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 2),
              blurRadius: 2,
              spreadRadius: 0,
            )
          ],
          color: const Color(0xffffffff),
        ),
        padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40.w,
              height: 40.w,
              alignment: Alignment.center,
              child: CircleAvatar(
                radius: 15.w,
                backgroundImage: NetworkImage(image_list[0]),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: TextField(
                scrollPadding: EdgeInsets.zero,
                autofocus: false,
                maxLines: 4,
                minLines: 1,
                keyboardType: TextInputType.multiline,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 14.0.sp,
                ),
                decoration: InputDecoration(
                  enabled: true,
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              child: InkWell(
                onTap: () {},
                child: Container(
                  width: 40.w,
                  height: 40.w,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(ICON_CHAT["send"] ?? "send_not"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
