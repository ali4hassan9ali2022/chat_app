import 'package:chat_app/models/message_model.dart';

abstract class ChatState {}
class ChatInitialState extends ChatState {}
class ChatSuccessState extends ChatState{
  List<MessageModel> message;
 ChatSuccessState({required this.message});
  
}