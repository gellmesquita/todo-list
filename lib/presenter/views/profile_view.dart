import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:login_app/application/resources/app_color.dart';
import 'package:login_app/application/resources/app_constants.dart';
import 'package:login_app/application/resources/size_utils.dart';
import 'package:login_app/domain/entities/activities_entity.dart';
import 'package:login_app/domain/entities/user_entity.dart';
import 'package:login_app/presenter/controllers/information_capture_controller.dart';
import 'package:login_app/presenter/controllers/profile_controller.dart';
import 'package:login_app/presenter/views/widget/input_text_field.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key, required this.controller});
  final ProfileController controller;
  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
   FocusNode myFocusNode = FocusNode();
  late TextEditingController textEditingController= TextEditingController();

  @override
  void initState() {
    super.initState();
    widget.controller.fetchUser();
    myFocusNode.addListener(() {
      if (!myFocusNode.hasFocus) {
        FocusScope.of(context).requestFocus(myFocusNode);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: InkWell(
          onTap: widget.controller.goBack,
          child: const Icon(
            Icons.arrow_back_ios,
            color: gray800,
          ),
        ),
        centerTitle: true,
        title: const Text(
          "Perfil",
          style: TextStyle(
            color: gray600,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          vertical: DP10, 
          horizontal: DP18
        ),
        child: Column(
          children: [
            CircleAvatar(
              backgroundColor: gray800,
            ),
            SizedBox(
              height: DP12,
            ),
            ItemProfile( userData: widget.controller.user!.name),
            ItemProfile( userData: widget.controller.user!.)
          ],
        ),
      ),
    );
  }

  Container ItemProfile({String userData=""}) {
    return Container(
            padding: EdgeInsets.symmetric(
              vertical: DP8,
            ),
            child: Text(
              userData,
            ),
          );
  }

  @override
  void dispose() {
    
    super.dispose();
  }


}
