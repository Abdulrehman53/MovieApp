import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:movie_app/app/router.dart';

import '../constants/constants_colors.dart';
import '../ui/screens/home/movie_screen.dart';

class AppWidget extends GetWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: ConstantColor.primaryColor,
          platform: TargetPlatform.iOS,
        ),
        onGenerateRoute: AppRouter.generateRoute,
        home: const MovieScreen());
  }
}
