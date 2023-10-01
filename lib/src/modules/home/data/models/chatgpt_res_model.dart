import '../../../../api/exports.dart';

class ChatgptModel extends ModelingProtocol {
  String? id;
  String? object;
  int? created;
  String? model;
  List<Choices>? choices;
  Usage? usage;

  ChatgptModel({this.choices, this.created, this.id, this.model, this.object, this.usage});

  @override
  fromJson(json) => ChatgptModel(
      choices: (json["choices"] as List).map((element) => Choices.fromJson(element)).toList(),
      created: json["created"],
      id: json["id"],
      model: json["model"],
      object: json["object"],
      usage: json["usage"] != null ? Usage.fromJson(json["usage"]) : null);

  @override
  List<Object?> get props => [choices, created, id, model, object, usage];
}

class Choices {
  int? index;
  Message? message;
  String? finishReason;

  Choices({this.index, this.message, this.finishReason});

  Choices.fromJson(Map<String, dynamic> json) {
    index = json['index'];
    message = json['message'] != null ? Message.fromJson(json['message']) : null;
    finishReason = json['finish_reason'];
  }
}

class Message {
  String? role;
  String? content;

  Message({this.role, this.content});

  Message.fromJson(Map<String, dynamic> json) {
    role = json['role'];
    content = json['content'];
  }
}

class Usage {
  int? promptTokens;
  int? completionTokens;
  int? totalTokens;

  Usage({this.promptTokens, this.completionTokens, this.totalTokens});

  Usage.fromJson(Map<String, dynamic> json) {
    promptTokens = json['prompt_tokens'];
    completionTokens = json['completion_tokens'];
    totalTokens = json['total_tokens'];
  }
}
