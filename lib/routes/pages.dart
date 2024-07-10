
import 'package:flutter/material.dart';
import 'package:m_bloc_office/modules/office_screen.dart';
import 'package:m_bloc_office/modules/office_view_screen.dart';
import 'package:m_bloc_office/routes/routes.dart';

import '../modules/new_office/new_office_screen.dart';

class AppPages {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case BaseRoute.officeViewScreen:return MaterialPageRoute(builder: (_) => const OfficeViewScreen());
      case BaseRoute.officeScreen:return MaterialPageRoute(builder: (_) => const OfficeScreen());
      case BaseRoute.newOfficeScreen:return MaterialPageRoute(builder: (_) => const NewOfficeScreen());
      default:
        return MaterialPageRoute(builder: (_) => const OfficeScreen());
    }
  }
}