import 'package:app_test/features/chatbot/widgets/bubble.dart';
import 'package:app_test/features/chatbot/widgets/chat_controller.dart';
import 'package:app_test/features/chatbot/widgets/chat_dummy.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomJournal extends StatefulWidget {
  const CustomJournal({Key? key}) : super(key: key);

  @override
  _CustomJournalState createState() => _CustomJournalState();
}

class _CustomJournalState extends State<CustomJournal> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ChatController(),
      child: Column(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                // context.read<ChatController>().focusNode;
                FocusScope.of(context).unfocus();
              },
              child: Align(
                alignment: Alignment.topCenter,
                child: Selector<ChatController, List<Chat>>(
                  selector: (context, controller) =>
                      controller.chatList.reversed.toList(),
                  builder: (context, chatList, child) {
                    return ListView.separated(
                      shrinkWrap: true,
                      reverse: true,
                      padding: const EdgeInsets.only(top: 12, bottom: 20) +
                          const EdgeInsets.symmetric(horizontal: 12),
                      separatorBuilder: (_, __) => const SizedBox(
                        height: 12,
                      ),
                      controller: context.read<ChatController>().scrollController,
                      itemCount: chatList.length,
                      itemBuilder: (context, index) {
                        return Bubble(chat: chatList[index]);
                      },
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}