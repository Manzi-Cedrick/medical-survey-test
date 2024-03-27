

import 'package:app_test/features/chatbot/widgets/chat_message_type.dart';

class Chat {
  final String message;
  final ChatMessageType type;
  final DateTime time;

  Chat({required this.message, required this.type, required this.time});

  factory Chat.sent({required message}) =>
      Chat(message: message, type: ChatMessageType.sent, time: DateTime.now());

  static List<Chat> generate() {
    return [
      Chat(
        message: "Hello!",
        type: ChatMessageType.sent,
        time: DateTime.now().subtract(const Duration(minutes: 15)),
      ),
      Chat(
        message: "Nice to meet you!",
        type: ChatMessageType.received,
        time: DateTime.now().subtract(const Duration(minutes: 14)),
      ),
      Chat(
        message: "The weather is nice today.",
        type: ChatMessageType.sent,
        time: DateTime.now().subtract(const Duration(minutes: 13)),
      ),
      Chat(
        message: "Yes, it's a great day to go out.",
        type: ChatMessageType.received,
        time: DateTime.now().subtract(const Duration(minutes: 12)),
      ),
      Chat(
        message: "Have a nice day!",
        type: ChatMessageType.sent,
        time: DateTime.now().subtract(const Duration(minutes: 11)),
      ),
      Chat(
        message: "What are your plans for the weekend?",
        type: ChatMessageType.received,
        time: DateTime.now().subtract(const Duration(minutes: 10)),
      ),
    ];
  }
}