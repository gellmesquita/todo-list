import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:login_app/application/resources/app_color.dart';
import 'package:login_app/application/resources/size_utils.dart';
import 'package:login_app/presenter/controllers/profile_controller.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key, required this.controller});
  final ProfileController controller;
  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {


  @override
  void initState() {
    super.initState();
    widget.controller.fetchUser();
   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: InkWell(
          onTap:(){
            widget.controller.goBack();
          },
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
        width: double.infinity,
        child: Column(
          children: [
            const SizedBox(
              height: DP12,
            ),
            const CircleAvatar(
              radius: 50, // Tamanho do círculo
              backgroundColor: gray400, // Cor de fundo do círculo
              child: Icon(
                Icons.person, // Ícone de usuário
                size: 50, // Tamanho do ícone
                color: Colors.white, // Cor do ícone
              ),
            ),
            const SizedBox(
              height: DP12,
            ),
            Observer(
              builder: (context) => Column(
                children: [
                  if(widget.controller.user!= null)
                    Column(
                      children: [
                        ItemProfile( userData: widget.controller.user!.name),
                        ItemProfile( userData: widget.controller.user!.numberPhone, label: "Telefone")
                      ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: DP30,
            ),
            const Text(
              "Ao terminar sua secção elimina todos os seus registros de actividades.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                color: gray500
              ),
            ),
            const SizedBox(
              height: DP12,
            ),
            Container(
              padding: EdgeInsets.all(DP12),
              child: InkWell(
                onTap: widget.controller.logout,
                child: const Text(
                  "Terminar secção",
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    color: primary500
                  ),
                ),
              ),
            ),
            
          ],
        ),
      ),
    );
  }

  Container ItemProfile({String userData="", String label="Nome"}) {
    return Container(
      width: double.infinity,
      decoration:const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: gray400)
                )
          ),
          padding: const EdgeInsets.symmetric(
            vertical: DP20
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: TextStyle(
                  color: gray500
                ),
              ),
              Text(
                userData,
                style: TextStyle(
                  fontWeight: FontWeight.w700
                ),
              ),
            ],
          ),
    );
  }

  @override
  void dispose() {
    
    super.dispose();
  }


}
