part of 'new_office_bloc.dart';

@immutable
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