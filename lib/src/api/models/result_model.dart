import '../protocol/modeling_protocol.dart';

class ResultModel extends ModelingProtocol {
  final List<dynamic>? result;

  ResultModel({this.result});

  @override
  ResultModel fromJson(dynamic json) => ResultModel(result: json);

  @override
  List<Object?> get props => [result];
}
