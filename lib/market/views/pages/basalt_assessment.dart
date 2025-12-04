import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../../../core/configs/app_colors.dart';
import '../../../core/services/assets_cache.dart';
import '../../../l10n/l10n.dart';
import '../../blocs/connectivity_status/connectivity_status_bloc.dart';
import 'device_offline_page.dart';
import 'market_stack_reports.dart';

class BasaltAssessment extends StatelessWidget {
  const BasaltAssessment({super.key});

  @override
  Widget build(BuildContext context) {
    // cache all assets
    cacheAssets(context);
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.primary,
        fontFamily: "Inter",
      ),
      themeMode: ThemeMode.dark,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      home: BlocBuilder<ConnectivityStatusBloc, ConnectivityStatusState>(
        builder: (context, state) {
          late Widget displayedWidget;

          if (state is Connected) {
            displayedWidget = const MarketStackReportsPage();
          } else {
            displayedWidget = const DeviceOfflinePage();
          }

          return AnimatedSwitcher(
            duration: const Duration(
              milliseconds: 200,
            ),
            child: displayedWidget,
          );
        },
      ),
    );
  }
}
