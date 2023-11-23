import 'package:clima/features/presentation/view_models/weather_view_model.dart';
import 'package:clima/helpers/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

class HeaderAnimation extends ConsumerWidget {
  const HeaderAnimation({
    super.key,
  });

  @override
  Widget build(BuildContext context, ref) {
    final weatherViewModel = ref.watch(weatherNotifierProvider);

    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.5,
          child: Lottie.asset(
            getIconFromCondition(weatherViewModel.weather!.condition),
            fit: BoxFit.fitWidth,
          ),
        ),
      ],
    );
  }
}
