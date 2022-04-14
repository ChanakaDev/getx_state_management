// ignore_for_file: unnecessary_string_interpolations, deprecated_member_use, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/cart_controller.dart';
import '../controllers/shopping_controller.dart';

class ShoppingPage extends StatelessWidget {
  ShoppingPage({Key? key}) : super(key: key);

  // connect MVC
  // dependency injection: get.put
  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Column(
        children: [
          Expanded(
            // (*) Wrap listview inside GetX widget
            // that provide us the controller
            child: GetX<ShoppingController>(
              builder: (controller) {
                return ListView.builder(
                  itemCount: controller.products.length,
                  itemBuilder: (context, index) {
                    // card view
                    return Card(
                      margin: const EdgeInsets.all(12),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${controller.products[index].productName}',
                                      style: const TextStyle(fontSize: 24),
                                    ),
                                    Text(
                                        '${controller.products[index].productDescription}'),
                                  ],
                                ),
                                Text('\$${controller.products[index].price}',
                                    style: const TextStyle(fontSize: 24)),
                              ],
                            ),
                            RaisedButton(
                              onPressed: () {
                                print('Add to cart');
                                // adding cart controller to use the addToCart()
                                cartController
                                    .addToCart(controller.products[index]);
                              },
                              color: Colors.blue,
                              textColor: Colors.white,
                              child: const Text('Add to Cart'),
                            ),
                            // Obx(() => IconButton(
                            //       icon: controller
                            //               .products[index].isFavorite.value
                            //           ? const Icon(Icons.check_box_rounded)
                            //           : const Icon(Icons
                            //               .check_box_outline_blank_outlined),
                            //       onPressed: () {
                            //         controller.products[index].isFavorite
                            //             .toggle();
                            //       },
                            //     ))
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          // (*) making the total amount listnable
          GetX<CartController>(
            builder: (controller) {
              return Text(
                'Total Amount: \$ ${controller.totalPrice}',
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              );
            },
          ),
          const SizedBox(
            height: 100,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: Colors.amber,
        icon: const Icon(
          Icons.shopping_cart_rounded,
          color: Colors.black,
        ),
        // only update the text
        // item count will be shoun here
        label: GetX<CartController>(
          builder: (controller) {
            return Text(
              controller.cartCount.toString(),
              style: const TextStyle(color: Colors.black),
            );
          },
        ),
      ),
    );
  }
}
