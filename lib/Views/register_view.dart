import 'package:chat_app/Widgets/custom_botton.dart';
import 'package:chat_app/Widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});
  static String id = "RegisterView";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
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
  }
}
