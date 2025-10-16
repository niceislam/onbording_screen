import 'dart:developer';

import 'package:new_eapp/new_eapp/database/productData.dart';
import 'package:new_eapp/new_eapp/model/Product_model.dart';

class ProductCon {
  List<ProductModel> Model = [];
  Future makeModel() async {
    await Future.delayed(Duration(seconds: 3));
    for (var i in ProductDatabase().Product) {
      var model = await ProductModel.fromJson(i);
      Model.add(model);
    }
    return Model;
  }
}
