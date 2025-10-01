
import 'package:flutter/material.dart';
import 'package:myphsar/base_widget/custom_appbar_view.dart';
import 'package:myphsar/dashborad/dash_board_view.dart';

class SplashScreenView extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DashBoardView(),
    );
  }

}