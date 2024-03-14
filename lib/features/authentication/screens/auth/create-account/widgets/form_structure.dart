import 'package:app_test/features/authentication/screens/auth/bloc/auth_bloc_bloc.dart';
import 'package:app_test/features/authentication/screens/auth/create-account-phonenumber/create_account_phone_number.dart';
import 'package:app_test/features/authentication/screens/auth/login/login_screen.dart';
import 'package:app_test/features/authentication/screens/survey-format/occupation/starter_screen_dob.dart';
import 'package:app_test/utils/constants/colors.dart';
import 'package:app_test/utils/constants/sizes.dart';
import 'package:app_test/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

class TStructuredForm extends StatefulWidget {
  const TStructuredForm({Key? key}) : super(key: key);

  @override
  _TStructuredFormState createState() => _TStructuredFormState();
}

class _TStructuredFormState extends State<TStructuredForm> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBlocBloc, AuthBlocState>(
      listener: (context, state) {
        // TODO: implement listener

        if (state.status == AuthBlocStatus.success) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const DobScreen()));
        }
      },
      builder: (context, state) {
        return Form(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.direct_right),
                      labelText: TTexts.email),
                  onChanged: (value) => context
                      .read<AuthBlocBloc>()
                      .add(AuthBlocEmailEvent(value)),
                ),
                const SizedBox(height: TSizes.spaceBtwInputFields / 2),
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.password_check),
                    labelText: TTexts.password,
                    suffixIcon: IconButton(
                      icon:
                          Icon(_obscureText ? Iconsax.eye_slash : Iconsax.eye),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    ),
                  ),
                  obscureText: _obscureText,
                  onChanged: (value) => context
                      .read<AuthBlocBloc>()
                      .add(AuthBlocPasswordEvent(value)),
                ),
                const SizedBox(height: TSizes.spaceBtwInputFields / 2),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<AuthBlocBloc>().add(
                          const AuthBlocSubmitEvent(AuthBlocStatus.success));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: TColors.primary,
                    ),
                    child: const Text(TTexts.createAccount),
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwSections),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignIn()));
                    },
                    child: Text('Sign In',
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .apply(color: TColors.primary))),
                const SizedBox(height: TSizes.spaceBtwItems),
                OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const CreateAccountWithPhoneNumber()));
                  },
                  style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: TColors.primary)),
                  child: Text('Continue with PhoneNumber',
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .apply(color: TColors.primary)),
                ),
                const SizedBox(height: TSizes.spaceBtwSections),
                TextButton(
                    onPressed: () {}, child: const Text('Forgot your Password'))
              ],
            ),
          ),
        );
      },
    );
  }
}
