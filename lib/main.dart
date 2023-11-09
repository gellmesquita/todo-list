import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:login_app/app_module.dart';
import 'package:login_app/application/resources/app_theme.dart';


void main() {
  runApp(
    ModularApp(
      module: AppModule(), 
      child: MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: Modular.routerConfig,
      theme: AppTheme.appTheme,
    );
  }
}

