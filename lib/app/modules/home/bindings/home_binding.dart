import 'package:get/get.dart';
import 'package:testflutter/app/data/provider/product_provider.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductProvider>(() => ProductProvider());
    Get.lazyPut<HomeController>(
      () => HomeController(productProvider: Get.find()),
    );
  }
}
