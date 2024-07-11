part of 'new_office_bloc.dart';

  class NewOfficeEvent extends Equatable{
  const NewOfficeEvent();
  @override

  List<Object?> get props =>[];
}
class AddNewOfficeEvent extends NewOfficeEvent {

  final OfficeModel officeModel;

  const AddNewOfficeEvent(
      {
   required this.officeModel
  });

  @override
  List<Object> get props => [officeModel ?? [] ];
}

class SelectColor extends NewOfficeEvent {
  final Color color;

  const SelectColor(this.color);

  @override
  List<Object> get props => [color];
}

class FetchOffices extends NewOfficeEvent {}

class UpdateOfficeEvent extends NewOfficeEvent {
  final OfficeModel office;

  const UpdateOfficeEvent(this.office);

  @override
  List<Object> get props => [office];
}


class DeleteOffice extends NewOfficeEvent {
  final int id;

  DeleteOffice(this.id);

  @override
  List<Object> get props => [id];
}

class FetchStaff extends NewOfficeEvent {
  final int officeId;

  FetchStaff(this.officeId);

  @override
  List<Object> get props => [officeId];
}

class AddStaff extends NewOfficeEvent {
  final StaffModel staff;

  const AddStaff(this.staff);

  @override
  List<Object> get props => [staff];
}

class FetchOfficeStaff extends NewOfficeEvent {}
class SelectAvatar extends NewOfficeEvent {
  final String avatarPath;

  SelectAvatar(this.avatarPath);
}

