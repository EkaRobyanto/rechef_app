// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
part 'method.freezed.dart';
part 'method.g.dart';

@freezed
class Method with _$Method {
  factory Method({
    @JsonKey(name: 'method_text') String? methodText,
  }) = _Method;
  factory Method.fromJson(Map<String, dynamic> data) => _$MethodFromJson(data);
}
