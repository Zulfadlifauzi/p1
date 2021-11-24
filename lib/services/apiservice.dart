import 'dart:convert';

import 'package:http/http.dart' as http;

class APIservice {
  Future getAllPosts() async {
    final allProductUrl = Uri.parse('https://fakestoreapi.com/products');
    final response = await http.get(allProductUrl);
    //print(response.statusCode);
    //print(response.body);
    return json.decode(response.body);
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

  Future userLogin(String username, String password) async {
    final LoginUrl = Uri.parse('https://fakestoreapi.com/auth/login');
    final response = await http
        .post(LoginUrl, body: {'username': username, 'password': password});
    print(response.statusCode);
    print(response.body);
    return json.decode(response.body);
  }

  Future updateCart(int userId, int productId) async {
    final updateCartUrl = Uri.parse('https://fakestoreapi.com/carts/$userId');
    final response = await http.put(updateCartUrl, body: {
      "userId": '$userId',
      'date': DateTime.now().toString(),
    });
    print(response.statusCode);
    print(response.body);
    return json.decode(response.body);
  }
}
