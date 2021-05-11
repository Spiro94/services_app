import 'package:flutter/material.dart';
import 'package:services_app/features/service_request/presentation/screens/book_service_page/book_service_page.dart';
import 'package:services_app/features/service_request/presentation/screens/login_page/login_page.dart';
import 'package:services_app/features/service_request/presentation/screens/select_category_page/select_category_page.dart';
import 'package:services_app/features/service_request/presentation/screens/select_person_page/select_person_page.dart';

Map<String, WidgetBuilder> routes = {
  LoginPage.routeName: (context) => LoginPage(),
  SelectCategoryPage.routeName: (context) => SelectCategoryPage(),
  SelectPersonPage.routeName: (context) => SelectPersonPage(),
  ServiceBookPage.routeName: (context) => ServiceBookPage(),
};
