part of 'new_office_bloc.dart';


 class NewOfficeState extends Equatable {

  const NewOfficeState();
  @override
  List<Object?> get props => throw UnimplementedError();
}

 class NewOfficeInitial extends NewOfficeState {

  const NewOfficeInitial();
  @override

  List<Object?> get props => throw UnimplementedError();
}


class NewOfficeUpload extends NewOfficeState {
  @override

  List<Object?> get props => [];
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

  const OfficeStaffLoaded(this.staff);
}
