import 'package:stacked/stacked.dart';

class AppService with ListenableServiceMixin {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void onItemTapped(int value) {
    _selectedIndex = value;
    notifyListeners();
  }
}
