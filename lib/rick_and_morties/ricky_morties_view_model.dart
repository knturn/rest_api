import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import '../core/network/project_network_manager.dart';
import 'rick_morties.dart';

import 'model/character_model.dart';

abstract class RickandMortiesViewModel extends State<RickandMorty> {
  final dio = ProjectNetworkManager.instance.dio;
  CharacterModel models = CharacterModel();

  Future<void> fetchAllData() async {
    final response = await dio.get(ServicePath.character.rawValue);
    if (response.statusCode == HttpStatus.ok) {
      final data = response.data;

      if (data is Map<String, dynamic>) {
        final characterModel = CharacterModel.fromJson(data);
        models = characterModel;
      } else {
        print(errorTextConfiguration);
      }
      setState(() {});
    }
  }
}

enum ServicePath { character }

extension ServicePathExtansion on ServicePath {
  String get rawValue {
    switch (this) {
      case ServicePath.character:
        return ("/character");
    }
  }
}
