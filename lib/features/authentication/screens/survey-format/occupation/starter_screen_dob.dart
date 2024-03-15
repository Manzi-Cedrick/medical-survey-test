import 'package:app_test/common/question-box/question_header.dart';
import 'package:app_test/common/section/previous_continue.dart';
import 'package:app_test/common/section/primary_section.dart';
import 'package:app_test/features/authentication/screens/survey-format/occupation/01_first_screen_occupation.dart';
import 'package:app_test/features/authentication/screens/survey-format/occupation/bloc/survey_form_bloc.dart';
import 'package:app_test/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class DobScreen extends StatefulWidget {
  const DobScreen({super.key});

  @override
  _DobScreenState createState() => _DobScreenState();
}

class _DobScreenState extends State<DobScreen> {
  final TextEditingController _dateController = TextEditingController();
  bool isValid = false; // Start with true to disable the button initially
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _dateController.text.isNotEmpty
          ? DateTime.parse(_dateController.text)
          : DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        isValid = true;
        String formattedDate = DateFormat('yyyy-MM-dd').format(picked);
        _dateController.text = formattedDate;
        context.read<SurveyFormBloc>().add(SurveyFormDateTimeEvent(picked));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SurveyFormBloc, SurveyFormState>(
        listener: (context, state) {
          print(state.dateTime);

          print(isValid);
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
                      controller: _dateController,
                      keyboardType: TextInputType.datetime,
                      onChanged: (value) {
                        setState(() {
                          DateTime? parsedDate = DateTime.tryParse(value);
                          isValid = parsedDate != null &&
                              !parsedDate.isAfter(DateTime.now());
                          if (parsedDate != null) {
                            context
                                .read<SurveyFormBloc>()
                                .add(SurveyFormDateTimeEvent(parsedDate));
                          }
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'Date',
                        hintText: 'yyyy-MM-dd',
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.calendar_today),
                          onPressed: () => _selectDate(context),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          isValid = false;
                          return 'Please enter a date';
                        }
                        DateTime? parsedDate = DateTime.tryParse(value);
                        if (parsedDate == null) {
                          isValid = false;
                          // print(isValid);
                          return 'Invalid date format';
                        }
                        if (parsedDate.isAfter(DateTime.now())) {
                          return 'Date cannot be in the future';
                        }
                        return null;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    );
                  },
                ),
                const SizedBox(height: TSizes.spaceBtwSections),
                TSectionFooterButtons(
                  activateDisabled: !isValid,
                  onPressed: () {
                    context
                        .read<SurveyFormBloc>()
                        .add(SurveyFormCurrentPage(state.currentPage + 1));
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const OccupationDetailScreen()));
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
