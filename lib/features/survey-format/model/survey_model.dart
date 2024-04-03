import 'package:equatable/equatable.dart';

class SurveyModel extends Equatable {
  final String? userId;
  final bool? isCompleted;
  final int? currentPage;
  final String? dateTime;
  final List<String>? occupation;
  final String? occupationHrs;
  final String? physicalActivityDuration;
  final String? areaStructure;
  final String? livingStatus;
  final String? lifeStatusWithRoommates;
  final String? closeWithFamilyRelationship;
  final String? oftenInteractionWithFamily;
  final String? parentsDivorced;
  final String? commonRebutals;
  final String? siblingsNumber;
  final String? siblingsNumberStatus;
  final String? personalRelationshipStatus;
  final String? smokeCannabis;
  final String? oftenSmokeCannabis;
  final String? drinkAlcohol;
  final String? oftenDrinkAlcohol;
  final String? drugConsumption;
  final String? prescribedMedication;
  final List<String>? prescribedMedicationList;
  final String? additionDescription;
  final String? id;

  const SurveyModel({
    this.userId,
    this.isCompleted,
    this.dateTime,
    this.occupation,
    this.occupationHrs,
    this.physicalActivityDuration,
    this.areaStructure,
    this.livingStatus,
    this.lifeStatusWithRoommates,
    this.closeWithFamilyRelationship,
    this.oftenInteractionWithFamily,
    this.parentsDivorced,
    this.commonRebutals,
    this.siblingsNumber,
    this.siblingsNumberStatus,
    this.personalRelationshipStatus,
    this.smokeCannabis,
    this.oftenSmokeCannabis,
    this.drinkAlcohol,
    this.oftenDrinkAlcohol,
    this.drugConsumption,
    this.prescribedMedication,
    this.prescribedMedicationList,
    this.additionDescription,
    this.id,
    this.currentPage
  });

  @override
  List<Object?> get props => [
        userId,
        isCompleted,
        dateTime,
        occupation,
        occupationHrs,
        physicalActivityDuration,
        areaStructure,
        livingStatus,
        lifeStatusWithRoommates,
        closeWithFamilyRelationship,
        oftenInteractionWithFamily,
        parentsDivorced,
        commonRebutals,
        siblingsNumber,
        siblingsNumberStatus,
        personalRelationshipStatus,
        smokeCannabis,
        oftenSmokeCannabis,
        drinkAlcohol,
        oftenDrinkAlcohol,
        drugConsumption,
        prescribedMedication,
        prescribedMedicationList,
        additionDescription,
        currentPage,
        id,
      ];

