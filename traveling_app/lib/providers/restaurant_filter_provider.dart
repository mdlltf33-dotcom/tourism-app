import 'package:flutter/material.dart';

class RestaurantFilterProvider with ChangeNotifier {
  String? _selectedFilter;

  String? get selectedFilter => _selectedFilter;

  void selectFilter(String filter) {
    if (_selectedFilter == filter) {
      _selectedFilter = null; // إلغاء الفلترة إذا تم الضغط على نفس الفلتر
    } else {
      _selectedFilter = filter; // تطبيق الفلترة الجديدة
    }
    notifyListeners();
  }

  void clearFilter() {
    _selectedFilter = null;
    notifyListeners();
  }
}
