import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:animated_text_kit/animated_text_kit.dart';

import 'package:talk_with_me_app/constants/constants.dart';
import 'package:talk_with_me_app/services/assets_manager.dart';
import 'package:talk_with_me_app/widgets/text_widget.dart';

class ChatWidget extends StatelessWidget {
  final String chatMsg;
  final int chatIndex;

  const ChatWidget({super.key, required this.chatMsg, required this.chatIndex});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color: chatIndex == 0 ? scaffoldBackgroundColor : cardColor,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  chatIndex == 0
                      ? AssetsManager.userImage
                      : AssetsManager.botImage,
                  height: 30,
                  width: 30,
                ),
              ),
              const SizedBox(width: 5),
              Expanded(
                child: chatIndex == 0
                    ? TextWidget(label: chatMsg)
                    : DefaultTextStyle(
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 17,
                          fontFamily: "Mulish",
                        ),
                        child: AnimatedTextKit(
                          isRepeatingAnimation: false,
                          repeatForever: false,
                          displayFullTextOnTap: true,
                          totalRepeatCount: 1,
                          animatedTexts: [
                            TyperAnimatedText(chatMsg.trim()),
                          ],
                        )),
              ),
              chatIndex == 0
                  ? const SizedBox.shrink()
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.thumb_up_alt_outlined,
                            color: Colors.white,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.thumb_down_alt_outlined,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    )
            ],
          ),
        ),
      ],
    );
  }
}
