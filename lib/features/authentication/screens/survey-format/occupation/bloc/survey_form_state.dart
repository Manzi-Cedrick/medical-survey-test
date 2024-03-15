part of 'survey_form_bloc.dart';

enum TSurveyFormStatus {
  initial,
  loading,
  success,
  failure,
}
class SurveyFormState extends Equatable {
  const SurveyFormState({
    required this.dateTime,
    required this.occupation,
    required this.occupationHrs,
    required this.physicalActivityDuration,
    required this.areaStructure,
    required this.livingStatus,
    required this.lifeStatusWithRoommates,
    required this.closeWithFamilyRelationship,
    required this.oftenInteractionWithFamily,
    required this.commonRebutals,
    required this.siblingsNumber,
    required this.siblingsNumberStatus,
    required this.personalRelationshipStatus,
    required this.smokeCannabis,
    required this.oftenSmokeCannabis,
    required this.smokeCigarettes,
    required this.oftenSmokeCigarettes,
    required this.drinkAlcohol,
    required this.oftenDrinkAlcohol,
    required this.drugConsumption,
    required this.prescribedMedication,
    required this.prescribedMedicationList,
    required this.additionDescription,
    required this.parentsDivorced,
    required this.status,
    required this.currentPage,
    required this.currentIncrement
  });

  final DateTime dateTime;
  final List<String> occupation;
  final String occupationHrs;
  final String physicalActivityDuration;
  final String areaStructure;
  final String livingStatus;
  final String lifeStatusWithRoommates;
  final String closeWithFamilyRelationship;
  final String oftenInteractionWithFamily;
  final String commonRebutals;
  final String siblingsNumber;
  final String siblingsNumberStatus;
  final String parentsDivorced;
  final String personalRelationshipStatus;
  final String smokeCannabis;
  final String oftenSmokeCannabis;
  final String smokeCigarettes;
  final String oftenSmokeCigarettes;
  final String drinkAlcohol;
  final String oftenDrinkAlcohol;
  final String drugConsumption;
  final String prescribedMedication;
  final List<String> prescribedMedicationList;
  final String additionDescription;
  final TSurveyFormStatus status;
  final int currentPage;
  final int currentIncrement;
  SurveyFormState copyWith(
      {DateTime? dateTime,
      List<String>? occupation,
      String? occupationHrs,
      String? physicalActivityDuration,
      String? areaStructure,
      String? livingStatus,
      String? lifeStatusWithRoommates,
      String? closeWithFamilyRelationship,
      String? oftenInteractionWithFamily,
      String? parentsDivorced,
      String? commonRebutals,
      String? siblingsNumber,
      String? siblingsNumberStatus,
      String? personalRelationshipStatus,
      String? smokeCannabis,
      String? oftenSmokeCannabis,
      String? smokeCigarettes,
      String? oftenSmokeCigarettes,
      String? drinkAlcohol,
      String? oftenDrinkAlcohol,
      String? drugConsumption,
      String? prescribedMedication,
      List<String>? prescribedMedicationList,
      TSurveyFormStatus? status,
      String? additionDescription,
      int? currentPage,
      int? currentIncrement
      }) {
    return SurveyFormState(
      dateTime: dateTime ?? this.dateTime,
      occupation: occupation ?? this.occupation,
      occupationHrs: occupationHrs ?? this.occupationHrs,
      physicalActivityDuration: physicalActivityDuration ?? this.physicalActivityDuration,
      areaStructure: areaStructure ?? this.areaStructure,
      livingStatus: livingStatus ?? this.livingStatus,
      lifeStatusWithRoommates: lifeStatusWithRoommates ?? this.lifeStatusWithRoommates,
      closeWithFamilyRelationship: closeWithFamilyRelationship ?? this.closeWithFamilyRelationship,
      oftenInteractionWithFamily: oftenInteractionWithFamily ?? this.oftenInteractionWithFamily,
      parentsDivorced: parentsDivorced ?? this.parentsDivorced,
      commonRebutals: commonRebutals ?? this.commonRebutals,
      siblingsNumber: siblingsNumber ?? this.siblingsNumber,
      siblingsNumberStatus: siblingsNumberStatus ?? this.siblingsNumberStatus,
      personalRelationshipStatus: personalRelationshipStatus ?? this.personalRelationshipStatus,
      smokeCannabis: smokeCannabis ?? this.smokeCannabis,
      oftenSmokeCannabis: oftenSmokeCannabis ?? this.oftenSmokeCannabis,
      smokeCigarettes: smokeCigarettes ?? this.smokeCigarettes,
      oftenSmokeCigarettes: oftenSmokeCigarettes ?? this.oftenSmokeCigarettes,
      drinkAlcohol: drinkAlcohol ?? this.drinkAlcohol,
      oftenDrinkAlcohol: oftenDrinkAlcohol ?? this.oftenDrinkAlcohol,
      drugConsumption: drugConsumption ?? this.drugConsumption,
      prescribedMedication: prescribedMedication ?? this.prescribedMedication,
      prescribedMedicationList: prescribedMedicationList ?? this.prescribedMedicationList,
      additionDescription: additionDescription ?? this.additionDescription,
      status: status ?? this.status,
      currentPage: currentPage ?? this.currentPage,
      currentIncrement: currentIncrement ?? this.currentIncrement
    );
  }

  @override
  List<Object> get props => [
        dateTime,
        occupation,
        occupationHrs,
        physicalActivityDuration,
        areaStructure,
        livingStatus,
        lifeStatusWithRoommates,
        closeWithFamilyRelationship,
        oftenInteractionWithFamily,
        commonRebutals,
        siblingsNumber,
        siblingsNumberStatus,
        personalRelationshipStatus,
        smokeCannabis,
        oftenSmokeCannabis,
        smokeCigarettes,
        oftenSmokeCigarettes,
        drinkAlcohol,
        oftenDrinkAlcohol,
        parentsDivorced,
        drugConsumption,
        prescribedMedication,
        prescribedMedicationList,
        additionDescription,
        status,
        currentPage,
        currentIncrement
      ];
}

final class SurveyFormInitial extends SurveyFormState {
  SurveyFormInitial()
      : super(
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
          smokeCigarettes: '',
          oftenSmokeCigarettes: '',
          drinkAlcohol: '',
          oftenDrinkAlcohol: '',
          drugConsumption: '',
          parentsDivorced: '',
          prescribedMedication: '',
          prescribedMedicationList: [],
          additionDescription: '',
          status: TSurveyFormStatus.initial,
          currentPage: 1,
          currentIncrement: 1
        );
}
