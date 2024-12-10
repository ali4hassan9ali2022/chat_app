class MessageModel {
  final String message;
  final String id;
  MessageModel({required this.message, required this.id});
  factory MessageModel.formjson(json) {
    return MessageModel(message: json["message"], id: json["id"]);
  }
}