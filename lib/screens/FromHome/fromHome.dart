import 'package:eat_ziffy/constants/colors.dart';
import 'package:eat_ziffy/controller/apiController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FromHome extends StatelessWidget {
  ApiConrtoller api = Get.find<ApiConrtoller>();

  List myArgs = Get.arguments;
  String get bookmarks => myArgs[0].toString();
  String get id => myArgs[1].toString();
  final _formKey = GlobalKey<FormState>();
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
                          GestureDetector(
                              onTap: () => Get.back(),
                              child: Icon(
                                Icons.arrow_back_ios,
                                color: white,
                              )),
                          RichText(
                            text: TextSpan(
                              text: 'Cooking',
                              style: TextStyle(fontSize: 20, color: white),
                            ),
                          ),
                          Icon(
                            Icons.notifications_outlined,
                            color: white,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 40,
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
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                "Labels",
                style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.w500, color: textCol),
              ),
            ),
            GetBuilder<ApiConrtoller>(
              initState: (state) {
                api.getCatByID(id);
              },
              dispose: (state) {
                api.tagList!.clear();
              },
              builder: (con) => SizedBox(
                height: 40,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: con.tagList!
                      .map(
                        (e) => Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: mainCol,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  e.name.toString(),
                                  style: TextStyle(color: white),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Bookmarks",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: textCol),
                  ),
                  GestureDetector(
                      onTap: () {
                        api.toggle();
                      },
                      child: Icon(
                        Icons.arrow_drop_down_circle_outlined,
                        color: mainCol,
                        size: 30,
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Row(
                children: [
                  Icon(
                    Icons.bookmark_outline,
                    color: mainCol,
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Text(bookmarks)
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
                padding: const EdgeInsets.all(10.0),
                child: GetBuilder<ApiConrtoller>(
                  initState: (state) {
                    api.getProducts(id);
                  },
                  dispose: (state) {
                    api.productList!.clear();
                  },
                  builder: (cont) => cont.productList!.isEmpty
                      ? Container(
                          height: Get.height * 0.35,
                          child: Center(child: Text("Empty")))
                      : SizedBox(
                          height: Get.height * 0.35,
                          child: ListView(
                              children: api.myTap.value == true
                                  ? cont.productBookMarked!
                                      .map(
                                        (e) => Column(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                color: white,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color:
                                                        mainCol.withAlpha(20),
                                                    spreadRadius: 3,
                                                    blurRadius: 5,
                                                    offset: Offset(1, 3),
                                                  ),
                                                ],
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(15.0),
                                                child: Row(children: <Widget>[
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10)),
                                                    child: Image(
                                                      image: NetworkImage(
                                                          e.image.toString()),
                                                      height: 70,
                                                      width: 100,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        e.title.toString(),
                                                        style: TextStyle(
                                                            color: textCol,
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                      SizedBox(
                                                        height: 15,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Icon(
                                                            e.isBookmarked!
                                                                ? Icons
                                                                    .notification_important
                                                                : Icons
                                                                    .notification_important_outlined,
                                                            color: mainCol,
                                                            size: 20,
                                                          ),
                                                          SizedBox(
                                                            width: 4,
                                                          ),
                                                          Icon(
                                                            e.isBookmarked!
                                                                ? Icons.star
                                                                : Icons
                                                                    .star_outlined,
                                                            color: mainCol,
                                                            size: 20,
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    width: 15,
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        color: Colors.green,
                                                        shape: BoxShape.circle),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Icon(
                                                        Icons.bookmark_outline,
                                                        color: white,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 15,
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        color: Colors.red,
                                                        shape: BoxShape.circle),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Icon(
                                                        Icons.delete_outline,
                                                        color: white,
                                                      ),
                                                    ),
                                                  )
                                                ]),
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                          ],
                                        ),
                                      )
                                      .toList()
                                  : cont.productList!
                                      .map(
                                        (e) => Column(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                color: white,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color:
                                                        mainCol.withAlpha(20),
                                                    spreadRadius: 3,
                                                    blurRadius: 5,
                                                    offset: Offset(1, 3),
                                                  ),
                                                ],
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(15.0),
                                                child: Row(children: <Widget>[
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10)),
                                                    child: Image(
                                                      image: NetworkImage(
                                                          e.image.toString()),
                                                      height: 70,
                                                      width: 100,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        e.title.toString(),
                                                        style: TextStyle(
                                                            color: textCol,
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                      SizedBox(
                                                        height: 15,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Icon(
                                                            e.isBookmarked!
                                                                ? Icons
                                                                    .notification_important
                                                                : Icons
                                                                    .notification_important_outlined,
                                                            color: mainCol,
                                                            size: 20,
                                                          ),
                                                          SizedBox(
                                                            width: 4,
                                                          ),
                                                          Icon(
                                                            e.isBookmarked!
                                                                ? Icons.star
                                                                : Icons
                                                                    .star_outlined,
                                                            color: mainCol,
                                                            size: 20,
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    width: 15,
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        color: Colors.green,
                                                        shape: BoxShape.circle),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Icon(
                                                        Icons.bookmark_outline,
                                                        color: white,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 15,
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        color: Colors.red,
                                                        shape: BoxShape.circle),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Icon(
                                                        Icons.delete_outline,
                                                        color: white,
                                                      ),
                                                    ),
                                                  )
                                                ]),
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                          ],
                                        ),
                                      )
                                      .toList()),
                        ),
                )),
            SizedBox(
              height: 20,
            ),
          ]),
    );
  }
}
