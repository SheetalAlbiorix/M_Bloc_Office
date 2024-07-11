import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:m_bloc_office/data/model/new_office_modle.dart';
import 'package:m_bloc_office/data/model/staff_model.dart';


import '../../data/services/repository.dart';

part 'new_office_event.dart';
part 'new_office_state.dart';

class NewOfficeBloc extends Bloc<NewOfficeEvent, NewOfficeState> {
  final  OfficeRepository officeRepository ;
  Color? selectedColor;
  NewOfficeBloc(this.officeRepository) : super(const NewOfficeInitial()) {
    on<NewOfficeEvent>((event, emit) {
    });
    on<AddNewOfficeEvent>(onAddOffice);
    on<UpdateOfficeEvent>(updateOfficeData);
    on< SelectColor>(addOfficeSelectedColor);
    on<FetchOffices>(fetchOfficeData);
    on<DeleteOffice>(deleteOfficeData);
    on<AddStaff>(addStaffMember);
  }


  Future<void> fetchOfficeData(NewOfficeEvent event,Emitter<NewOfficeState> emit) async {
    if (event is FetchOffices) {
      emit( OfficeLoading());
      try {
        final offices = await officeRepository.getAllOfficesData();
        emit( OfficeLoaded(offices ?? []));
      } catch (e) {
        emit( const NewOfficeError("Failed to fetch offices"));
      }
    }
  }
  Future<void> onAddOffice(AddNewOfficeEvent event, Emitter<NewOfficeState> emit) async {
    emit(OfficeLoading());
      try {
        await officeRepository.createOffice(event.officeModel);
        emit(OfficeAdded());
      } catch (e) {
        emit(NewOfficeError(e.toString()));
      }


  }

  Future<void> addOfficeSelectedColor(NewOfficeEvent event, Emitter<NewOfficeState> emit) async {
    if(event is SelectColor){
      selectedColor = event.color;
      emit( ColorSelected(event.color));
    }
  }

  Future<void> updateOfficeData(UpdateOfficeEvent event, Emitter<NewOfficeState> emit) async {
    emit(OfficeLoading());
    try {
      await officeRepository.update(event.office);
      final offices = await officeRepository.getAllOfficesData();
      if(offices !=null){
        emit(OfficeLoaded(offices));
      }
      emit(OfficeAdded());
    } catch (_) {
      emit( const NewOfficeError("Failed to update office."));
    }
  }


  Future<void> deleteOfficeData(DeleteOffice event, Emitter<NewOfficeState> emit) async {
    try {
      await officeRepository.delete(event.id);
      final offices = await officeRepository.getAllOfficesData();
      if(offices !=null){
        emit(OfficeLoaded(offices));

      }
      emit(OfficeDeleted());
    } catch (e) {
      emit( const NewOfficeError("Failed to delete office."));
    }
  }


  Future<void> addStaffMember(AddStaff event,Emitter<NewOfficeState>emit) async {
    try {
      await officeRepository.createStaff(event.staff);
      emit(fetchStaffToState(FetchStaff(int.parse(event.staff.officeId))));
    } catch (e) {
      emit( NewOfficeError(e.toString()));
    }
  }
  fetchStaffToState(FetchStaff event,) async {
    if(event is FetchOfficeStaff) {
      emit(OfficeLoading());
      try {
        final staffList = await officeRepository.readAllStaffByID(
            event.officeId);
        emit(OfficeStaffLoaded(staffList));
      } catch (e) {
        emit(NewOfficeError(e.toString()));
      }
    }
  }

  Future<void> addAvatar(NewOfficeEvent event,Emitter<NewOfficeState>emit) async {
    if (event is SelectAvatar) {
      emit( avatarSelected(event.avatarPath));
    }
  }
}
