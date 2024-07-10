import 'package:flutter/material.dart';
import 'package:m_bloc_office/core/values/base_colors.dart';
import 'package:m_bloc_office/modules/office_screen.dart';
import 'package:m_bloc_office/routes/pages.dart';
import 'package:m_bloc_office/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: BaseRoute.officeViewScreen,
        onGenerateRoute: AppPages.generateRoute,
      color: BaseColors.canvasColor,
   debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: OfficeScreen()
    );
  }
}




