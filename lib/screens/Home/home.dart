import 'package:eat_ziffy/constants/colors.dart';
import 'package:eat_ziffy/controller/apiController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'homeCard.dart';

class Home extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  List<IconData> iconList = [
    Icons.ac_unit_outlined,
    Icons.access_alarm_outlined,
    Icons.pages_outlined,
    Icons.comment
  ];
  List<Color> myColor = [cat0, cat1, cat2, cat3];
  var catData = Get.put(ApiConrtoller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              // height: Get.height * 0.25,
              decoration: BoxDecoration(
                color: mainCol,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        RichText(
                          text: TextSpan(
                            text: 'Hi John \n',
                            style: TextStyle(fontSize: 20),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Welcome Back !!!',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 25),
                              ),
                            ],
                          ),
                        ),
                        Stack(
                          children: [
                            Icon(
                              Icons.notifications_outlined,
                              color: white,
                            ),
                            Positioned(
                              top: 0,
                              left: 10,
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.green,
                                ),
                                height: 10,
                                width: 10,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextField(
                      key: _formKey,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                        focusColor: white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(40.0),
                          ),
                          borderSide: BorderSide(color: mainCol),
                        ),
                        fillColor: white.withOpacity(0.3),
                        filled: true,
                        prefixIcon: Padding(
                          padding:
                              const EdgeInsets.only(left: 20.0, right: 10.0),
                          child: Icon(
                            Icons.search,
                            size: 30.0,
                            color: white,
                          ),
                        ),
                        hintText: "What bookmarks are you searching for?",
                        hintStyle: TextStyle(color: white, fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              "Categories",
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.w500, color: textCol),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GetBuilder<ApiConrtoller>(
                  builder: (con) => CategoryCard(
                    name: con.categoryList?[0].category.toString(),
                    myIcon: iconList[0],
                    mycolor: myColor[0],
                    total_bookmarked:
                        catData.categoryList![0].totalBookmarked.toString(),
                    id: catData.categoryList![0].id.toString(),
                  ),
                ),
                GetBuilder<ApiConrtoller>(
                  builder: (con) => CategoryCard(
                    name: con.categoryList?[1].category.toString(),
                    myIcon: iconList[1],
                    mycolor: myColor[1],
                    total_bookmarked:
                        catData.categoryList![1].totalBookmarked.toString(),
                    id: catData.categoryList![1].id.toString(),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GetBuilder<ApiConrtoller>(
                  builder: (con) => CategoryCard(
                    name: con.categoryList?[2].category.toString(),
                    myIcon: iconList[2],
                    mycolor: myColor[2],
                    total_bookmarked:
                        catData.categoryList![2].totalBookmarked.toString(),
                    id: catData.categoryList![2].id.toString(),
                  ),
                ),
                GetBuilder<ApiConrtoller>(
                  builder: (con) => CategoryCard(
                    name: con.categoryList?[3].category.toString(),
                    myIcon: iconList[3],
                    mycolor: myColor[3],
                    total_bookmarked:
                        catData.categoryList![3].totalBookmarked.toString(),
                    id: catData.categoryList![3].id.toString(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
