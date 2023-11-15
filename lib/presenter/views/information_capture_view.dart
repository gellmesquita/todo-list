import 'package:flutter/material.dart';
import 'package:login_app/application/resources/app_color.dart';
import 'package:login_app/application/resources/size_utils.dart';
import 'package:login_app/presenter/controllers/information_capture_controller.dart';

class InformationCaptureView extends StatefulWidget {
  const InformationCaptureView({super.key, required this.controller});
  final InformationCaptureController controller;
  @override
  State<InformationCaptureView> createState() => _InformationCaptureViewState();
}

class _InformationCaptureViewState extends State<InformationCaptureView> {
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
            padding: const EdgeInsets.symmetric(
              vertical: DP10,
              horizontal: DP10
            ),
            child: InkWell(
              onTap: () {
                
              },
              child: const Icon(
                Icons.person_2,
                color: gray700,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            
          ],
        ),
      ),
    );
  }
}