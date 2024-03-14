import 'package:app_test/common/question-box/question_header.dart';
import 'package:app_test/common/section/previous_continue.dart';
import 'package:app_test/common/section/primary_section.dart';
import 'package:app_test/features/authentication/screens/survey-format/occupation/01_first_screen_occupation.dart';
import 'package:app_test/features/authentication/screens/survey-format/occupation/bloc/survey_form_bloc.dart';
import 'package:app_test/utils/constants/colors.dart';
import 'package:app_test/utils/constants/sizes.dart';
import 'package:date_picker_plus/date_picker_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DobScreen extends StatefulWidget {
  const DobScreen({super.key});

  @override
  _DobScreenState createState() => _DobScreenState();
}

class _DobScreenState extends State<DobScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SurveyFormBloc, SurveyFormState>(
        listener: (context, state) {
          // TODO: implement listener
          // print(state.dateTime);
        },
        builder: (context, state) {
          return TPrimarySectionLayout(
            child: Column(
              children: [
                const SizedBox(height: TSizes.spaceBtwSections),
                const SizedBox(
                  width: double.infinity,
                  child: TQuestionHeader(
                    text: 'What is your date of birth ?',
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwSections),
                BlocConsumer<SurveyFormBloc, SurveyFormState>(
                  listener: (context, state) {
                    
                  },
                  builder: (context, state) {
                    return DatePicker(
                        minDate: DateTime(1900, 1, 1),
                        maxDate: DateTime.now(),
                        initialDate: DateTime.now(),
                        onDateSelected: (value) {
                          context.read<SurveyFormBloc>().add(
                              SurveyFormDateTimeEvent(value));
                        },
                        highlightColor: TColors.primary,
                        splashColor: TColors.primary,
                    );
                  },
                ),
                const SizedBox(height: TSizes.spaceBtwSections),
                TSectionFooterButtons(
                  onPressed: () {
                    Navigator.push(
                        context,

                        MaterialPageRoute(
                            builder: (_) {
                              return BlocProvider(create: (context) => SurveyFormBloc(),
                              child: const OccupationDetailScreen());
                            }
                        )
                    );
                  },
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
