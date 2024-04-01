// ignore_for_file: use_build_context_synchronously

import 'package:app_test/features/authentication/repo/user_repository.dart';
import 'package:app_test/features/home/home_screen.dart';
import 'package:app_test/features/survey-format/model/survey_model.dart';
import 'package:app_test/features/survey-format/repo/survey_repository.dart';
import 'package:app_test/utils/theme/widget_themes/custom_snackbar.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
part 'survey_form_event.dart';
part 'survey_form_state.dart';

class SurveyFormBloc extends Bloc<SurveyFormEvent, SurveyFormState> {
  final SurveyRepository surveyRepository;
  final UserRepository userRepository = UserRepository();
  SurveyFormBloc(this.surveyRepository) : super(SurveyFormInitial()) {
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
      emit(state.copyWith(
          physicalActivityDuration: event.physicalActivityDuration));
    });
    on<SurveyFormAreaStructureEvent>((event, emit) {
      emit(state.copyWith(areaStructure: event.areaStructure));
    });
    on<SurveyFormLivingStatusEvent>((event, emit) {
      emit(state.copyWith(livingStatus: event.livingStatus));
    });
    on<SurveyFormLifeStatusWithRoommatesEvent>((event, emit) {
      emit(state.copyWith(
          lifeStatusWithRoommates: event.lifeStatusWithRoommates));
    });
    on<SurveyFormCloseWithFamilyRelationshipEvent>((event, emit) {
      emit(state.copyWith(
          closeWithFamilyRelationship: event.closeWithFamilyRelationship));
    });
    on<SurveyFormOftenInteractionWithFamily>((event, emit) {
      emit(state.copyWith(
          oftenInteractionWithFamily: event.oftenInteractionWithFamily));
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
      emit(state.copyWith(
          personalRelationshipStatus: event.personalRelationshipStatus));
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
      emit(state.copyWith(
          prescribedMedicationList: event.prescribedMedicationList));
    });
    on<SurveyFormAdditionDescriptionEvent>((event, emit) {
      emit(state.copyWith(additionDescription: event.additionDescription));
    });
    on<SurveyFormCurrentPage>((event, emit) {
      emit(state.copyWith(currentPage: event.currentPage));
    });

    on<SurveyFormIncrementCurrentPage>((event, emit) {
      emit(state.copyWith(currentIncrement: event.currentIncrement));
    });
    on<SurveyFormSubmitEvent>((event, emit) async {
      emit(state.copyWith(status: event.status));
      if (event.status == TSurveyFormStatus.loading) {
        String formattedDate = DateFormat('yyyy-MM-dd').format(state.dateTime);
        final userFromStorage = await userRepository.getUserFromStorage();
        if (userFromStorage == null) {
          throw Exception('User not found in storage');
        }
        final surveyModel = SurveyModel(
          userId: userFromStorage.id,
          isCompleted: true,
          dateTime: formattedDate,
          occupation: state.occupation,
          occupationHrs: state.occupationHrs,
          physicalActivityDuration: state.physicalActivityDuration,
          areaStructure: state.areaStructure,
          livingStatus: state.livingStatus,
          lifeStatusWithRoommates: state.lifeStatusWithRoommates,
          closeWithFamilyRelationship: state.closeWithFamilyRelationship,
          oftenInteractionWithFamily: state.oftenInteractionWithFamily,
          commonRebutals: state.commonRebutals,
          siblingsNumber: state.siblingsNumber,
          siblingsNumberStatus: state.siblingsNumberStatus,
          personalRelationshipStatus: state.personalRelationshipStatus,
          smokeCannabis: state.smokeCannabis,
          oftenSmokeCannabis: state.oftenSmokeCannabis,
          drinkAlcohol: state.drinkAlcohol,
          oftenDrinkAlcohol: state.oftenDrinkAlcohol,
          drugConsumption: state.drugConsumption,
          parentsDivorced: state.parentsDivorced,
          prescribedMedication: state.prescribedMedication,
          prescribedMedicationList: state.prescribedMedicationList,
          additionDescription: state.additionDescription,
        );

        Map<String, dynamic> response =
            await surveyRepository.saveSurvey(surveyModel);
        final String message = response['message'];
        final SurveyModel surveyResponse = response['survey'];
        CustomSnackbar.show(event.context, message, 'Success');
        Future.delayed(const Duration(seconds: 2), () {
          Navigator.push(
            event.context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );
        });
        emit(state.copyWith(status: TSurveyFormStatus.success));
      } else {
        CustomSnackbar.show(event.context, 'Survey Failed !', 'Error');
        emit(state.copyWith(status: TSurveyFormStatus.failure));
      }
    });

    on<SurveyFormResetEvent>((event, emit) {
      emit(state.copyWith(
          dateTime: DateTime.now(),
          occupation: [],
          occupationHrs: '',
          physicalActivityDuration: '',
          areaStructure: '',
          livingStatus: '',
          lifeStatusWithRoommates: '',
          closeWithFamilyRelationship: '',
          oftenInteractionWithFamily: '',
          commonRebutals: '',
          siblingsNumber: '',
          siblingsNumberStatus: '',
          personalRelationshipStatus: '',
          smokeCannabis: '',
          oftenSmokeCannabis: '',
          drinkAlcohol: '',
          oftenDrinkAlcohol: '',
          drugConsumption: '',
          parentsDivorced: '',
          prescribedMedication: '',
          prescribedMedicationList: [],
          additionDescription: '',
          status: TSurveyFormStatus.initial,
          currentPage: state.currentPage,
          currentIncrement: 1));
    });

    on<SurveyFormResetEventOptionals>((event, emit) {
      emit(state.copyWith(
        prescribedMedication: '',
        prescribedMedicationList: [''],
        status: TSurveyFormStatus.loading,
        additionDescription: '',
      ));
    });
  }
}
