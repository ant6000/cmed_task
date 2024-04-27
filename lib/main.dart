import 'package:cmed_task/views/pages/details_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bindings/views_bindings.dart';
import 'views/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Harry Potter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/homepage',
      getPages: [
        GetPage(
            name: '/homepage',
            page: () => HomePage(),
            binding: CharacterBindings()),
      ],
    );
  }
}
