import 'package:flutter/material.dart';
import 'package:m_bloc_office/data/model/new_office_modle.dart';
import 'package:m_bloc_office/data/model/staff_model.dart';
import 'package:m_bloc_office/modules/office_listing_screen.dart';

import 'package:m_bloc_office/modules/office_view_screen.dart';
import 'package:m_bloc_office/routes/routes.dart';

import '../modules/new_office/Edit_screen.dart';
import '../modules/new_office/Edit_staff_dailoWidgets.dart';
import '../modules/new_office/new_office_screen.dart';

class AppPages {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case BaseRoute.officeViewScreen:
        final office = settings.arguments as OfficeModel;
        return MaterialPageRoute(builder: (_) =>  OfficeViewScreen(officeModel: office,));
      case BaseRoute.officeScreen:
        return MaterialPageRoute(builder: (_) => const OfficeListingScreen());
      case BaseRoute.newOfficeScreen:return MaterialPageRoute(builder: (_) => const NewOfficeScreen());
      case BaseRoute.editOfficeScreen:
        final office = settings.arguments as OfficeModel;
        return MaterialPageRoute(builder: (_) =>  EditOfficeScreen(office:  office));
      case BaseRoute.editStaffDailowidgets:

        return MaterialPageRoute(builder: (_) =>  EditStaffDailowidgets());
      default:
        return MaterialPageRoute(builder: (_) => const OfficeListingScreen());
    }
  }
}
