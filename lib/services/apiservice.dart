import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:project1/models/store_model.dart';

class APIservice {
  Future<List<Product>> getAllPosts() async {
    final allProductUrl = Uri.parse('https://fakestoreapi.com/products');
    final response = await http.get(allProductUrl);
    List<Product> allProducts = [];
    List body = json.decode(response.body);
    body.forEach((product) {
      allProducts.add(Product.fromJson(product));
    });
    //print(response.statusCode);
    //print(response.body);
    return allProducts;
  }

  Future getSingleProducts(int id) async {
    final singleProductUrl = Uri.parse('https://fakestoreapi.com/products/$id');
    final response = await http.get(singleProductUrl);
    print(response.statusCode);
    print(response.body);
    return json.decode(response.body);
  }

  Future getAllCategory() async {
    final allCategoryProductUrl =
        Uri.parse('https://fakestoreapi.com/products/categories');
    final response = await http.get(allCategoryProductUrl);
    print(response.statusCode);
    print(response.body);
    return json.decode(response.body);
  }

  Future getProductByCategory(String name) async {
    final fetchProductCategory =
        Uri.parse('https://fakestoreapi.com/products/category/$name');
    final response = await http.get(fetchProductCategory);
    print(response.statusCode);
    print(response.body);
    return json.decode(response.body);
  }

  Future getCart(String userId) async {
    final fetchCartProduct =
        Uri.parse('https://fakestoreapi.com/carts/$userId');
    final response = await http.get(fetchCartProduct);
    print(response.statusCode);
    print(response.body);
    return json.decode(response.body);
  }

  Future userAuthentication(String email, String password) async {
    final authUrl = Uri.parse('http://tarsoft-lms-lite.test/api/v1/login');
    final response =
        await http.post(authUrl, body: {'email': email, 'password': password});
    print(response.statusCode);
    print(response.body);
    return json.decode(response.body);
  }

  Future userAuthorization(String email, String password) async {
    final authUrl = Uri.parse('http://tarsoft-lms-lite.test/api/v1/login');
    String basicAuth = 'Basic' + base64Encode(utf8.encode('$email:$password'));
    final accessToken = 'some token value';
    final response = await http.get(authUrl, headers: {
      'Content-Type': 'application/json',
      'authorization': 'Bearer $accessToken',
    });
    print(response.statusCode);
    print(response.body);
    return json.decode(response.body);
  }
}
