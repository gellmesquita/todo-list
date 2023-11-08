import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_app/presenter/controllers/login_controller.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key, required this.controller});
  final LoginController controller;
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  final RegExp _passwordRegExp = RegExp(r'^[a-zA-Z0-9]*$');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            Text(
              "Faça seu login"
            ),
           SizedBox(
            height: 20,
           ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Username",
                  textAlign: TextAlign.start,
                ),
                Container(
                  width: 350,
                  margin: EdgeInsets.symmetric(
                    vertical: 10
                  ),
                  child: TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      hintText: "Digite o username",
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.grey,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide( 
                          color: Colors.grey,
                          width: 2
                        ),
                        borderRadius: BorderRadius.circular(10) 
                      )
                    ),
                    keyboardType: TextInputType.text,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(_passwordRegExp)
                    ],

                  ),
              ),
              ],
            ),
        
            SizedBox(
            height: 20,
           ),
            Text(
              "Ola Glesin"
            ),
              Text(
              "Ola Glesin"
            )
          ],
        ),
      ),
    );
  }
}