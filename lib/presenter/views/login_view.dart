import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_app/application/resources/app_color.dart';
import 'package:login_app/application/resources/app_constants.dart';
import 'package:login_app/application/resources/size_utils.dart';
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
          padding: const EdgeInsets.symmetric(
            horizontal: DP14
          ),
          width: double.infinity,
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              const SizedBox(
                height: DP50,
              ),
              Image.asset(
                IMAGELOGO
              ),
              const Text(
                "Faça seu login",
                style: TextStyle(
                  fontSize: DP16,
                  fontWeight: FontWeight.w600
                ),
              ),
              const Padding(
                padding: const EdgeInsets.all(DP8),
                child: Text(
                  "Faça seu login e desfrute da experincia conosco",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400, 
                    color: gray600
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: DP20,
              ),
              inputTextField(
                label: "Username", 
                
                hintText: "Username",
                controller: _usernameController, 
                suffix: const Icon(
                  Icons.person,
                  color: Colors.grey,
                ),
                inputFormatters: [
                  TextInputFormatter.withFunction(
                    (TextEditingValue oldValue, TextEditingValue newValue) {
                      return _passwordRegExp.hasMatch(newValue.text) ? newValue : oldValue;
                    },
                  ),
                ],
              ),
              inputTextFieldPassword(
                label: "Senha", 
                hintText: "Senha",
                isVisible: true,
                controller: _passwordController, 
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                    _passwordRegExp, 
                    replacementString:""
                  )
                ],
              ),
              const SizedBox(
                height: DP4,
              ),
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: DP4
                    ),
                    child: InkWell(
                      child: Text(
                        "Esqueceu a senha ?",
                         style: TextStyle(
                          color: primary800
                         ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: DP20,
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
                  height: DP20,
                  width: DP150,
                  margin:const EdgeInsets.symmetric(
                    vertical: DP20
                  ),
                  child: const Text(
                    "Entrar"
                  ),
                ),
              ),
              const SizedBox(
                height: DP80,
              ),
              InkWell(
                child: Container(
                  padding: EdgeInsets.all(DP12),
                  child: const Text(
                    "Politicas de privacidade",
                    style: TextStyle(
                      color: gray500
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget inputTextField({String? label, String? hintText, Widget? suffix, required TextEditingController controller, List<TextInputFormatter>? inputFormatters}) {
    return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label ?? "",
                  textAlign: TextAlign.start,
                ),
                Container(
                  width: 350,
                  margin: const EdgeInsets.symmetric(
                    vertical: DP10
                  ),
                  child: TextField(
                    controller: controller,
                    style: const TextStyle(
                      fontSize:DP14,
                      color: gray800,
                      fontWeight: FontWeight.w900
                    ),
                    maxLength: 3,
                    cursorColor: gray500,
                    decoration: InputDecoration(
                      hintText: hintText,
                      hintStyle: const TextStyle(
                        fontSize:14,
                        color: gray500,
                        fontWeight: FontWeight.w300
                      ),
                      suffixIcon: suffix,
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
                    inputFormatters: inputFormatters,
                  ),
              ),
              ],
            );
  }

 Widget inputTextFieldPassword({String? label, String? hintText, required TextEditingController controller, List<TextInputFormatter>? inputFormatters,required bool isVisible}) {
    return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label ?? "",
                  textAlign: TextAlign.start,
                ),
                Container(
                  width: 350,
                  margin: const EdgeInsets.symmetric(
                    vertical: DP10
                  ),
                  child: TextField(
                    controller: controller,
                    style: const TextStyle(
                      fontSize:DP14,
                      color: gray800,
                      fontWeight: FontWeight.w900
                    ),
                    cursorColor: gray500,
                    obscureText: isVisible,
                    decoration: InputDecoration(
                      hintText: hintText,
                      hintStyle: const TextStyle(
                        fontSize:14,
                        color: gray500,
                        fontWeight: FontWeight.w300
                      ),
                      suffixIcon:  InkWell(
                        onTap: () {
                          
                        },
                        child: !isVisible ? const Icon(
                          Icons.visibility,
                          color: gray500,
                        ): const Icon(
                          Icons.visibility_off,
                          color: gray500,
                        ),
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
                    keyboardType: TextInputType.visiblePassword,
                    inputFormatters: inputFormatters,   
                  ),
              ),
              ],
            );
  }
}