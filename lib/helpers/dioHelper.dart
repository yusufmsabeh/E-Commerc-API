import 'dart:developer';

import 'package:dio/dio.dart';

import '../model/product.dart';

class dioHelper {
  dioHelper._();
  static dioHelper diohelper = dioHelper._();
  Dio dio = Dio();

  getAllProducts() async {
    Response response = await dio.get("https://fakestoreapi.com/products");
    List dataList = response.data;
    List<Product> products = dataList
        .map(
          (e) => Product.fromaMap(e),
        )
        .toList();
    return products;
  }

  getAllCat() async {
    Response response =
        await dio.get('https://fakestoreapi.com/products/categories');
    List cat = response.data;
    return cat;
  }

  getAllCatForSpcefi(String cat) async {
    Response response =
        await dio.get("https://fakestoreapi.com/products/category/$cat");
    List dataList = response.data;
    List<Product> products = dataList
        .map(
          (e) => Product.fromaMap(e),
        )
        .toList();
    return products;
  }

  getOneProduct(String id) async {
    Response response = await dio.get('https://fakestoreapi.com/products/$id');
    Product product = Product.fromaMap(response.data);
    log(product.toString());
    return product;
  }
}
