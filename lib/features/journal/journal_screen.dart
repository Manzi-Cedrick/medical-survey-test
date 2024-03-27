import 'package:app_test/common/style/appbar_style.dart';
import 'package:app_test/common/style/spacing_style.dart';
import 'package:app_test/features/journal/widgets/custom_journal_detail.dart';
import 'package:app_test/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class JournalScreen extends StatefulWidget {
  const JournalScreen({Key? key}) : super(key: key);
  @override
  _JournalScreenState createState() => _JournalScreenState();
}

class _JournalScreenState extends State<JournalScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    bool isValid = false;
    final TextEditingController _dateController = TextEditingController();
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
          // context.read<SurveyFormBloc>().add(SurveyFormDateTimeEvent(picked));
        });
      }
    }

    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: true,
      appBar:
          const TAppBar(showBackArrow: true, title: Text('Journal Entries')),
      body: Padding(
        padding: TSpacingStyle.paddingWithAppBarHeight,
        child: Column(
          children: [
            TextFormField(
              controller: _dateController,
              keyboardType: TextInputType.datetime,
              onChanged: (value) {
                setState(() {
                  DateTime? parsedDate = DateTime.tryParse(value);
                  isValid =
                      parsedDate != null && !parsedDate.isAfter(DateTime.now());
                  if (parsedDate != null) {
                    //
                  }
                });
              },
              decoration: InputDecoration(
                labelText: 'Select a date',
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
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            const Expanded(child: CustomJournal())
          ],
        ),
      ),
    );
  }
}
