import 'package:devsload/models/skill.dart';
import 'package:devsload/services/AppCommonService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NumberPickModal extends StatefulWidget {
  int startNumber;
  int endNumber;
  int initNumber;
  NumberPickModal(
      {required this.startNumber,
      required this.endNumber,
      required this.initNumber});

  @override
  State<NumberPickModal> createState() => _NumberPickModalState();
}

class _NumberPickModalState extends State<NumberPickModal> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    // List<SkillModel> skill_list = AppCommonService.to.skill_list;

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
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
                color: Colors.white,
              ),
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  Get.back(result: widget.startNumber + selectedIndex);
                },
                child: Text(
                  'Save',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
            Expanded(
              child: CupertinoPicker(
                scrollController: FixedExtentScrollController(
                    initialItem: widget.initNumber - widget.startNumber),
                diameterRatio: 10,
                itemExtent: 64,
                onSelectedItemChanged: (int value) {
                  print(value);
                  selectedIndex = value;
                  setState(() {});
                },
                children: [
                  ...List.generate(
                    (widget.endNumber + 1) - widget.startNumber,
                    (index) {
                      return Container(
                        child: Center(
                            child: Text(
                          '${widget.startNumber + index}',
                          style: TextStyle(
                            fontSize: 13.sp,
                            color: selectedIndex == index
                                ? Colors.blue
                                : Colors.grey,
                          ),
                        )),
                      );
                    },
                  ).toList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
