import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../../../core/configs/app_colors.dart';
import '../../../core/services/assets_cache.dart';
import '../../../l10n/l10n.dart';
import 'market_stack_reports.dart';

class BasaltAssessment extends StatelessWidget {
  const BasaltAssessment({super.key});

  @override
  Widget build(BuildContext context) {
    // cache all assets
    cacheAssets(context);
    return MaterialApp(
      theme: ThemeData(
        backgroundColor: AppColors.primary,
      ),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      home: const MarketStackReportsPage(),
    );
  }
}
