import 'package:flutter/material.dart';
import 'package:talk_with_me_app/constants/constants.dart';
import 'package:talk_with_me_app/services/assets_manager.dart';
import 'package:talk_with_me_app/widgets/text_widget.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color: cardColor,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  AssetsManager.userImage,
                  height: 30,
                  width: 30,
                ),
              ),
              const TextWidget(label: "Hello, How are you"),
            ],
          ),
        ),
      ],
    );
  }
}
