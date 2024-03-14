import 'package:app_test/features/authentication/screens/auth/create-account/create_account_screen.dart';
import 'package:app_test/utils/constants/text_strings.dart';
import 'package:app_test/utils/theme/theme.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: TTexts.appName,
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      // initialBinding: GeneralBindings(),
      home: const CreateAccount()
    );
  }
}
