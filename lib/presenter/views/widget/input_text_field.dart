import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_app/application/resources/app_color.dart';
import 'package:login_app/application/resources/app_constants.dart';
import 'package:login_app/application/resources/size_utils.dart';

class InputTextField extends StatelessWidget {
  InputTextField({
    super.key,
    this.label,
    required this.onChanged,  
    this.maxLength=20,
    this.hintText, 
    this.suffix, 
    required  this.controller, 
    this.inputFormatters, 
    this.isVisible=false, 
    this.isPassword=false, 
    this.errorText="", 
    this.changeVisible,
    this.focus,
    this.onSubmit
  });

  String? label;
  Function(String)? onChanged;
  int maxLength;
  String? hintText;
  Widget? suffix;
  TextEditingController controller; 
  List<TextInputFormatter>? inputFormatters;
  bool isVisible;
  bool isPassword; 
  String errorText;
  Function? changeVisible;
  FocusNode? focus;
  Function(String)? onSubmit;

  @override
  Widget build(BuildContext context) {
    return Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  label ?? "",
                  textAlign: TextAlign.start,
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(
                    vertical: DP10
                  ),
                  child: TextField(
                    controller: controller,
                    focusNode: focus,
                    onSubmitted: onSubmit,
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
                      errorText: errorText.isNotEmpty ? errorText : null,
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