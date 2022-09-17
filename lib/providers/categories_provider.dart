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
    categorias = [...categoriesResponse.categorias];
    print(categorias);
    notifyListeners();
  }

  Future newCategory(String name) async {
    final data = {
      // this is the data that we are going to send to the server
      'nombre': name,
    };

    try {
      final json = await CafeApi.post('/categorias', data);
      final newCategory = Categoria.fromMap(json);
      categorias.add(newCategory);
      notifyListeners(); // this is to notify the changes in the state of the application
    } catch (e) {
      print(e);
      print('Error al crear la categoria');
    }
  }
}
