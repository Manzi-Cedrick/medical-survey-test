import 'package:app_test/common/question-box/question_header.dart';
import 'package:app_test/common/section/previous_continue.dart';
import 'package:app_test/common/section/primary_section.dart';
import 'package:app_test/features/authentication/screens/survey-format/occupation/bloc/survey_form_bloc.dart';
import 'package:app_test/features/authentication/screens/survey-format/occupation/final_display_screen.dart';
import 'package:app_test/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NineTeenDetailScreen extends StatefulWidget {
  const NineTeenDetailScreen({Key? key}) : super(key: key);

  @override
  _NineTeenDetailScreenState createState() => _NineTeenDetailScreenState();
}

class _NineTeenDetailScreenState extends State<NineTeenDetailScreen> {
  bool hasNavigated = false; // Flag to track if navigation has occurred

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SurveyFormBloc, SurveyFormState>(
      listener: (context, state) {
        // Check for the success status and navigate to the next screen
        
      },
      builder: (context, state) {
        return TPrimarySectionLayout(
          child: Column(
            children: [
              const SizedBox(height: TSizes.spaceBtwSections),
              const SizedBox(
                width: double.infinity,
                child: TQuestionHeader(
                  text:
                      'Feel free to elaborate on what specific types of prescribed drugs you take to enhance your experience with your AI',
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              TextFormField(
                maxLines: 5,
                decoration: const InputDecoration(
                    hintText: 'Type here', border: OutlineInputBorder()),
                onChanged: (value) {
                  context.read<SurveyFormBloc>().add(
                        SurveyFormAdditionDescriptionEvent(value),
                      );
                },
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              TSectionFooterButtons(
                activateDisabled:
                    state.additionDescription.isNotEmpty ? false : true,
                onPressed: () {
                  context
                      .read<SurveyFormBloc>()
                      .add(SurveyFormCurrentPage(state.currentPage + 1));
                  context.read<SurveyFormBloc>().add(
                        const SurveyFormSubmitEvent(TSurveyFormStatus.success),
                      );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DisplayScreen(),
                    ),
                  );
                },
              )
            ],
          ),
        );
      },
    );
  }
}
