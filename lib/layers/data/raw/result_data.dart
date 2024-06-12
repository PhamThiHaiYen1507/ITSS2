import 'package:json_annotation/json_annotation.dart';

part 'result_data.g.dart';

@JsonSerializable()
class ResultData {
  bool? result;
  ResultData();

  factory ResultData.fromJson(Map<String, dynamic> json) =>
      _$ResultDataFromJson(json);

  Map<String, dynamic> toJson() => _$ResultDataToJson(this);
}
