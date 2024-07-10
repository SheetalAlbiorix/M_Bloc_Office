part of 'new_office_bloc.dart';

@immutable
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


class NewOfficeUploading extends NewOfficeState {
  @override

  List<Object?> get props => throw UnimplementedError();
}

class OfficeAdded extends NewOfficeState {}

class  NewOfficeError extends NewOfficeState {
  final String? message;

  const NewOfficeError(this.message);

  @override
  List<Object> get props => [message ?? ""];
}