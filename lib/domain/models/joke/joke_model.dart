import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'joke_model.g.dart';

@JsonSerializable()
class JokeModel extends Equatable {
  @JsonKey(name: "value")
  final String? value;

  factory JokeModel.fromJson(Map<String, dynamic> json) =>
      _$JokeModelFromJson(json);

  const JokeModel(
    this.value,
  );

  Map<String, dynamic> toJson() => _$JokeModelToJson(this);

  @override
  List<Object?> get props => <Object?>[value];
}
