import 'package:json_annotation/json_annotation.dart';

part "character_model.g.dart";

@JsonSerializable()
class CharacterModel {
  Info? info;
  List<Results>? results;

  CharacterModel({this.info, this.results});

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return _$CharacterModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CharacterModelToJson(this);
  }
}

@JsonSerializable()
class Info {
  int? count;
  int? pages;
  String? next;

  Info({this.count, this.pages, this.next});

  factory Info.fromJson(Map<String, dynamic> json) {
    return _$InfoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$InfoToJson(this);
  }
}

@JsonSerializable()
class Results {
  int? id;
  String? name;
  String? status;
  String? species;
  String? type;
  String? gender;
  String? image;
  List<String>? episode;
  String? url;
  String? created;

  Results(
      {this.id,
      this.name,
      this.status,
      this.species,
      this.type,
      this.gender,
      this.image,
      this.episode,
      this.url,
      this.created});

  factory Results.fromJson(Map<String, dynamic> json) {
    return _$ResultsFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ResultsToJson(this);
  }
}
