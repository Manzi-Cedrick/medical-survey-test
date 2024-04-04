import 'package:app_test/features/authentication/repo/user_repository.dart';
import 'package:app_test/features/survey-format/screen/01_first_screen_occupation.dart';
import 'package:app_test/features/survey-format/screen/02_second_screen_hour.dart';
import 'package:app_test/features/survey-format/screen/04_fourth_screen.dart';
import 'package:app_test/features/survey-format/screen/05_fifth_screen.dart';
import 'package:app_test/features/survey-format/screen/06_sixth_screen.dart';
import 'package:app_test/features/survey-format/screen/07_seventh_screen.dart';
import 'package:app_test/features/survey-format/screen/08_eight_screen.dart';
import 'package:app_test/features/survey-format/screen/09_nineth_screen.dart';
import 'package:app_test/features/survey-format/screen/10_tenth_screen.dart';
import 'package:app_test/features/survey-format/screen/11_eleventh_screen.dart';
import 'package:app_test/features/survey-format/screen/12_twelve_screen.dart';
import 'package:app_test/features/survey-format/screen/13_thirteen_screen.dart';
import 'package:app_test/features/survey-format/screen/14_fourteen_screen.dart';
import 'package:app_test/features/survey-format/screen/16_sixteen_screen.dart';
import 'package:app_test/features/survey-format/screen/17_seventeen_screen.dart';
import 'package:app_test/features/survey-format/screen/18_eightteen_screen.dart';
import 'package:app_test/features/survey-format/screen/19_nineteen_screen.dart';
import 'package:app_test/features/survey-format/screen/end_survey_screen.dart';
import 'package:app_test/features/survey-format/screen/final_display_screen.dart';
import 'package:app_test/features/survey-format/screen/starter_screen_dob.dart';
import 'package:flutter/material.dart';

class SwitchScreen extends StatefulWidget {
  @override
  _SwitchScreenState createState() => _SwitchScreenState();
}

class _SwitchScreenState extends State<SwitchScreen> {
  UserRepository userRepository = UserRepository();
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    userRepository.getCurrentPage().then((value) {
      setState(() {
        currentPage = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (currentPage) {
      case 1:
        return const DobScreen();
      case 2:
        return const OccupationDetailScreen();
      case 3:
        return const SecondHourDetailScreen();
      case 4:
        return const FourthScreenDetail();
      case 5:
        return const FifthScreenDetail();
      case 6:
        return const SixthScreenDetail();
      case 7:
        return const SeventhDetailScreen();
      case 8:
        return const EightDetailScreen();
      case 9:
        return const NinthDetailScreen();
      case 10:
        return const TenthDetailScreen();
      case 11:
        return const EleventhDetailScreen();
      case 12:
        return const TwelvethDetailScreen();
      case 13: 
        return const ThirteenthDetailScreen();
      case 14:
        return const FourTeenDetailScreen();
      case 15:
        return const SixTeenDetailScreen();
      case 16:
        return const SevenTeenDetailScreen();
      case 17:
        return const EightTeenDetailScreen();
      case 18:
        return const NineTeenDetailScreen();
      case 19:
        return const DisplayScreen();
      case 20:
        return const EndSurveyScreen();
      default:
        return const DobScreen();
    }
  }
}