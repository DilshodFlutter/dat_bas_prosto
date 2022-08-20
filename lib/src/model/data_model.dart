import 'dart:convert';

List<DataModel> dataModelFromJson(String str) =>
    List<DataModel>.from(json.decode(str).map((x) => DataModel.fromJson(x)));

class DataModel {
  DataModel({
    this.id = 0,
    required this.name,
    required this.kritName,
    required this.kritNextName,
  });

  int id;
  String name;
  String kritName;
  String kritNextName;

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        id: json["id"] ?? 0,
        name: json["name"] ?? "",
        kritName: json['kritName'] ?? '',
        kritNextName: json['kritNextName'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        'kritName': kritName,
        'kritNextName': kritNextName,
      };
}
