import 'package:flutter/material.dart';
import 'package:talk_with_me_app/widgets/drop_down.dart';

import '../constants/constants.dart';
import '../widgets/text_widget.dart';

class Services {
  static Future<void> showModalSheet({required BuildContext context}) async {
    await showModalBottomSheet(
        backgroundColor: cardColor,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        )),
        context: context,
        builder: (context) {
          return const Padding(
            padding: EdgeInsets.all(18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: TextWidget(
                    label: "Choosen Model :",
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Flexible(
                  // flex: 2,
                  child: ModelsDropDownWidget(),
                )
              ],
            ),
          );
        });
  }
}
