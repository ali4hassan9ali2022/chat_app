import 'package:chat_app/Views/login_view.dart';
import 'package:chat_app/Views/register_view.dart';
import 'package:chat_app/cubit/auth_cubit/auth_cubit.dart';
import 'package:chat_app/firebase_options.dart';
import 'package:chat_app/simple_bloc_opserver.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = SimpleBlocOpserver();
  runApp(const ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        routes: {
          LoginView.id: (context) => const LoginView(),
          RegisterView.id: (context) => const RegisterView(),
        },
        initialRoute: LoginView.id,
      ),
    );
  }
}
