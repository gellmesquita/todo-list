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
  late TextEditingController textEditingController= TextEditingController();

  @override
  void initState() {
    super.initState();
    widget.controller.fetchActivity();
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
      body: Container(
        padding: const EdgeInsets.symmetric(
          vertical: DP10, 
          horizontal: DP18
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Observer(
              builder: (context) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InputTextField(
                    onChanged: (p0) { },
                    onSubmit: (p0) {
                      _checkIfTextFilled();
                    },
                    label: "Descreve sua actividade",
                    hintText: "Digite um texto",
                    focus: myFocusNode,
                    controller: textEditingController,
                  ),
                  if(widget.controller.addLoading)
                  Text("Adicionado ...")
                ],
              ),
            ),
            const SizedBox(
              height: DP10,
            ),
            Expanded(
              child: Observer(
                builder: (context) => ListView.builder(
                  shrinkWrap: true,
                  itemCount: widget.controller.activities.length,
                  itemBuilder: (context, index) {
                    var activity = widget.controller.activities[index];
                    return itemActivity(activity);
                  },
                ),
              ),
            )
          ],
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
              style: const TextStyle(color: gray800),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: DP10),
            alignment: Alignment.center,
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    FocusScope.of(context).nextFocus();
                    editActivityDialog(activity, widget.controller.editLoading);
                  },
                  child: const Icon(
                    Icons.edit,
                    color: gray400,
                  ),
                ),
                const SizedBox(
                  width: DP2,
                ),
                InkWell(
                  onTap: () {
                    myFocusNode.unfocus();
                    deleteActivityDialog(
                      activity.id, 
                      widget.controller.deleteLoading
                    );
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

  void _moveToNextFocus() {
    FocusScope.of(context).requestFocus(myFocusNode);
  }

  void _checkIfTextFilled() {
    if (textEditingController.text.isEmpty) {
      toastMessage(context, "precisa preencher o campo", primary600);
    } else {
      widget.controller.addActivity(textEditingController.text);
      textEditingController.text="";
    }
  }


  void toastMessage(BuildContext context, String message, Color color ){
    ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      padding: EdgeInsets.all(DP14),
      backgroundColor: color,
      content: Text(message)
    )
                            );
  }


  @override
  void dispose() {
    textEditingController.dispose();
    myFocusNode.dispose();
    super.dispose();
  }

  void deleteActivityDialog(int id, bool isLoading) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(DP14)
          ),
          child: Container(
            height: 260,
            width: 350,
            padding: const EdgeInsets.symmetric(horizontal: DP30, vertical: DP30),
            child: Column(
              children: [
                const Text(
                  "Deseja eliminar essa atividade ?",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: DP16, fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: DP12,
                ),
                const Text(
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
                        padding: const EdgeInsets.symmetric(
                            vertical: DP10,
                             horizontal: DP10
                        ),
                        child: const Text(
                          "Cancelar",
                          style: TextStyle(
                              fontSize: DP14,
                              fontWeight: FontWeight.bold,
                              color: gray800),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                       widget.controller.deleteActivity(id);
                       _moveToNextFocus(); 
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: borderRadius, color: primary800),
                        padding: const EdgeInsets.symmetric(
                            vertical: DP10,
                             horizontal: DP30
                        ),
                        child: !isLoading
                            ? const Text(
                                "Confirmar",
                                style: TextStyle(
                                    fontSize: DP14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              )
                            : loading(),
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

  Widget loading({Color color=Colors.white, double size= DP20 }) {
    return  Container(
      width: size,
      height: size,
      child: CircularProgressIndicator(
        color: color,
        strokeWidth: DP2,
      ),
    );
  }

  void editActivityDialog(
    ActivitiesEntity activity, 
    bool isLoading
  ){
    FocusNode focus = FocusNode();
    TextEditingController textController = TextEditingController(text: activity.description);
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(DP14)),
          child: Container(
            height: 260,
            width: 350,
            padding: const EdgeInsets.symmetric(horizontal: DP30, vertical: DP30),
            child: Column(
              children: [
                InputTextField(
                  onChanged: (p0) {},
                  label: "Editar actividade nº ${activity.id}",
                  controller: textController,
                  focus: focus,
                  onSubmit: (p0) {},
                ),
                Expanded(child: Container()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap:() {
                        widget.controller.goBack();
                        _moveToNextFocus();
                      },
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
                      onTap: () {
                        widget.controller.editActivity(
                          ActivitiesEntity(
                            description: textController.text, 
                            id: activity.id
                          )
                        );
                        _moveToNextFocus();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: borderRadius, color: primary800),
                        padding: const EdgeInsets.symmetric(
                            vertical: DP10, horizontal: DP30),
                        child: !isLoading
                            ? const Text(
                                "Confirmar",
                                style: TextStyle(
                                    fontSize: DP14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              )
                            : const SizedBox(
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
