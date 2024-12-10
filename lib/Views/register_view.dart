import 'package:chat_app/Views/chat_view.dart';
import 'package:chat_app/Widgets/custom_botton.dart';
import 'package:chat_app/Widgets/custom_text_form_field.dart';
import 'package:chat_app/cubit/auth_cubit/auth_cubit.dart';
import 'package:chat_app/cubit/auth_cubit/auth_state.dart';
import 'package:chat_app/cubit/chat_cubit/chat_cubit.dart';
import 'package:chat_app/helper/show_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class RegisterView extends StatelessWidget {
  RegisterView({super.key});
  static String id = "RegisterView";
  String? email;
  String? password;
  GlobalKey<FormState> formKey = GlobalKey();
  bool isLoading = false;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled; 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is RegisterLoadingState) {
            isLoading = true;
          } else if (state is RegisterSuccessState) {
            BlocProvider.of<ChatCubit>(context).getMessage();
            Navigator.pushNamed(context, ChatView.id, arguments: email);
            isLoading = false;
          } else if (state is RegisterFailureState) {
            showSnackBar(context, state.errmessage);
            isLoading = false;
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Form(
              autovalidateMode: autovalidateMode,
              key: formKey,
              child: ListView(
                children: [
                  const SizedBox(
                    height: 75,
                  ),
                  Image.asset(
                    "assets/images/scholar.png",
                    height: 100,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Scholar",
                        style: TextStyle(
                          fontSize: 22,
                          fontFamily: "Pacifico",
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const Text(
                    "Register",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextFormField(
                    onSaved: (value) {
                      email = value;
                    },
                    icon: Icons.person,
                    text: "Email",
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextFormField(
                    onSaved: (value) {
                      password = value;
                    },
                    text: "Password",
                    icon: Icons.password,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomBotton(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        BlocProvider.of<AuthCubit>(context)
                            .authRegister(email: email!, password: password!);
                      } else {
                        autovalidateMode = AutovalidateMode.always;
                      }
                    },
                    text: "register",
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'already have an account?',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                          '  Login',
                          style: TextStyle(
                            color: Color(0xffC7EDE6),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
