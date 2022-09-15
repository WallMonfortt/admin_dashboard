import 'package:admin_dashboard/api/cafe_api.dart';
import 'package:admin_dashboard/models/category.dart';
import 'package:admin_dashboard/models/http/categories_response.dart';
import 'package:flutter/material.dart';

class CategoriesProvider extends ChangeNotifier {
  // changeNotifier is a class that allows to notify the changes in the state of the application
  List<Categoria> categorias = [];
  getCategories() async {
    final resp = await CafeApi.httpGet('/categorias');
    final categoriesResponse = CategoriesResponse.fromMap(resp);
    this.categorias = [...categoriesResponse.categorias];
    print(this.categorias);
    notifyListeners();
  }
}
