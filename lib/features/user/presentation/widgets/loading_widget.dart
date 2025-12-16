import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/app_size/dimens.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Lottie.asset(
            'assets/animations/search.json',
            width: Dimens.w400,
            height: Dimens.h250,
            fit: BoxFit.contain,
          ),
          Text(
            "Searching . . . ",
            style: TextStyle(
              fontSize: Dimens.f22,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
