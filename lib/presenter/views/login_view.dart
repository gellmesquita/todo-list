import 'package:flutter/material.dart';
import 'package:login_app/presenter/controllers/login_controller.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key, required this.controller});
  final LoginController controller;
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text("Login"),
      ),
    );
  }
}