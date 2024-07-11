
import 'package:m_bloc_office/data/model/new_office_modle.dart';
import 'package:m_bloc_office/data/model/staff_model.dart';

import '../provider/db_provider.dart';


class OfficeRepository {
  final OfficeDatabase? officeDatabase;

  OfficeRepository({this.officeDatabase});

  Future<OfficeModel?> createOffice(OfficeModel office) async {
    return await officeDatabase?.create(office);
  }

  Future<List<OfficeModel>?> getAllOfficesData() async {
    return await officeDatabase?.readAllOffices();
  }

  Future<void> update(OfficeModel office) async {
    await officeDatabase?.update(office);
  }

  Future<void> delete(int id) async {
    await officeDatabase?.delete(id);
  }


  Future<StaffModel?> createStaff(StaffModel staff) async {
    return await officeDatabase?.createStaff(staff);
  }

  Future<List<StaffModel>?> readAllStaff() async {
    return await officeDatabase?.readAllStaff();
  }
  Future<List<StaffModel>?> readAllStaffByID(int officeId ) async {
    return await officeDatabase?.readStaffByOffice(officeId);
  }
}