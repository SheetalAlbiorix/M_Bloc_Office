import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:m_bloc_office/data/model/new_office_modle.dart';
import 'package:meta/meta.dart';

import '../../data/services/repository.dart';

part 'new_office_event.dart';
part 'new_office_state.dart';

class NewOfficeBloc extends Bloc<NewOfficeEvent, NewOfficeState> {
  final  OfficeRepository officeRepository = OfficeRepository();
  NewOfficeBloc() : super(const NewOfficeInitial()) {
    on<NewOfficeEvent>((event, emit) {
      // TODO: implement event handler
    });
  }

  Future<void> onAddOffice(AddNewOfficeEvent event, Emitter<NewOfficeState> emit) async {
    emit(NewOfficeUploading());

    try {
      await officeRepository.createOffice(event.officeModel);
      emit(OfficeAdded());
    } catch (e) {
      emit(NewOfficeError(e.toString()));
    }
  }
}
