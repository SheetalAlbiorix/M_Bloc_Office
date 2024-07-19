import 'package:flutter/material.dart';
import 'package:m_bloc_office/routes/pages.dart';
import 'package:m_bloc_office/routes/routes.dart';
import 'core/values/base_colors.dart';
import 'modules/office_listing_screen.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: BaseRoute.officeScreen,
        onGenerateRoute: AppPages.generateRoute,
      color: BaseColors.canvasColor,
   debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const OfficeListingScreen()
    );
  }
}




