import 'package:app_test/common/question-box/question_header.dart';
import 'package:app_test/common/section/previous_continue.dart';
import 'package:app_test/common/section/primary_section.dart';
import 'package:app_test/features/authentication/screens/survey-format/occupation/01_first_screen_occupation.dart';
import 'package:app_test/features/authentication/screens/survey-format/occupation/bloc/survey_form_bloc.dart';
import 'package:app_test/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DobScreen extends StatefulWidget {
  const DobScreen({super.key});

  @override
  _DobScreenState createState() => _DobScreenState();
}

class _DobScreenState extends State<DobScreen> {
  String? _selectedDate;
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
                  listener: (context, state) {},
                  builder: (context, state) {
                    return TextFormField(
                      onChanged: (value) {
                        setState(() {
                          DateTime? parsedDate = DateTime.tryParse(value);
                          if (parsedDate != null) {
                            print(parsedDate);
                            context.read<SurveyFormBloc>().add(
                                  SurveyFormDateTimeEvent(parsedDate),
                                );
                          }
                        });
                      },
                      keyboardType: TextInputType.datetime,
                      decoration: InputDecoration(
                        labelText: 'Date',
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.calendar_today),
                          onPressed: () {
                            showDatePicker(context: context,initialDate: DateTime.now(), firstDate: DateTime(2017,9,1), lastDate: DateTime.now());
                          },
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: TSizes.spaceBtwSections),
                TSectionFooterButtons(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return BlocProvider(
                          create: (context) => SurveyFormBloc(),
                          child: const OccupationDetailScreen());
                    }));
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
