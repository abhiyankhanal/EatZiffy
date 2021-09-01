import 'package:eat_ziffy/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryCard extends StatelessWidget {
  String? name, id, total_bookmarked;
  Color? mycolor;
  final IconData? myIcon;
  CategoryCard({
    @required this.name,
    this.id,
    this.total_bookmarked,
    @required this.myIcon,
    @required this.mycolor,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed("/fromHome", arguments: [total_bookmarked, id]),
      child: Container(
        height: Get.width * 0.4,
        width: Get.width * 0.4,
        decoration: BoxDecoration(
          color: mycolor!.withOpacity(0.4),
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Flexible(
                child: Container(
                  // height: 100,
                  // width: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: white.withOpacity(0.8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Center(
                      child: Icon(
                        myIcon,
                        color: mycolor,
                        size: 60,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "$name",
                style: TextStyle(color: mycolor, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
