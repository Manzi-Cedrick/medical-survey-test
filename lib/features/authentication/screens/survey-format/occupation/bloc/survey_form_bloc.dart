import 'package:app_test/features/authentication/screens/survey-format/occupation/13_thirteen_screen.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
part 'survey_form_event.dart';
part 'survey_form_state.dart';

class SurveyFormBloc extends Bloc<SurveyFormEvent, SurveyFormState> {
  SurveyFormBloc() : super(SurveyFormInitial()) {
    on<SurveyFormStart>((event, emit) {
      emit(SurveyFormInitial());
    });
    on<SurveyFormDateTimeEvent>((event, emit) {
      // print(state.dateTime);
      emit(state.copyWith(dateTime: event.dateTime));
    });
    on<SurveyFormOccupationEvent>((event, emit) {
      // print('Reached here');
      emit(state.copyWith(occupation: event.occupation));
    });
    on<SurveyFormOccupationHrsEvent>((event, emit) {
      emit(state.copyWith(occupationHrs: event.occupationHrs));
    });
    on<SurveyFormPhysicalActivityDurationEvent>((event, emit) {
      // print(event.physicalActivityDuration);
      emit(state.copyWith(physicalActivityDuration: event.physicalActivityDuration));
    });
    on<SurveyFormAreaStructureEvent>((event, emit) {
      emit(state.copyWith(areaStructure: event.areaStructure));
    });
    on<SurveyFormLivingStatusEvent>((event, emit) {
      emit(state.copyWith(livingStatus: event.livingStatus));
    });
    on<SurveyFormLifeStatusWithRoommatesEvent>((event, emit) {
      emit(state.copyWith(lifeStatusWithRoommates: event.lifeStatusWithRoommates));
    });
    on<SurveyFormCloseWithFamilyRelationshipEvent>((event, emit) {
      print(event.closeWithFamilyRelationship);
      emit(state.copyWith(closeWithFamilyRelationship: event.closeWithFamilyRelationship));
    });
    on<SurveyFormOftenInteractionWithFamily>((event, emit) {
      print(event.oftenInteractionWithFamily);
      emit(state.copyWith(oftenInteractionWithFamily: event.oftenInteractionWithFamily));
    });
    on<SurveyFormCommonRebutalsEvent>((event, emit) {
      emit(state.copyWith(commonRebutals: event.commonRebutals));
    });
    on<SurveyFormSiblingsNumberEvent>((event, emit) {
      emit(state.copyWith(siblingsNumber: event.siblingsNumber));
    });
    on<SurveyFormSiblingsNumberStatusEvent>((event, emit) {
      emit(state.copyWith(siblingsNumberStatus: event.siblingsNumberStatus));
    });
    on<SurveyFormPersonalRelationshipStatusEvent>((event, emit) {
      emit(state.copyWith(personalRelationshipStatus: event.personalRelationshipStatus));
    });
    on<SurveyFormParentsDivorcedEvent>((event, emit) {
      emit(state.copyWith(parentsDivorced: event.parentsDivorced));
    });
    on<SurveyFormSmokeCannabisEvent>((event, emit) {
      emit(state.copyWith(smokeCannabis: event.smokeCannabis));
    });
    on<SurveyFormOftenSmokeCannabis>((event, emit) {
      emit(state.copyWith(oftenSmokeCannabis: event.oftenSmokeCannabis));
    });
    on<SurveyFormSmokeCigarettesEvent>((event, emit) {
      emit(state.copyWith(smokeCigarettes: event.smokeCigarettes));
    });
    on<SurveyFormOftenSmokeCigarettes>((event, emit) {
      emit(state.copyWith(oftenSmokeCigarettes: event.oftenSmokeCigarettes));
    });
    on<SurveyFormDrinkAlcoholEvent>((event, emit) {
      emit(state.copyWith(drinkAlcohol: event.drinkAlcohol));
    });
    on<SurveyFormOftenDrinkAlcohol>((event, emit) {
      emit(state.copyWith(oftenDrinkAlcohol: event.oftenDrinkAlcohol));
    });
    on<SurveyFormDrugConsumptionEvent>((event, emit) {
      emit(state.copyWith(drugConsumption: event.drugConsumption));
    });
    on<SurveyFormPrescribedMedication>((event, emit) {
      emit(state.copyWith(prescribedMedication: event.prescribedMedication));
    });
    on<SurveyFormPrescribedMedicationListEvent>((event, emit) {
      emit(state.copyWith(prescribedMedicationList: event.prescribedMedicationList));
    });
    on<SurveyFormAdditionDescriptionEvent>((event, emit) {
      emit(state.copyWith(additionDescription: event.additionDescription));
    });
    on<SurveyFormSubmitEvent>((event, emit) {
      print(state.toString());
      emit(state.copyWith(status: event.status));
    });
  }
}