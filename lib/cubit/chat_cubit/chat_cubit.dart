import 'package:chat_app/cubit/chat_cubit/chat_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitialState());
  CollectionReference messages =
      FirebaseFirestore.instance.collection('message');
  void sendMessage({required String message, required String email}) {
    try {
      messages.add({
        'message': message, // John Doe
        'crateDate': DateTime.now(), // Stokes and Sons
        'id': email // 42
      });
    } catch (e) {
      print(e);
    }
  }
}
