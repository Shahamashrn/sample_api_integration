import 'dart:convert';

import 'results.dart';

class ResultsModel {
  ResultsModel(
    this.responseCode,
    this.results,
  );

  int responseCode;
  List<Result> results;

  factory ResultsModel.fromJson(String str) => ResultsModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ResultsModel.fromMap(Map<String, dynamic> json) => ResultsModel(
    json["response_code"],
    List<Result>.from(json["results"].map((x) => Result.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "response_code": responseCode,
    "results": List<dynamic>.from(results.map((x) => x.toMap())),
  };
}