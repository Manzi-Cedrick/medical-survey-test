import 'package:app_test/features/chatbot/widgets/chat_dummy.dart';
import 'package:flutter/material.dart';

class ChatController extends ChangeNotifier {
  List<Chat> chatList = Chat.generate();

  late final ScrollController scrollController = ScrollController();
  late final TextEditingController textEditingController =
      TextEditingController();
  late final FocusNode focusNode = FocusNode();

  Future<void> onFieldSubmitted() async {
    if (!isTextFieldEnable) return;
    chatList = [
      ...chatList,
      Chat.sent(message: textEditingController.text),
    ];
    scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );

    textEditingController.text = '';
    notifyListeners();
  }

  void onFieldChanged(String term) {
    notifyListeners();
  }

  /* Getters */
  bool get isTextFieldEnable => textEditingController.text.isNotEmpty;
}