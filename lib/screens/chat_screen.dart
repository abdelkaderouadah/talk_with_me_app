import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talk_with_me_app/constants/constants.dart';
import 'package:talk_with_me_app/models/chat_model.dart';
import 'package:talk_with_me_app/providers/chat_provider.dart';
import 'package:talk_with_me_app/providers/chat_provider.dart';
import 'package:talk_with_me_app/providers/chat_provider.dart';
import 'package:talk_with_me_app/providers/models_provider.dart';
import 'package:talk_with_me_app/services/assets_manager.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:talk_with_me_app/widgets/chat_widget.dart';
// import 'package:talk_with_me_app/widgets/text_widget.dart';

import '../services/api_service.dart';
import '../services/services.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  bool _isTyping = false;
  late TextEditingController textEditingController;
  late FocusNode focusNode;
  late ScrollController _scrollControllerList;

  @override
  void initState() {
    textEditingController = TextEditingController();
    focusNode = FocusNode();
    _scrollControllerList = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    focusNode.dispose();
    _scrollControllerList.dispose();

    super.dispose();
  }

  // List<ChatModel> chatList = [];

  @override
  Widget build(BuildContext context) {
    final modelsProvider = Provider.of<ModelsProvider>(context, listen: false);
    final chatProvider = Provider.of<ChatProvider>(context);

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            AssetsManager.appLogo,
            height: 25,
            width: 25,
          ),
        ),
        title: const Center(
          child: Text(
            "Talk with Me",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              await Services.showModalSheet(context: context);
            },
            icon: const Icon(
              Icons.more_vert_rounded,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              child: ListView.builder(
                  controller: _scrollControllerList,
                  itemCount: chatProvider.getCHatList.length,
                  // chatList.length,
                  itemBuilder: (context, index) {
                    return ChatWidget(
                      chatIndex: chatProvider.getCHatList[index]
                          .chatIndex, // chatList[index].chatIndex,
                      chatMsg: chatProvider.getCHatList[index].chatMsg,
                      // chatList[index].chatMsg,
                    );
                  }),
            ),
            if (_isTyping) ...[
              Material(
                color: cardColor,
                child: const SpinKitThreeBounce(
                  color: Colors.white,
                  size: 18,
                ),
              ),
            ],
            Material(
              color: cardColor,
              child: Row(
                children: [
                  Expanded(
                      child: TextField(
                    focusNode: focusNode,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    controller: textEditingController,
                    onSubmitted: (value) async {
                      await sendMessageFCT(
                          modelsProvider: modelsProvider,
                          chatProvider: chatProvider);
                    },
                    decoration: const InputDecoration.collapsed(
                      hintText: "How can I help you",
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  )),
                  IconButton(
                    onPressed: () async {
                      await sendMessageFCT(
                          modelsProvider: modelsProvider,
                          chatProvider: chatProvider);
                    },
                    icon: const Icon(
                      Icons.send,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void scrollListTilEnd() {
    _scrollControllerList.animateTo(
        _scrollControllerList.position.maxScrollExtent,
        duration: const Duration(seconds: 2),
        curve: Curves.ease);
  }

  Future<void> sendMessageFCT(
      {required ModelsProvider modelsProvider,
      required ChatProvider chatProvider}) async {
    try {
      setState(() {
        _isTyping = true;
        // chatList
        // .add(ChatModel(chatMsg: textEditingController.text, chatIndex: 0));
        chatProvider.addUserMessage(msg: textEditingController.text);
        textEditingController.clear();
        focusNode.unfocus();
      });
      await chatProvider.sendMessageAndGetAnswers(
        msg: textEditingController.text,
        choosenModelId: modelsProvider.getCurrentModel,
      );
      // chatList.addAll(await ApiService.sendMessage(
      //   message: textEditingController.text,
      //   modelId: modelsProvider.getCurrentModel,
      // ));
      setState(() {});
    } catch (error) {
      log("error $error");
    } finally {
      setState(() {
        scrollListTilEnd();
        _isTyping = false;
      });
    }
  }
}
