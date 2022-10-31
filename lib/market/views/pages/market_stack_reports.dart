import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../../core/configs/app_colors.dart';

class MarketStackReportsPage extends StatelessWidget {
  const MarketStackReportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Scaffold(
          backgroundColor: AppColors.primary,
          appBar: AppBar(
            backgroundColor: AppColors.primary,
            elevation: 0,
            title: Image(
              image:
                  const AssetImage("assets/images/marketstack_logo_white.png"),
              height: sy(15),
            ),
            centerTitle: true,
            // ignore: use_decorated_box
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: AppColors.gray,
                  ),
                ),
              ),
            ),
          ),
          body: SafeArea(
            child: Container(
              height: height,
              width: width,
              padding: EdgeInsets.symmetric(
                horizontal: sx(20),
              ),
            ),
          ),
        );
      },
    );
  }
}
