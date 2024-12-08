import 'package:chat_app/Widgets/custom_botton.dart';
import 'package:chat_app/Widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static String id = "LoginView";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
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
            "Login",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const CustomTextFormField(
            icon: Icons.person,
            text: "Email",
          ),
          const SizedBox(
            height: 15,
          ),
          const CustomTextFormField(
            text: "Password",
            icon: Icons.password,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomBotton(
            onTap: () {},
            text: "login",
          ),
        ],
      ),
    );
  }
}
