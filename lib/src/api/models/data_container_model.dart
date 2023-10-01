import 'package:equatable/equatable.dart';

import '../exports.dart';

class DataContainerModel<T extends ModelingProtocol> with EquatableMixin {
  int? count;
  String? next;
  String? previous;
  List<T>? results;

  DataContainerModel({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory DataContainerModel.fromjson(
    StringKeyedMap json,
    T decodableModel,
  ) =>
      DataContainerModel<T>(
        count: json["count"],
        previous: json["previous"],
        next: json["next"],
        results: (json["results"] as List).map((e) => decodableModel.fromJson(e) as T).toList(),
      );

  @override
  List<Object?> get props => [count, next, previous, results];
}
