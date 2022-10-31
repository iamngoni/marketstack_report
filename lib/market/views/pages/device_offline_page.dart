import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../../core/configs/app_colors.dart';

class DeviceOfflinePage extends StatelessWidget {
  const DeviceOfflinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Scaffold(
          backgroundColor: AppColors.primary,
          body: SafeArea(
            child: Container(
              height: height,
              width: width,
              padding: EdgeInsets.symmetric(
                horizontal: sx(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.wifi_off_rounded,
                    color: Colors.white,
                    size: sy(30),
                  ),
                  SizedBox(
                    height: sy(10),
                  ),
                  Text(
                    "Device Offline",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: sy(12),
                    ),
                  ),
                  SizedBox(
                    height: sy(3),
                  ),
                  Text(
                    "Your device is currently offline and not connected to the "
                    "internet. Please check your connection.",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: sy(9.5),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
