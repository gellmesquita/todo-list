import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_app/application/resources/app_color.dart';
import 'package:login_app/application/resources/app_constants.dart';
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
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              SizedBox(
                height: 50,
              ),
              Image.asset(
                IMAGELOGO
              ),
              const Text(
                "Faça seu login",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600
                ),
              ),
              const Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Faça seu login e desfrute da experincia conosco, digite sua senha e password",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400, 
                    color: gray600
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Username",
                    textAlign: TextAlign.start,
                  ),
                  Container(
                    width: 350,
                    margin: const EdgeInsets.symmetric(
                      vertical: 10
                    ),
                    child: TextField(
                      controller: _passwordController,
                      style: const TextStyle(
                        fontSize:14,
                        color: gray800,
                        fontWeight: FontWeight.w900
                      ),
                      cursorColor: gray500,
                      decoration: InputDecoration(
                        hintText: "Digite o username",
                        hintStyle: const TextStyle(
                          fontSize:14,
                          color: gray500,
                          fontWeight: FontWeight.w300
                        ),
                        prefixIcon: const Icon(
                          Icons.person,
                          color: Colors.grey,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: borderRadius
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:const  BorderSide( 
                            color: Colors.grey,
                            width: 2
                          ),
                          borderRadius: borderRadius
                        ),
                      ),
                      keyboardType: TextInputType.text,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                          _passwordRegExp, 
                          replacementString:""
                        )
                      ],
                    ),
                ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Username",
                    textAlign: TextAlign.start,
                  ),
                  Container(
                    width: 350,
                    margin: const EdgeInsets.symmetric(
                      vertical: 10
                    ),
                    child: TextField(
                      controller: _passwordController,
                      style: const TextStyle(
                        fontSize:14,
                        color: gray800,
                        fontWeight: FontWeight.w900
                      ),
                      cursorColor: gray500,
                      decoration: InputDecoration(
                        hintText: "Digite o username",
                        hintStyle: const TextStyle(
                          fontSize:14,
                          color: gray500,
                          fontWeight: FontWeight.w300
                        ),
                        prefixIcon: const Icon(
                          Icons.person,
                          color: Colors.grey,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: borderRadius
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:const  BorderSide( 
                            color: Colors.grey,
                            width: 2
                          ),
                          borderRadius: borderRadius
                        ),
                      ),
                      keyboardType: TextInputType.text,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                          _passwordRegExp, 
                          replacementString:""
                        )
                      ],
                    ),
                ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  
                },
                style: ButtonStyle(
                  backgroundColor: const MaterialStatePropertyAll(
                    red800
                  ),
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: borderRadius
                    )
                  )
                ),
                child: Container(
                  alignment: Alignment.center,
                  height: 20,
                  width: 150,
      
                  margin: EdgeInsets.symmetric(
                    vertical: 20
                  ),
                  child: Text(
                    "Entrar"
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 100
                  ),
                  child: Text(
                    "Politicas de privacidade"
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}