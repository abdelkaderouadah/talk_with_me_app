import 'package:flutter/material.dart';
import 'package:talk_with_me_app/constants/constants.dart';

class ModelsDropDownWidget extends StatefulWidget {
  const ModelsDropDownWidget({super.key});

  @override
  State<ModelsDropDownWidget> createState() => _ModelsDropDownWidgetState();
}

class _ModelsDropDownWidgetState extends State<ModelsDropDownWidget> {
  String currentModels = "Model1";
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      dropdownColor: cardColor,
      iconEnabledColor: Colors.white,
      items: getModelsItem,
      value: currentModels,
      onChanged: (value) {
        setState(() {
          currentModels = value.toString();
        });
      },
    );
  }
}
