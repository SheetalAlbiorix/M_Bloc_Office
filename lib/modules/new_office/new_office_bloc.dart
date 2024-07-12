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

  final List<StaffModel> staffList = [];
  Color? selectedColor;
  NewOfficeBloc(this.officeRepository) : super(const NewOfficeInitial()) {
    on<NewOfficeEvent>((event, emit) {
    });
    on<AddNewOfficeEvent>(onAddOffice);
    on<UpdateOfficeEvent>(updateOfficeData);
    on< SelectColor>(addOfficeSelectedColor);
    on<FetchOffices>(fetchOfficeData);
    on<DeleteOffice>(deleteOfficeData);
    on<FetchOfficeStaff>(onFetchOfficeStaff);
    on<AddStaff>(addStaffMember);
    on<SelectAvatar>(addAvatar);
    on<UpdateStaffOfficeEvent>(updateStaffOfficeData);
    on<DeleteStaffEvent>(deleteStaff);
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


  Future<void> addStaffMember(AddStaff event, Emitter<NewOfficeState> emit) async {
    try {
      await officeRepository.createStaff(event.staff);
      await onFetchOfficeStaff(FetchOfficeStaff(event.staff.officeId), emit);
    } catch (e) {
      emit(NewOfficeError(e.toString()));
    }
  }

  Future<void> onFetchOfficeStaff(FetchOfficeStaff event, Emitter<NewOfficeState> emit) async {

    emit(OfficeLoading());
    try {


      final staffList = await officeRepository.readAllStaffByID(event.officeId);
      if ((staffList?? []).isEmpty) {
        emit(OfficeNoData());
      } else {
        emit(OfficeStaffLoaded(staffList));
      }

    } catch (e) {
      emit(NewOfficeError(e.toString()));
    }
  }

  Future<void> addAvatar(NewOfficeEvent event,Emitter<NewOfficeState>emit) async {
    if (event is SelectAvatar) {
      emit( avatarSelected(event.avatarPath));
    }
  }



Future<void> updateStaffOfficeData(UpdateStaffOfficeEvent event,Emitter<NewOfficeState>emit) async {
      try {
        final success = await officeRepository.updateOfficeStaff(event.staff);
        emit(OfficeLoading());
        if (success) {
          emit( StaffUpdateSuccess(event.staff));
        } else {
          emit( StaffUpdateFailure("Failed to update staff"));
        }
      } catch (error) {
        emit(  StaffUpdateFailure(error.toString()));
      }

  }


  Future<void>  deleteStaff(NewOfficeEvent event,Emitter<NewOfficeState> emit) async {
    try {
      if(event is DeleteStaffEvent){
        await officeRepository.deleteStaff(event.staffId);
        emit( const StaffDeleted());
      }
      if(emit is StaffDeleted){
        if(event is FetchStaff) {
          final staffList = await officeRepository.readAllStaffByID(event.officeId);
          emit( StaffLoaded(staffList ?? []));
        }

      }


    } catch (e) {
      emit( StaffError(e.toString()));
    }
  }

  Future<void> searchStaff(SearchStaff event, Emitter<NewOfficeState> emit) async {
    final query = event.query.toLowerCase();
    final filteredStaffList = staffList.where((staff) {
      final name = staff.name?.toLowerCase();
      final lastName = staff.lastName?.toLowerCase();
      return (name?? "").contains(query) || (lastName?? "").contains(query);
    }).toList();
    emit(StaffSearchSuccess(filteredStaffList));
  }

}

///dead code

