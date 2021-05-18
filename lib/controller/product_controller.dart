import 'package:latihan_getx/model/product.dart';
import 'package:get/state_manager.dart';

class ProductController extends GetxController {
  var productList = List<Product>.empty(growable: true).obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchProduct();
    super.onInit();
  }

  void fetchProduct() async {
    try {
      isLoading(true);
      var products = await Product.getFromAPI();
      if (products != null) {
        productList.value = products;
      }
    } catch (e) {} finally {
      isLoading(false);
    }
  }
}
