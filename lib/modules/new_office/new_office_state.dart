part of 'new_office_bloc.dart';

 class NewOfficeState extends Equatable {

  const NewOfficeState();
  @override
  List<Object?> get props => [];
}

 class NewOfficeInitial extends NewOfficeState {

  const NewOfficeInitial();
  @override

  List<Object?> get props => throw UnimplementedError();
}

class OfficeLoading extends NewOfficeState {}
class OfficeAdded extends NewOfficeState {}
class OfficeDeleted extends NewOfficeState {}

class  NewOfficeError extends NewOfficeState {
  final String? message;

  const NewOfficeError(this.message);

  @override
  List<Object> get props => [message ?? ""];
}

class ColorSelected extends NewOfficeState {
  final Color selectedColor;

  const ColorSelected(this.selectedColor);

  @override
  List<Object> get props => [selectedColor];
}

class OfficeLoaded extends NewOfficeState {
  final List<OfficeModel> offices;

  const OfficeLoaded(this.offices);
}

class StaffLoaded extends NewOfficeState {
  final List<StaffModel> staff;

  const StaffLoaded(this.staff);

  @override
  List<Object> get props => [staff];
}


class avatarSelected extends NewOfficeState {
  final String? avtar;

  const avatarSelected(this.avtar);

  @override
  List<Object> get props => [avtar ??""];
}

class OfficeStaffLoaded extends NewOfficeState {

  final List<StaffModel>? staff;

  OfficeStaffLoaded(this.staff);
}

class StaffUpdateFailure extends NewOfficeState {
  final String error;

  StaffUpdateFailure(this.error);
}

class OfficeNoData extends NewOfficeState {}

class OfficeStaffAdded extends NewOfficeState {}

class StaffUpdateSuccess extends NewOfficeState {
  final StaffModel updatedStaff;

  StaffUpdateSuccess(this.updatedStaff);
}
class StaffDeleted extends NewOfficeState {


  const StaffDeleted();
  @override
  List<Object> get props => [];
}

class StaffSearchSuccess extends NewOfficeState {
  final List<StaffModel> filteredStaffList;

  const StaffSearchSuccess(this.filteredStaffList);

  @override
  List<Object> get props => [filteredStaffList];

  @override
  String toString() => 'SearchStateSuccess { items: ${filteredStaffList.length} }';
}


final class SearchStateLoading extends NewOfficeState {}
final class SearchStateEmpty extends NewOfficeState {}

final class SearchStateError extends NewOfficeState {
  const SearchStateError(this.error);

  final String error;

  @override
  List<Object> get props => [error];
}
class StaffError extends NewOfficeState {
  final String error;

  StaffError(this.error);
}
