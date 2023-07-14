import 'package:dio/dio.dart';
import 'package:testflutter/app/core/utils/constant.dart';

class ProductProvider {
  final dio = Dio(
    BaseOptions(
      baseUrl: Constant.baseUrl,
    ),
  );

  Future<Response> fetchProduct() async {
    return await dio.get('/products');
  }
}
