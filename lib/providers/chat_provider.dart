import 'package:flutter/material.dart';
import 'package:talk_with_me_app/models/chat_model.dart';
import 'package:talk_with_me_app/services/api_service.dart';

class ChatProvider with ChangeNotifier {
  List<ChatModel> chatList = [];

  List<ChatModel> get getCHatList {
    return chatList;
  }

  void addUserMessage({required String msg}) {
    chatList.add(ChatModel(chatMsg: msg, chatIndex: 0));
    notifyListeners();
  }

  Future<void> sendMessageAndGetAnswers(
      {required String msg, required String choosenModelId}) async {
    chatList.addAll(await ApiService.sendMessage(
      message: msg,
      modelId: choosenModelId,
    ));
    notifyListeners();
  }
}
