import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../models/data/stock.dart';
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
              Expanded(
                child: ListView.builder(
                  itemCount: stocks.length,
                  itemBuilder: (context, index) {
                    return StockContainerWidget(
                      stock: stocks[index],
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
