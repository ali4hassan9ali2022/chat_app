import 'package:chat_app/cubit/auth_cubit/auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit {
  AuthCubit(super.initialState);
  authLogin({required String email, required String password}) async {
    emit(LoginLoadingState());
    try {
      var user = FirebaseAuth.instance;
      UserCredential credential = await user.signInWithEmailAndPassword(
          email: email, password: password);
      print(credential);
      emit(LoginSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(LoginFailureState(errmessage: "No user found for that email."));
      } else if (e.code == 'wrong-password') {
        emit(LoginFailureState(
            errmessage: "Wrong password provided for that user."));
      }
    } catch (e) {
      emit(LoginFailureState(errmessage: "Error"));
    }
  }

  authRegister({required String email, required String password}) async {
    emit(RegisterLoadingState());
    try {
      var user = FirebaseAuth.instance;
      UserCredential credential = await user.createUserWithEmailAndPassword(
          email: email, password: password);
      print(credential);
      emit(RegisterSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(RegisterFailureState(
            errmessage: "The password provided is too weak."));
      } else if (e.code == 'email-already-in-use') {
        emit(RegisterFailureState(
            errmessage: "The account already exists for that email."));
      }
    } catch (e) {
      emit(RegisterFailureState(errmessage: "Error"));
    }
  }
}
