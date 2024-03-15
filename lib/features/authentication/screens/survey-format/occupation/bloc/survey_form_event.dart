part of 'survey_form_bloc.dart';

class SurveyFormEvent extends Equatable {
  const SurveyFormEvent();

  @override
  List<Object> get props => [];
}

class SurveyFormStart extends SurveyFormEvent {
  const SurveyFormStart();
}

class SurveyFormOccupationEvent extends SurveyFormEvent {
  const SurveyFormOccupationEvent(this.occupation);
  final List<String> occupation;

  @override
  List<Object> get props => [occupation];
}

class SurveyFormOccupationHrsEvent extends SurveyFormEvent {
  final String occupationHrs;

  const SurveyFormOccupationHrsEvent(this.occupationHrs);

  @override
  List<Object> get props => [occupationHrs];
}

class SurveyFormPhysicalActivityDurationEvent extends SurveyFormEvent {
  final String physicalActivityDuration;

  const SurveyFormPhysicalActivityDurationEvent(this.physicalActivityDuration);

  @override
  List<Object> get props => [physicalActivityDuration];
}

class SurveyFormAreaStructureEvent extends SurveyFormEvent {
  final String areaStructure;

  const SurveyFormAreaStructureEvent(this.areaStructure);

  @override
  List<Object> get props => [areaStructure];
}

class SurveyFormLivingStatusEvent extends SurveyFormEvent {
  final String livingStatus;

  const SurveyFormLivingStatusEvent(this.livingStatus);

  @override
  List<Object> get props => [livingStatus];
}

class SurveyFormLifeStatusWithRoommatesEvent extends SurveyFormEvent {
  final String lifeStatusWithRoommates;

  const SurveyFormLifeStatusWithRoommatesEvent(this.lifeStatusWithRoommates);

  @override
  List<Object> get props => [lifeStatusWithRoommates];
}

class SurveyFormCloseWithFamilyRelationshipEvent extends SurveyFormEvent {
  final String closeWithFamilyRelationship;

  const SurveyFormCloseWithFamilyRelationshipEvent(this.closeWithFamilyRelationship);

  @override
  List<Object> get props => [closeWithFamilyRelationship];
}

class SurveyFormOftenInteractionWithFamily extends SurveyFormEvent {
  final String oftenInteractionWithFamily;

  const SurveyFormOftenInteractionWithFamily(this.oftenInteractionWithFamily);

  @override
  List<Object> get props => [oftenInteractionWithFamily];
}

class SurveyFormCommonRebutalsEvent extends SurveyFormEvent {
  final String commonRebutals;

  const SurveyFormCommonRebutalsEvent(this.commonRebutals);

  @override
  List<Object> get props => [commonRebutals];
}

class SurveyFormSiblingsNumberEvent extends SurveyFormEvent {
  final String siblingsNumber;

  const SurveyFormSiblingsNumberEvent(this.siblingsNumber);

  @override
  List<Object> get props => [siblingsNumber];
}

class SurveyFormSiblingsNumberStatusEvent extends SurveyFormEvent {
  final String siblingsNumberStatus;

  const SurveyFormSiblingsNumberStatusEvent(this.siblingsNumberStatus);

  @override
  List<Object> get props => [siblingsNumberStatus];
}

class SurveyFormParentsDivorcedEvent extends SurveyFormEvent {
  final String parentsDivorced;

  const SurveyFormParentsDivorcedEvent(this.parentsDivorced);

  @override
  List<Object> get props => [parentsDivorced];
}

class SurveyFormPersonalRelationshipStatusEvent extends SurveyFormEvent {
  final String personalRelationshipStatus;

  const SurveyFormPersonalRelationshipStatusEvent(
      this.personalRelationshipStatus);

  @override
  List<Object> get props => [personalRelationshipStatus];
}

class SurveyFormSmokeCannabisEvent extends SurveyFormEvent {
  final String smokeCannabis;

  const SurveyFormSmokeCannabisEvent(this.smokeCannabis);

  @override
  List<Object> get props => [smokeCannabis];
}

class SurveyFormOftenSmokeCannabis extends SurveyFormEvent {
  final String oftenSmokeCannabis;

  const SurveyFormOftenSmokeCannabis(this.oftenSmokeCannabis);

  @override
  List<Object> get props => [oftenSmokeCannabis];
}

class SurveyFormSmokeCigarettesEvent extends SurveyFormEvent {
  final String smokeCigarettes;

  const SurveyFormSmokeCigarettesEvent(this.smokeCigarettes);

  @override
  List<Object> get props => [smokeCigarettes];
}

class SurveyFormOftenSmokeCigarettes extends SurveyFormEvent {
  final String oftenSmokeCigarettes;

  const SurveyFormOftenSmokeCigarettes(this.oftenSmokeCigarettes);

  @override
  List<Object> get props => [oftenSmokeCigarettes];
}

class SurveyFormDrinkAlcoholEvent extends SurveyFormEvent {
  final String drinkAlcohol;

  const SurveyFormDrinkAlcoholEvent(this.drinkAlcohol);

  @override
  List<Object> get props => [drinkAlcohol];
}


class SurveyFormOftenDrinkAlcohol extends SurveyFormEvent {
  final String oftenDrinkAlcohol;

  const SurveyFormOftenDrinkAlcohol(this.oftenDrinkAlcohol);

  @override
  List<Object> get props => [oftenDrinkAlcohol];
}

class SurveyFormDrugConsumptionEvent extends SurveyFormEvent {
  final String drugConsumption;
  const SurveyFormDrugConsumptionEvent(this.drugConsumption);

  @override
  List<Object> get props => [drugConsumption];
}

class SurveyFormPrescribedMedication extends SurveyFormEvent {
  final String prescribedMedication;

  const SurveyFormPrescribedMedication(this.prescribedMedication);

  @override
  List<Object> get props => [prescribedMedication];
}

class SurveyFormPrescribedMedicationListEvent extends SurveyFormEvent {
  final List<String> prescribedMedicationList;

  const SurveyFormPrescribedMedicationListEvent(this.prescribedMedicationList);

  @override
  List<Object> get props => [prescribedMedicationList];
}

class SurveyFormAdditionDescriptionEvent extends SurveyFormEvent {
  final String additionDescription;

  const SurveyFormAdditionDescriptionEvent(this.additionDescription);

  @override
  List<Object> get props => [additionDescription];
}

class SurveyFormDateTimeEvent extends SurveyFormEvent {
  final DateTime dateTime;

  const SurveyFormDateTimeEvent(this.dateTime);

  @override
  List<Object> get props => [dateTime];
}

class SurveyFormCurrentPage extends SurveyFormEvent {
  final int currentPage;

  const SurveyFormCurrentPage(this.currentPage);

  @override
  List<Object> get props => [currentPage];
}


class SurveyFormSubmitEvent extends SurveyFormEvent {
  final TSurveyFormStatus status;
  const SurveyFormSubmitEvent(this.status);

  @override
  List<Object> get props => [status];
}

class SurveyFormIncrementCurrentPage extends SurveyFormEvent {
  final int currentIncrement;

  const SurveyFormIncrementCurrentPage(this.currentIncrement);

  @override
  List<Object> get props => [currentIncrement];
}

class SurveyFormResetEvent extends SurveyFormEvent {
  const SurveyFormResetEvent();
}

class SurveyFormResetEventOptionals extends SurveyFormEvent {
  const SurveyFormResetEventOptionals();
}

