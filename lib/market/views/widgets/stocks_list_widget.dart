import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../blocs/stocks/stocks_bloc.dart';
import '../../models/data/stock.dart';
import 'auto_complete_text_field.dart';
import 'stock_container_widget.dart';

class StocksListWidget extends StatelessWidget {
  const StocksListWidget({
    super.key,
    required this.stocks,
  });

  final List<Stock> stocks;

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return SizedBox(
          height: height,
          width: width,
          child: Column(
            children: [
              SizedBox(
                height: sy(10),
              ),
              const AutoCompleteTextField(),
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () async {
                    Future.delayed(const Duration(milliseconds: 200), () {
                      BlocProvider.of<StocksBloc>(context).add(LoadStocks());
                    });
                  },
                  child: ListView.builder(
                    itemCount: stocks.length,
                    itemBuilder: (context, index) {
                      return StockContainerWidget(
                        stock: stocks[index],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
