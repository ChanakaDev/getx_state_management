import 'package:get/get.dart';
import '../models/product.dart';

class CartController extends GetxController {
  var cartItems = <Product>[].obs;

  // calculating some of product
  // <todo> find what the following is, where it is from???
  double get totalPrice => cartItems.fold(0, (sum, item) => sum + item.price);
  int get cartCount => cartItems.length;

  // this method can be called everywhere
  // all you need to do is to, create an instance and use
  // (that's how there is addTocart functionality in every page
  // in popular e commerce pplications)
  addToCart(Product product) {
    cartItems.add(product);
  }
}
