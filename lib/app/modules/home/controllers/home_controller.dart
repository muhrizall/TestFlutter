import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:testflutter/app/data/models/product.dart';
import 'package:testflutter/app/data/provider/product_provider.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final ProductProvider productProvider;

  HomeController({required this.productProvider});

  var isLoading = true.obs;
  var product = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProduct();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    product.clear();
  }

  Future<void> fetchProduct() async {
    try {
      final response = await productProvider.fetchProduct();
      final List<Product> body = response.data == null
          ? []
          : listShoppingFromJson(jsonEncode(response.data));

      product.value = body;
    } on DioException catch (e) {
      Get.snackbar('Fetching Failed', e.response?.data.toString() ?? '');
    } finally {
      isLoading.value = false;
      update();
    }
  }
}
