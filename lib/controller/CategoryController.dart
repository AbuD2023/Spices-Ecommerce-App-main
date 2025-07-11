// import 'dart:developer';

import 'package:Spices_Ecommerce_app/data/model/ProdCategory.dart';
import 'package:Spices_Ecommerce_app/linkapi.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:Spices_Ecommerce_app/core/class/statusrequest.dart';

class CategoryController extends GetxController {
  var isLoading = true.obs;
  var categoryList = <ProdCategory>[].obs;
  var searchedCategories = <ProdCategory>[].obs;
  StatusRequest statusRequest = StatusRequest.none;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  Future<void> fetchCategories() async {
    try {
      isLoading(true);
      statusRequest = StatusRequest.loading;
      update();

      final response = await http.get(
        Uri.parse(AppLink.categoriesFetch),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      );

      print('Response status: ${response.statusCode}');
      print(
          'Response body categories=============================: ${response.body}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        // log(data.toString(), name: 'fetchCategories');
        final List<dynamic> categoriesJson = data['categories'];
        categoryList.assignAll(
            categoriesJson.map((json) => ProdCategory.fromJson(json)).toList());
        statusRequest = StatusRequest.success;
      } else {
        statusRequest = StatusRequest.failure;
        throw Exception('Failed to load categories');
      }
    } catch (e) {
      print('Error: $e');
      statusRequest = StatusRequest.serverfailure;
    } finally {
      isLoading(false);
      update();
    }
  }

  void searchCategories(String query) {
    if (query.isEmpty) {
      searchedCategories.clear();
    } else {
      searchedCategories.assignAll(categoryList
          .where((category) =>
              category.name!.toLowerCase().contains(query.toLowerCase()))
          .toList());
    }
  }
}
