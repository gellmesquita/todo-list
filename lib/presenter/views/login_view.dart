import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_app/application/resources/app_color.dart';
import 'package:login_app/application/resources/app_constants.dart';
import 'package:login_app/application/resources/size_utils.dart';
import 'package:login_app/presenter/controllers/login_controller.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key, required this.controller});
  final LoginController controller;
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final RegExp _passwordRegExp = RegExp(r'^[a-zA-Z0-9]*$');
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                    "Faça seu login e desfrute da experiencia conosco",
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
                Observer(
                  builder: (context) => inputTextField(
                    onChanged: widget.controller.onChangeUsername,
                    label: "Username", 
                    errorText: widget.controller.errorUsername,
                    hintText: "Username",
                    controller: _usernameController, 
                    suffix: const Icon(
                      Icons.person,
                      color: Colors.grey,
                    ),
                    inputFormatters: [],
                  )
                ),
                Observer(
                  builder: (context) => inputTextField(
                    onChanged: widget.controller.onChangePassword,
                    label: "Senha", 
                    errorText: widget.controller.errorPassword,
                    hintText: "Senha",
                    isPassword: true,
                    changeVisible: widget.controller.setVisiblePassword,
                    isVisible: widget.controller.visiblePassword,
                    controller: _passwordController, 
                    inputFormatters: [
                      TextInputFormatter.withFunction(
                        (TextEditingValue oldValue, TextEditingValue newValue) {
                          return _passwordRegExp.hasMatch(newValue.text) ? newValue : oldValue;
                        },
                      ),
                    ],
                  )
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
                Observer(
                  builder: (context) => Column(
                    children: [
                      !widget.controller.isLoading ?
                      ElevatedButton(
                      onPressed: () async {
                        var result= await widget.controller.login();
                        if (!result) {
                          ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            padding: EdgeInsets.all(DP14),
                            backgroundColor: primary600,
                            content: Text(widget.controller.erroAuth)
                          )
                        );
                        }
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
                      ):
                      const CircularProgressIndicator(
                        color: red500,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: DP80,
                ),
                InkWell(
                  onTap: openUrl,
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
      ),
    );
  }

  void openUrl() async {
    const url = 'https://www.google.com';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }
  
  Widget inputTextField({
    String? label,
    required Function(String)? onChanged,  
    int maxLength=20,
    String? hintText, 
    Widget? suffix, 
    required TextEditingController controller, 
    List<TextInputFormatter>? inputFormatters, 
    bool isVisible=false, 
    bool isPassword=false, 
    String? errorText, 
    Function? changeVisible
  }) {
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
                    obscureText: isVisible,
                    onChanged: onChanged,
                    style: const TextStyle(
                      fontSize:DP14,
                      color: gray800,
                      fontWeight: FontWeight.w900
                    ),
                    maxLength: maxLength,
                    maxLengthEnforcement: MaxLengthEnforcement.enforced,
                    cursorColor: gray500,
                    decoration: InputDecoration(
                      hintText: hintText,
                      errorText: errorText!.isNotEmpty ? errorText : null,
                      errorMaxLines: 2,
                      hintStyle: const TextStyle(
                        fontSize:14,
                        color: gray500,
                        fontWeight: FontWeight.w300
                      ),
                      counterText: '',
                      suffixIcon: !isPassword ? suffix : InkWell(
                        onTap: () {
                          changeVisible!();
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
                    keyboardType: TextInputType.text,
                    inputFormatters: inputFormatters,
                  ),
              ),
              ],
            );
  }

}