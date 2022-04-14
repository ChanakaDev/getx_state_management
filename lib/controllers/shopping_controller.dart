// controller class

// ignore_for_file: unused_local_variable
import 'package:get/get.dart';
import '../models/product.dart';

// (*) create a controller which extends the GetX controller
class ShoppingController extends GetxController {
  // (*) create an observable list
  // An observable is a way to be notified of a continuous stream of events over time.
  // GetX observables: obs, obx, get builder
  // Here we have used 'obs'
  var products = <Product>[].obs;

  // this run when initialize the page
  @override
  void onInit() {
    super.onInit();

    // in the initialization, we fetch products
    fetchProducts();
  }

  // this is async, because we are interact with the internet
  void fetchProducts() async {
    // delay, becuase we are creating a fake network request here
    await Future.delayed(const Duration(seconds: 1));
    // assume following are the data came from the server
    var productResult = [
      Product(
          id: 1,
          price: 30,
          productDescription: 'some description about product',
          productImage: 'abd',
          productName: 'Banana'),
      Product(
          id: 2,
          price: 40,
          productDescription: 'some description about product',
          productImage: 'abd',
          productName: 'Apple'),
      Product(
          id: 3,
          price: 49.5,
          productDescription: 'some description about product',
          productImage: 'abd',
          productName: 'Mango'),
    ];

    // (*) give data to the observable instance
    products.value = productResult;
  }
}
