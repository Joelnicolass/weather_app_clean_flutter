import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HeaderAnimation extends StatelessWidget {
  const HeaderAnimation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.5,
          child: Lottie.asset(
            'assets/lottie/soleado.json',
            fit: BoxFit.fitWidth,
          ),
        ),
      ],
    );
  }
}
