import 'package:app_test/features/authentication/screens/survey-format/occupation/bloc/survey_form_bloc.dart';
import 'package:app_test/utils/constants/colors.dart';
import 'package:app_test/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TSectionFooterButtons extends StatefulWidget {
  const TSectionFooterButtons(
      {super.key, required this.onPressed, this.activateDisabled = false});
  final VoidCallback onPressed;
  final bool activateDisabled;

  @override
  _TSectionFooterButtons createState() => _TSectionFooterButtons();
}

class _TSectionFooterButtons extends State<TSectionFooterButtons> {
  late int currentPageIndex;
  late int currentPageIncrement;
  @override
  void initState() {
    super.initState();
    final state = context.read<SurveyFormBloc>().state;
    currentPageIncrement =
        state.currentIncrement != 1 ? state.currentIncrement : 1;
    currentPageIndex =
        state.currentPage > 0 ? state.currentPage - state.currentIncrement : 1;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BlocConsumer<SurveyFormBloc, SurveyFormState>(
          listener: (context, state) {
            // TODO: implement listener
            // currentPageIndex = state.currentPage - 1;
          },
          builder: (context, state) {
            return ElevatedButton(
              onPressed: () {
                if (currentPageIndex > 0) {
                  currentPageIndex -= 1;
                  // currentPageIncrement = 1;
                  context
                      .read<SurveyFormBloc>()
                      .add(const SurveyFormIncrementCurrentPage(1));
                  context
                      .read<SurveyFormBloc>()
                      .add(SurveyFormCurrentPage(currentPageIndex + 1));
                  
                  Navigator.pop(context);
                }
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: TColors.lightGrey,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  side: const BorderSide(color: Colors.transparent)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: TSizes.lg),
                child: Text(
                  'Previous',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .apply(color: TColors.textSecondary),
                ),
              ),
            );
          },
        ),
        BlocConsumer<SurveyFormBloc, SurveyFormState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return ElevatedButton(
              onPressed: widget.activateDisabled ? null : widget.onPressed,
              style: ElevatedButton.styleFrom(
                  backgroundColor: widget.activateDisabled
                      ? TColors.grey.withOpacity(0.5)
                      : TColors.primary,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  side: BorderSide.none),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: TSizes.lg),
                child: Text(
                  state.currentPage == 20 ? 'Submit Info' : 'Continue',
                  style: Theme.of(context).textTheme.bodySmall!.apply(
                      color: widget.activateDisabled
                          ? TColors.dark
                          : TColors.white),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
