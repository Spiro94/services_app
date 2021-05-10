import 'package:flutter/material.dart';
import 'package:services_app/core/routes/routes.dart';

import 'features/service_request/presentation/screens/select_category_page/select_category_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Services',
      debugShowCheckedModeBanner: false,
      initialRoute: SelectCategoryPage.routeName,
      routes: routes,
    );
  }
}
