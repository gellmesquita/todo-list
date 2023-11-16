import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:login_app/application/resources/app_color.dart';
import 'package:login_app/application/resources/app_constants.dart';
import 'package:login_app/application/resources/size_utils.dart';
import 'package:login_app/domain/entities/activities_entity.dart';
import 'package:login_app/domain/entities/user_entity.dart';
import 'package:login_app/presenter/controllers/information_capture_controller.dart';
import 'package:login_app/presenter/views/widget/input_text_field.dart';

class InformationCaptureView extends StatefulWidget {
  const InformationCaptureView({super.key, required this.controller});
  final InformationCaptureController controller;
  @override
  State<InformationCaptureView> createState() => _InformationCaptureViewState();
}

class _InformationCaptureViewState extends State<InformationCaptureView> {
  FocusNode myFocusNode = FocusNode();
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    myFocusNode.addListener(() {
      if (!myFocusNode.hasFocus) {
        _checkIfTextFilled();
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
        centerTitle: true,
        title: const Text(
          "Registro de actividades",
          style: TextStyle(
            color: gray600,
          ),
        ),
        actions: [
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: DP10, horizontal: DP10),
            child: InkWell(
              onTap: () {},
              child: const Icon(
                Icons.person_2,
                color: gray700,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: DP10, horizontal: DP18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InputTextField(
                onChanged: (p0) {
                  _checkIfTextFilled();
                },
                label: "Descreve sua actividade",
                hintText: "Digite um texto",
                focus: myFocusNode,
                controller: textEditingController,
              ),
              const SizedBox(
                height: DP10,
              ),
              Observer(
                builder: (context) {
                  var activity = widget.controller.activities;
                  return  ListView.builder(
                    itemCount: activity.length,
                    itemBuilder: (context, index) => itemActivity(
                      activity[index]
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget itemActivity(ActivitiesEntity activity) {
    return Container(
              padding: const EdgeInsets.symmetric(
                vertical: DP16,
              ),
              decoration: const BoxDecoration(
                  border: Border(bottom: BorderSide(color: gray400))),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      activity.description,
                      style: TextStyle(color: gray800),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: DP10),
                    alignment: Alignment.center,
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            editActivityDialog(activity, widget.controller.editLoading);
                          },
                          child:const Icon(
                            Icons.edit,
                            color: gray400,
                          ),
                        ),
                        const SizedBox(
                          width: DP2,
                        ),
                        InkWell(
                          onTap: () {
                            deleteActivityDialog(activity.id, widget.controller.deleteLoading);
                          },
                          child: const Icon(
                            Icons.delete_outline_outlined,
                            color: primary400,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
  }

  void _checkIfTextFilled() {
    if (textEditingController.text.isEmpty) {
      print('Por favor, preencha o campo!');
    } else {
      print('Texto preenchido: ${textEditingController.text}');
    }
  }

  @override
  void dispose() {
    textEditingController.dispose();
    myFocusNode.dispose();
    super.dispose();
  }

  void deleteActivityDialog(String id, bool isLoading) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(DP14)),
          child: Container(
            height: 260,
            width: 350,
            padding: EdgeInsets.symmetric(horizontal: DP30, vertical: DP30),
            child: Column(
              children: [
                Text(
                  "Deseja eliminar essa atividade ?",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: DP16, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: DP12,
                ),
                Text(
                  "Ao eliminar essa atividade não terá como reverter essa acção, toda informação será perdida!",
                  style: TextStyle(color: gray500),
                ),
                Expanded(child: Container()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: widget.controller.goBack,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: DP10, horizontal: DP10),
                        child: Text(
                          "Cancelar",
                          style: TextStyle(
                              fontSize: DP14,
                              fontWeight: FontWeight.bold,
                              color: gray800),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: widget.controller.goBack,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: borderRadius, color: primary800),
                        padding: EdgeInsets.symmetric(
                            vertical: DP10, horizontal: DP30),
                        child: true
                            ? Text(
                                "Confirmar",
                                style: TextStyle(
                                    fontSize: DP14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              )
                            : SizedBox(
                                width: DP20,
                                height: DP20,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: DP1,
                                ),
                              ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  void editActivityDialog(ActivitiesEntity activitiesEntity, bool isloding) {
    FocusNode focus = FocusNode();
    TextEditingController textController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(DP14)),
          child: Container(
            height: 260,
            width: 350,
            padding: EdgeInsets.symmetric(horizontal: DP30, vertical: DP30),
            child: Column(
              children: [
               
                InputTextField(
                  onChanged: (p0) {}, 
                  controller: textController,
                  focus: focus,
                  onSubmit: (p0) {
                    
                  },
                ),
                 
                Expanded(child: Container()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: widget.controller.goBack,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: DP10, 
                            horizontal: DP10
                        ),
                        child: const Text(
                          "Cancelar",
                          style: TextStyle(
                              fontSize: DP14,
                              fontWeight: FontWeight.bold,
                              color: gray800
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: widget.controller.goBack,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: borderRadius, color: primary800),
                        padding: EdgeInsets.symmetric(
                            vertical: DP10, horizontal: DP30),
                        child: true
                            ? Text(
                                "Confirmar",
                                style: TextStyle(
                                    fontSize: DP14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              )
                            : SizedBox(
                                width: DP20,
                                height: DP20,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: DP1,
                                ),
                              ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
