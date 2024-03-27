import 'package:app_test/features/chatbot/widgets/bubble.dart';
import 'package:app_test/features/chatbot/widgets/chat_controller.dart';
import 'package:app_test/features/chatbot/widgets/chat_dummy.dart';
import 'package:app_test/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

class CustomChat extends StatefulWidget {
  const CustomChat({Key? key}) : super(key: key);

  @override
  _CustomChatState createState() => _CustomChatState();
}

class _CustomChatState extends State<CustomChat> {
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
          const _BottomInputField(),
        ],
      ),
    );
  }
}

class _BottomInputField extends StatelessWidget {
  const _BottomInputField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      child: Container(
        constraints: const BoxConstraints(minHeight: 48),
        width: double.infinity,
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Color(0xFFE5E5EA),
            ),
          ),
        ),
        child: Stack(
          children: [
            TextField(
              focusNode: context.read<ChatController>().focusNode,
              onChanged: context.read<ChatController>().onFieldChanged,
              controller: context.read<ChatController>().textEditingController,
              maxLines: null,
              textAlignVertical: TextAlignVertical.top,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(
                  right: 42,
                  left: 16,
                  top: 18,
                ),
                hintText: 'message',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: TColors.primary.withOpacity(0.5)),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            // custom suffix btn
            Positioned(
              bottom: 0,
              right: 0,
              child: IconButton(
                icon: Icon(
                  Iconsax.send_1,
                  color: Theme.of(context).primaryColor,
                ),
                onPressed: context.read<ChatController>().onFieldSubmitted,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
