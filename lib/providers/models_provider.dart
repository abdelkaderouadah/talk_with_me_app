import 'package:flutter/material.dart';

import 'package:talk_with_me_app/services/api_service.dart';

import '../models/models_model.dart';

class ModelsProvider with ChangeNotifier {
  String currentModel = "text-davinci-003";

  List<ModelsModel> get getModelsList {
    return modelsList;
  }

  List<ModelsModel> modelsList = [];

  String get getCurrentModel {
    return currentModel;
  }

  void setCurrentModel(String newModel) {
    currentModel = newModel;
    notifyListeners();
  }

  Future<List<ModelsModel>> getAllModels() async {
    modelsList = await ApiService.getModels();

    return modelsList;
  }
}
