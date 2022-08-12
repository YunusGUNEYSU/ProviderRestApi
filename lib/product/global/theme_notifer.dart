import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LightTheme extends ChangeNotifier {
  bool isLightTheme=false;

  void changeTheme(){
    isLightTheme=!isLightTheme;
    notifyListeners();
  }
  ThemeData get currentTheme => isLightTheme ?ThemeData.light():ThemeData.dark();
}
