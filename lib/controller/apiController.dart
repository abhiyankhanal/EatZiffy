import 'package:dio/dio.dart';
import 'package:eat_ziffy/models/categoryModel.dart';
import 'package:eat_ziffy/models/productModel.dart';
import 'package:eat_ziffy/models/tagModel.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ApiConrtoller extends GetxController {
  Rx<List<CategoryModel>> categoryData = Rx<List<CategoryModel>>([]);
  List<CategoryModel>? get categoryList => categoryData.value;
  Rx<List<TagsModel>> tagData = Rx<List<TagsModel>>([]);
  List<TagsModel>? get tagList => tagData.value;
  Rx<List<ProductModel>> productData = Rx<List<ProductModel>>([]);
  List<ProductModel>? get productList => productData.value;
  List<ProductModel>? get productBookMarked =>
      productData.value.where((e) => e.isBookmarked == true).toList();
  Dio dio = Dio();
  RxBool myTap = false.obs;
  void getCat() async {
    try {
      print("called");
      Response response = await dio.get("http://10.0.2.2:3000/categories");
      print(response.statusCode);
      print(response.data);
      if (response.statusCode == 200) {
        List list = response.data;

        List<CategoryModel> lol =
            list.map((e) => CategoryModel.fromJson(e)).toList();
        categoryList?.addAll(lol);

        update();
        print(categoryList?[0].category);
      } else {
        print("Error:" + response.statusCode.toString());
        update();
      }
    } catch (e) {
      print("Exception");
      update();
    }
  }

  void getProducts(String catId) async {
    try {
      print("called");
      Response response =
          await dio.get("http://10.0.2.2:3000/items?catId=$catId");
      print(response.statusCode);
      print(response.data);
      if (response.statusCode == 200) {
        List list = response.data;

        List<ProductModel> lol =
            list.map((e) => ProductModel.fromJson(e)).toList();
        productList?.addAll(lol);

        update();
        print(productList?[0].catId);
      } else {
        print("Error:" + response.statusCode.toString());
        update();
      }
    } catch (e) {
      print("Exception");
      update();
    }
  }

  void getCatByID(String catID) async {
    try {
      print("called");
      Response response =
          await dio.get("http://10.0.2.2:3000/labels?catId=$catID");
      print(response.statusCode);
      print(response.data);
      if (response.statusCode == 200) {
        List list = response.data;

        List<TagsModel> lol = list.map((e) => TagsModel.fromJson(e)).toList();
        tagList?.addAll(lol);
        update();
        print(tagList?[0].name);
      } else {
        print("Error:" + response.statusCode.toString());
        update();
      }
    } catch (e) {
      print("Exception");
      update();
    }
  }

  void toggle() {
    myTap.toggle();
    update();
  }

  @override
  void onInit() {
    getCat();
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
