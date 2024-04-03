import 'package:app_test/features/authentication/repo/user_repository.dart';
import 'package:app_test/features/authentication/screens/login/login_screen.dart';
import 'package:app_test/features/survey-format/screen/starter_screen_dob.dart';
import 'package:app_test/switch_screen.dart';
import 'package:app_test/utils/constants/text_strings.dart';
import 'package:app_test/utils/theme/theme.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final UserRepository userRepository = UserRepository();
    return FutureBuilder<bool>(
      future: userRepository.hasSessionToken(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else {
          final bool hasSessionToken = snapshot.data ?? false;
          final Widget initialRoute = hasSessionToken ? SwitchScreen() : const SignIn();

          return MaterialApp(
            title: TTexts.appName,
            themeMode: ThemeMode.system,
            theme: TAppTheme.lightTheme,
            darkTheme: TAppTheme.darkTheme,
            debugShowCheckedModeBanner: false,
            home: initialRoute,
          );
        }
      },
    );
  }
}