  factory SurveyModel.fromJson(Map<String, dynamic> json) {
    final List<String> occupation = json['occupation'] != null
    ? List<String>.from(json['occupation'])
    : [];
    final List<String> prescribedMedicationList = json['prescribedMedicationList'] != null
    ? List<String>.from(json['prescribedMedicationList'])
    : [];
    return SurveyModel(
      userId: json['userId'],
      isCompleted: json['isCompleted'],
      currentPage: json['currentPage'],
      dateTime: json['dateTime'],
      occupation: occupation,
      occupationHrs: json['occupationHrs'],
      physicalActivityDuration: json['physicalActivityDuration'],
      areaStructure: json['areaStructure'],
      livingStatus: json['livingStatus'],
      lifeStatusWithRoommates: json['lifeStatusWithRoommates'],
      closeWithFamilyRelationship: json['closeWithFamilyRelationship'],
      oftenInteractionWithFamily: json['oftenInteractionWithFamily'],
      parentsDivorced: json['parentsDivorced'],
      commonRebutals: json['commonRebutals'],
      siblingsNumber: json['siblingsNumber'],
      siblingsNumberStatus: json['siblingsNumberStatus'],
      personalRelationshipStatus: json['personalRelationshipStatus'],
      smokeCannabis: json['smokeCannabis'],
      oftenSmokeCannabis: json['oftenSmokeCannabis'],
      drinkAlcohol: json['drinkAlcohol'],
      oftenDrinkAlcohol: json['oftenDrinkAlcohol'],
      drugConsumption: json['drugConsumption'],
      prescribedMedication: json['prescribedMedication'],
      prescribedMedicationList: prescribedMedicationList,
      additionDescription: json['additionDescription'],
      id: json['_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'isCompleted': isCompleted,
      'currentPage': currentPage,
      'dateTime': dateTime,
      'occupation': occupation,
      'occupationHrs': occupationHrs,
      'physicalActivityDuration': physicalActivityDuration,
      'areaStructure': areaStructure,
      'livingStatus': livingStatus,
      'lifeStatusWithRoommates': lifeStatusWithRoommates,
      'closeWithFamilyRelationship': closeWithFamilyRelationship,
      'oftenInteractionWithFamily': oftenInteractionWithFamily,
      'parentsDivorced': parentsDivorced,
      'commonRebutals': commonRebutals,
      'siblingsNumber': siblingsNumber,
      'siblingsNumberStatus': siblingsNumberStatus,
      'personalRelationshipStatus': personalRelationshipStatus,
      'smokeCannabis': smokeCannabis,
      'oftenSmokeCannabis': oftenSmokeCannabis,
      'drinkAlcohol': drinkAlcohol,
      'oftenDrinkAlcohol': oftenDrinkAlcohol,
      'drugConsumption': drugConsumption,
      'prescribedMedication': prescribedMedication,
      'prescribedMedicationList': prescribedMedicationList,
      'additionDescription': additionDescription,
      '_id': id,
    };
  }

  SurveyModel copyWith({
    String? userId,
    bool? isCompleted,
    int? currentPage,
    String? dateTime,
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
    String? drinkAlcohol,
    String? oftenDrinkAlcohol,
    String? drugConsumption,
    String? prescribedMedication,
    List<String>? prescribedMedicationList,
    String? additionDescription,
    String? id,
  }) {
    return SurveyModel(
      userId: userId ?? this.userId,
      isCompleted: isCompleted ?? this.isCompleted,
      currentPage: currentPage ?? this.currentPage,
      dateTime: dateTime ?? this.dateTime,
      occupation: occupation ?? this.occupation,
      occupationHrs: occupationHrs ?? this.occupationHrs,
      physicalActivityDuration:
          physicalActivityDuration ?? this.physicalActivityDuration,
      areaStructure: areaStructure ?? this.areaStructure,
      livingStatus: livingStatus ?? this.livingStatus,
      lifeStatusWithRoommates:
          lifeStatusWithRoommates ?? this.lifeStatusWithRoommates,
      closeWithFamilyRelationship:
          closeWithFamilyRelationship ?? this.closeWithFamilyRelationship,
      oftenInteractionWithFamily:
          oftenInteractionWithFamily ?? this.oftenInteractionWithFamily,
      parentsDivorced: parentsDivorced ?? this.parentsDivorced,
      commonRebutals: commonRebutals ?? this.commonRebutals,
      siblingsNumber: siblingsNumber ?? this.siblingsNumber,
      siblingsNumberStatus: siblingsNumberStatus ?? this.siblingsNumberStatus,
      personalRelationshipStatus:
          personalRelationshipStatus ?? this.personalRelationshipStatus,
      smokeCannabis: smokeCannabis ?? this.smokeCannabis,
      oftenSmokeCannabis: oftenSmokeCannabis ?? this.oftenSmokeCannabis,
      drinkAlcohol: drinkAlcohol ?? this.drinkAlcohol,
      oftenDrinkAlcohol: oftenDrinkAlcohol ?? this.oftenDrinkAlcohol,
      drugConsumption: drugConsumption ?? this.drugConsumption,
      prescribedMedication: prescribedMedication ?? this.prescribedMedication,
      prescribedMedicationList:
          prescribedMedicationList ?? this.prescribedMedicationList,
      additionDescription: additionDescription ?? this.additionDescription,
      id: id ?? this.id,
    );
  }
}
