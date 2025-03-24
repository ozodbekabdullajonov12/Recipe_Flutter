import 'package:flutter/material.dart';

class LocalizationViewModel extends ChangeNotifier{

Locale _currentLocale=Locale("uz");

Locale get currentLocale=>_currentLocale;

set currentLocale(Locale locale){
  _currentLocale=locale;
  notifyListeners();
}
}