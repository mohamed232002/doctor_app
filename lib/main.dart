
import 'package:doctor_app/service/dio_helper.dart';
import 'package:doctor_app/src/app_root.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  runApp(const AppRoot());
}

