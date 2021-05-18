import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';
import 'package:latihan_getx/controller/product_controller.dart';
import 'package:latihan_getx/view/homepage_product_grid.dart';

class HomePage extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: Colors.white, elevation: 0, actions: [
          Icon(
            Icons.shopping_cart,
            color: Colors.black,
          ),
        ]),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: Row(children: [
                Expanded(
                    child: Text(
                  "GetX",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
                IconButton(
                    icon: Icon(Icons.list_alt_rounded), onPressed: () {}),
                IconButton(icon: Icon(Icons.grid_view), onPressed: () {})
              ]),
            ),
            Expanded(child: Obx(() {
              if (productController.isLoading.value)
                return Center(child: CircularProgressIndicator());
              else
                return StaggeredGridView.countBuilder(
                    crossAxisCount: 2,
                    itemCount: productController.productList.length,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    itemBuilder: (context, index) {
                      return ProductGrid(productController.productList[index]);
                    },
                    staggeredTileBuilder: (index) => StaggeredTile.fit(1));
            }))
          ],
        ));
  }
}
