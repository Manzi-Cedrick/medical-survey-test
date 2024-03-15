import 'package:app_test/common/section/previous_continue.dart';
import 'package:app_test/common/section/primary_section.dart';
import 'package:app_test/features/authentication/screens/survey-format/occupation/end_survey_screen.dart';
import 'package:app_test/utils/constants/colors.dart';
import 'package:app_test/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_test/features/authentication/screens/survey-format/occupation/bloc/survey_form_bloc.dart';

class DisplayScreen extends StatefulWidget {
  const DisplayScreen({Key? key}) : super(key: key);

  @override
  _DisplayScreenState createState() => _DisplayScreenState();
}

class _DisplayScreenState extends State<DisplayScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SurveyFormBloc, SurveyFormState>(
      listener: (context, state) {
        // You can add any listener logic here if needed
      },
      builder: (context, state) {
        return TPrimarySectionLayout(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: TSizes.spaceBtwItems),
                    Text('Survey response summary',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .apply(color: TColors.primary)),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    BlocSelector<SurveyFormBloc, SurveyFormState, String>(
                      selector: (state) => state.dateTime.toString(),
                      builder: (context, dateTime) {
                        return ListTile(
                          title: Text('Date Time',
                              style: Theme.of(context).textTheme.titleMedium),
                          subtitle: Text(dateTime,
                              style: Theme.of(context).textTheme.labelMedium),
                        );
                      },
                    ),
                    BlocSelector<SurveyFormBloc, SurveyFormState, List<String>>(
                      selector: (state) => state.occupation,
                      builder: (context, occupation) {
                        String occupationText = occupation.join(', ');
                        return ListTile(
                          title: Text('Occupation',
                              style: Theme.of(context).textTheme.titleMedium),
                          subtitle: Text(occupationText,
                              style: Theme.of(context).textTheme.labelMedium),
                        );
                      },
                    ),
                    BlocSelector<SurveyFormBloc, SurveyFormState, String>(
                      selector: (state) => state.occupationHrs.isNotEmpty && state.occupationHrs != '' ? state.occupationHrs : 'N/A',
                      builder: (context, occupationDuration) {
                        return ListTile(
                          title: Text('Occupation Duration',
                              style: Theme.of(context).textTheme.titleMedium),
                          subtitle: Text(occupationDuration,
                              style: Theme.of(context).textTheme.labelMedium),
                        );
                      },
                    ),
                    BlocSelector<SurveyFormBloc, SurveyFormState, String>(
                      selector: (state) => state.physicalActivityDuration,
                      builder: (context, physicalduration) {
                        return ListTile(
                          title: Text('Physical Status',
                              style: Theme.of(context).textTheme.titleMedium),
                          subtitle: Text(physicalduration,
                              style: Theme.of(context).textTheme.labelMedium),
                        );
                      },
                    ),
                    BlocSelector<SurveyFormBloc, SurveyFormState, String>(
                      selector: (state) => state.areaStructure,
                      builder: (context, areaStructure) {
                        return ListTile(
                          title: Text('Population Area Structure',
                              style: Theme.of(context).textTheme.titleMedium),
                          subtitle: Text(areaStructure,
                              style: Theme.of(context).textTheme.labelMedium),
                        );
                      },
                    ),
                    BlocSelector<SurveyFormBloc, SurveyFormState, String>(
                      selector: (state) => state.livingStatus,
                      builder: (context, livingStatus) {
                        return ListTile(
                          title: Text('Living Status',
                              style: Theme.of(context).textTheme.titleMedium),
                          subtitle: Text(livingStatus,
                              style: Theme.of(context).textTheme.labelMedium),
                        );
                      },
                    ),
                    BlocSelector<SurveyFormBloc, SurveyFormState, String>(
                      selector: (state) => state.lifeStatusWithRoommates.isNotEmpty && state.lifeStatusWithRoommates != '' ? state.lifeStatusWithRoommates : 'N/A',
                      builder: (context, lifeStatusWithRoommates) {
                        return ListTile(
                          title: Text('Life Status With Roommates',
                              style: Theme.of(context).textTheme.titleMedium),
                          subtitle: Text(lifeStatusWithRoommates,
                              style: Theme.of(context).textTheme.labelMedium),
                        );
                      },
                    ),
                    BlocSelector<SurveyFormBloc, SurveyFormState, String>(
                      selector: (state) => state.closeWithFamilyRelationship,
                      builder: (context, closeWithFamilyRelationship) {
                        return ListTile(
                          title: Text('Close With Family Relationship',
                              style: Theme.of(context).textTheme.titleMedium),
                          subtitle: Text(closeWithFamilyRelationship,
                              style: Theme.of(context).textTheme.labelMedium),
                        );
                      },
                    ),
                    BlocSelector<SurveyFormBloc, SurveyFormState, String>(
                      selector: (state) => state.oftenInteractionWithFamily.isNotEmpty && state.oftenInteractionWithFamily != '' ? state.oftenInteractionWithFamily : 'N/A',
                      builder: (context, oftenInteractionWithFamily) {
                        return ListTile(
                          title: Text('Often Interaction With Family',
                              style: Theme.of(context).textTheme.titleMedium),
                          subtitle: Text(oftenInteractionWithFamily,
                              style: Theme.of(context).textTheme.labelMedium)
                        );
                      },
                    ),
                    BlocSelector<SurveyFormBloc, SurveyFormState, String>(
                      selector: (state) => state.commonRebutals,
                      builder: (context, commonRebutals) {
                        return ListTile(
                          title: Text('Common Rebutals',
                              style: Theme.of(context).textTheme.titleMedium),
                          subtitle: Text(commonRebutals,
                              style: Theme.of(context).textTheme.labelMedium),
                        );
                      },
                    ),
                    BlocSelector<SurveyFormBloc, SurveyFormState, String>(
                      selector: (state) => state.siblingsNumber,
                      builder: (context, siblingsNumber) {
                        return ListTile(
                          title: Text('Siblings Number',
                              style: Theme.of(context).textTheme.titleMedium),
                          subtitle: Text(siblingsNumber,
                              style: Theme.of(context).textTheme.labelMedium),
                        );
                      },
                    ),
                    BlocSelector<SurveyFormBloc, SurveyFormState, String>(
                      selector: (state) => state.siblingsNumberStatus.isNotEmpty && state.siblingsNumberStatus != '' ? state.siblingsNumberStatus : 'N/A',
                      builder: (context, siblingsNumberStatus) {
                        return ListTile(
                          title: Text('Siblings Number Status',
                              style: Theme.of(context).textTheme.titleMedium),
                          subtitle: Text(siblingsNumberStatus,
                              style: Theme.of(context).textTheme.labelMedium),
                        );
                      },
                    ),
                    BlocSelector<SurveyFormBloc, SurveyFormState, String>(
                      selector: (state) => state.personalRelationshipStatus,
                      builder: (context, personalRelationshipStatus) {
                        return ListTile(
                          title: Text('Personal Relationship Status',
                              style: Theme.of(context).textTheme.titleMedium),
                          subtitle: Text(personalRelationshipStatus,
                              style: Theme.of(context).textTheme.labelMedium),
                        );
                      },
                    ),
                    BlocSelector<SurveyFormBloc, SurveyFormState, String>(
                      selector: (state) => state.parentsDivorced,
                      builder: (context, parentsDivorced) {
                        return ListTile(
                          title: Text('Parents Divorced',
                              style: Theme.of(context).textTheme.titleMedium),
                          subtitle: Text(parentsDivorced,
                              style: Theme.of(context).textTheme.labelMedium),
                        );
                      },
                    ),
                    BlocSelector<SurveyFormBloc, SurveyFormState, String>(
                      selector: (state) => state.smokeCannabis,
                      builder: (context, smokeCannabis) {
                        return ListTile(
                          title: Text('Do you smoke cannabis?',
                              style: Theme.of(context).textTheme.titleMedium),
                          subtitle: Text(smokeCannabis,
                              style: Theme.of(context).textTheme.labelMedium),
                        );
                      },
                    ),
                    BlocSelector<SurveyFormBloc, SurveyFormState, String>(
                      selector: (state) => state.oftenSmokeCannabis.isNotEmpty && state.oftenSmokeCannabis != '' ? state.oftenSmokeCannabis : 'N/A',
                      builder: (context, oftenSmokeCannabis) {
                        return ListTile(
                          title: Text('How often do you smoke cannabis?',
                              style: Theme.of(context).textTheme.titleMedium),
                          subtitle: Text(oftenSmokeCannabis,
                              style: Theme.of(context).textTheme.labelMedium),
                        );
                      },
                    ),
                    BlocSelector<SurveyFormBloc, SurveyFormState, String>(
                      selector: (state) => state.smokeCigarettes,
                      builder: (context, smokeCigarettes) {
                        return ListTile(
                          title: Text('Do you smoke cigarettes?',
                              style: Theme.of(context).textTheme.titleMedium),
                          subtitle: Text(smokeCigarettes,
                              style: Theme.of(context).textTheme.labelMedium),
                        );
                      },
                    ),
                    BlocSelector<SurveyFormBloc, SurveyFormState, String>(
                      selector: (state) => state.oftenSmokeCigarettes.isNotEmpty && state.oftenSmokeCigarettes != '' ? state.oftenSmokeCigarettes : 'N/A',
                      builder: (context, oftenSmokeCigarettes) {
                        return ListTile(
                          title: Text('How often do you smoke cigarettes?',
                              style: Theme.of(context).textTheme.titleMedium),
                          subtitle: Text(oftenSmokeCigarettes,
                              style: Theme.of(context).textTheme.labelMedium),
                        );
                      },
                    ),
                    BlocSelector<SurveyFormBloc, SurveyFormState, String>(
                      selector: (state) => state.drinkAlcohol,
                      builder: (context, drinkAlcohol) {
                        return ListTile(
                          title: Text('Do you drink alcohol?',
                              style: Theme.of(context).textTheme.titleMedium),
                          subtitle: Text(drinkAlcohol,
                              style: Theme.of(context).textTheme.labelMedium),
                        );
                      },
                    ),
                    BlocSelector<SurveyFormBloc, SurveyFormState, String>(
                      selector: (state) => state.oftenDrinkAlcohol.isNotEmpty && state.oftenDrinkAlcohol != '' ? state.oftenDrinkAlcohol : 'N/A',
                      builder: (context, oftenDrinkAlcohol) {
                        return ListTile(
                          title: Text('How often do you drink alcohol?',
                              style: Theme.of(context).textTheme.titleMedium),
                          subtitle: Text(oftenDrinkAlcohol,
                              style: Theme.of(context).textTheme.labelMedium),
                        );
                      },
                    ),
                    BlocSelector<SurveyFormBloc, SurveyFormState, String>(
                      selector: (state) => state.drugConsumption,
                      builder: (context, drugConsumption) {
                        return ListTile(
                          title: Text('Do you do drugs ?',
                              style: Theme.of(context).textTheme.titleMedium),
                          subtitle: Text(drugConsumption,
                              style: Theme.of(context).textTheme.labelMedium),
                        );
                      },
                    ),
                    BlocSelector<SurveyFormBloc, SurveyFormState, String>(
                      selector: (state) => state.prescribedMedication.isNotEmpty && state.prescribedMedication != '' ? state.prescribedMedication : 'N/A',
                      builder: (context, prescribedMedication) {
                        return ListTile(
                          title: Text('Prescribed Medication',
                              style: Theme.of(context).textTheme.titleMedium),
                          subtitle: Text(prescribedMedication,
                              style: Theme.of(context).textTheme.labelMedium),
                        );
                      },
                    ),
                    BlocSelector<SurveyFormBloc, SurveyFormState, List<String>>(
                      selector: (state) => state.prescribedMedicationList.isNotEmpty ? state.prescribedMedicationList : [''],
                      builder: (context, prescribedMedicationList) {
                        String medicationList = state.prescribedMedicationList.isNotEmpty ? prescribedMedicationList.join(', ') : 'N/A';
                        return ListTile(
                          title: Text('Prescribed Medication List',
                              style: Theme.of(context).textTheme.titleMedium),
                          subtitle: Text(medicationList,
                              style: Theme.of(context).textTheme.labelMedium),
                        );
                      },
                    ),
                    BlocSelector<SurveyFormBloc, SurveyFormState, String>(
                      selector: (state) => state.additionDescription.isNotEmpty && state.additionDescription != '' ? state.additionDescription : 'N/A',
                      builder: (context, additionDescription) {
                        return ListTile(
                          title: Text('Additional Description',
                              style: Theme.of(context).textTheme.titleMedium),
                          subtitle: Text(additionDescription,
                              style: Theme.of(context).textTheme.labelMedium),
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: TSizes.spaceBtwSections),
                TSectionFooterButtons(
                  activateDisabled: false,
                  onPressed: () {
                    context
                        .read<SurveyFormBloc>()
                        .add(SurveyFormCurrentPage(state.currentPage + 1));

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const EndSurveyScreen(),
                      ),
                    );

                    context
                        .read<SurveyFormBloc>()
                        .add(const SurveyFormResetEventOptionals());
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
