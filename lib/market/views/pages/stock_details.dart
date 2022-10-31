import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../../core/configs/app_colors.dart';
import '../../../core/widgets/loader.dart';
import '../../blocs/stock_details/stock_details_bloc.dart';
import '../../models/data/stock.dart';
import '../widgets/stock_details_exception_widget.dart';
import '../widgets/stock_details_widget.dart';

class StockDetailsPage extends StatefulWidget {
  const StockDetailsPage({super.key, required this.stock});

  final Stock stock;

  @override
  State<StockDetailsPage> createState() => _StockDetailsPageState();
}

class _StockDetailsPageState extends State<StockDetailsPage> {
  late StockDetailsBloc stockDetailsBloc;

  @override
  void initState() {
    super.initState();
    stockDetailsBloc = BlocProvider.of<StockDetailsBloc>(context);
    if (stockDetailsBloc.state is! StockDetailsLoaded) {
      stockDetailsBloc.add(LoadStockDetails(widget.stock));
    }
  }

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
              child: BlocBuilder<StockDetailsBloc, StockDetailsState>(
                builder: (context, state) {
                  late Widget? stateWidget;

                  if (state is StockDetailsLoading) {
                    stateWidget = const Center(
                      child: Loader(),
                    );
                  } else if (state is StockDetailsLoaded) {
                    stateWidget =
                        StockDetailsWidget(details: state.stockDetails);
                  } else if (state is StockDetailsException) {
                    stateWidget = StockDetailsExceptionWidget(
                      exception: state.exception,
                      stock: widget.stock,
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
