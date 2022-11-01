import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../../core/configs/app_colors.dart';
import '../../../core/widgets/exports.dart';
import '../../blocs/stocks/stocks_bloc.dart';
import '../widgets/stocks_exception_widget.dart';
import '../widgets/stocks_list_widget.dart';

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
              child: BlocBuilder<StocksBloc, StocksState>(
                builder: (context, state) {
                  late Widget? stateWidget;

                  if (state is StocksLoading) {
                    stateWidget = const Center(
                      child: Loader(),
                    );
                  } else if (state is StocksLoaded) {
                    log("Filtered: ${state.filteredList.isNotEmpty}");
                    // log("Using: ${state.filteredList.isEmpty ? state.stocks : state.filteredList}");
                    stateWidget = StocksListWidget(
                      stocks: state.filteredList.isEmpty
                          ? state.stocks
                          : state.filteredList,
                    );
                  } else if (state is StocksException) {
                    stateWidget = StocksExceptionWidget(
                      exception: state.exception,
                    );
                  } else {
                    stateWidget = const SizedBox.shrink();
                  }

                  return AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    child: stateWidget,
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
