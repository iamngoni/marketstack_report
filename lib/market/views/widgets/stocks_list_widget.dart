import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../../core/configs/app_colors.dart';
import '../../models/data/stock.dart';

class StocksListWidget extends StatelessWidget {
  const StocksListWidget({
    super.key,
    required this.stocks,
  });

  final List<Stock> stocks;

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(builder: (context, height, width, sy, sx) {
      return SizedBox(
        height: height,
        width: width,
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: stocks.length,
                itemBuilder: (context, index) {
                  final Stock stock = stocks[index];
                  return Container(
                    margin: EdgeInsets.symmetric(
                      vertical: sy(3),
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: sy(5),
                    ),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: AppColors.gray,
                        ),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          stock.symbol,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: sy(10),
                          ),
                        ),
                        SizedBox(
                          height: sy(2),
                        ),
                        Text(
                          stock.name,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: sy(9),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      );
    });
  }
}
