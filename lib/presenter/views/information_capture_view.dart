import 'package:flutter/material.dart';
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
    return const Placeholder();
  }
}