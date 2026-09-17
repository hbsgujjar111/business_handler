import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

class ButtonLoading extends StatelessWidget {
  const ButtonLoading({super.key, this.loaderColor});

  final Color? loaderColor;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Center(child: CircularProgressIndicator(color: loaderColor ?? KColors.kWhite)),
    );
  }
}
