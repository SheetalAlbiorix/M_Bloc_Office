
import 'package:m_bloc_office/data/model/new_office_modle.dart';

import '../provider/db_provider.dart';


class OfficeRepository {
  final OfficeDatabase? officeDatabase;

  OfficeRepository({this.officeDatabase});

  Future<OfficeModel?> createOffice(OfficeModel office) async {
    return await officeDatabase?.create(office);
  }

  Future<List<OfficeModel>?> getAllOffices() async {
    return await officeDatabase?.readAllOffices();
  }

}