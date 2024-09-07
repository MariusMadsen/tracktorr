import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:laruina/services/auth_service.dart';
import 'package:laruina/services/loader.dart';
import 'package:laruina/widgets/login/logintextfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  void signIn(BuildContext context) async {
    Loader.load(context);
    await AuthService.login(emailController.text.trim(),
            passwordController.text.trim(), context)
        .onError((error, stackTrace) {
      showDialog(
              context: context,
              builder: (_) => const AlertDialog(
                    title: Text("Could not authorize login."),
                  ),
              barrierDismissible: true)
          .whenComplete(() {});
      return true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 75,
                ),
                const Text(
                  "Welcome",
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 50,
                ),
                LoginTextField(
                  placeholder: "Email",
                  obscured: false,
                  controller: emailController,
                  icon: FontAwesomeIcons.at,
                ),
                LoginTextField(
                  icon: FontAwesomeIcons.lock,
                  placeholder: "Password",
                  obscured: true,
                  controller: passwordController,
                ),
                GestureDetector(
                  onTap: () {
                    signIn(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 25, horizontal: 75),
                    margin: const EdgeInsets.symmetric(horizontal: 50),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(143, 93, 224, 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                        child: Text(
                      "Sign In",
                    )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
