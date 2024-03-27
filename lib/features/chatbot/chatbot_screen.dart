import 'package:app_test/common/style/appbar_style.dart';
import 'package:app_test/common/style/spacing_style.dart';
import 'package:app_test/features/chatbot/widgets/custom_chat.dart';
import 'package:app_test/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ChatbotScreen extends StatefulWidget {
  const ChatbotScreen({Key? key}) : super(key: key);
  @override
  _ChatbotScreenState createState() => _ChatbotScreenState();
}

class _ChatbotScreenState extends State<ChatbotScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: true,
      appBar: const TAppBar(showBackArrow: true, title: Text('Chatbot')),
      body: Padding(
        padding: TSpacingStyle.paddingWithAppBarHeight,
        child: Column(
          children: [
            DropdownButtonFormField(
              items: [
                'Problem Solving',
                'Philosophical Discussion',
                'Daily Discusions',
              ]
                  .map((e) => DropdownMenuItem(
                        value: e,
                        child: Text(e),
                      ))
                  .toList(),
              onChanged: (value) {},
              hint: const Text('Select conversation'),
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            const Expanded(child: CustomChat())
          ],
        ),
      ),
    );
  }
}
