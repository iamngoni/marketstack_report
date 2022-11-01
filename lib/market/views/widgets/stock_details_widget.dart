import 'package:candlesticks/candlesticks.dart';
import 'package:flutter/material.dart';
import 'package:handy_extensions/handy_extensions.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../../core/configs/app_colors.dart';
import '../../models/data/daily_data.dart';
import '../../models/data/stock_details.dart';

class StockDetailsWidget extends StatefulWidget {
  const StockDetailsWidget({
    super.key,
    required this.details,
  });

  final StockDetails details;

  @override
  State<StockDetailsWidget> createState() => _StockDetailsWidgetState();
}

class _StockDetailsWidgetState extends State<StockDetailsWidget> {
  String? selectedMonth;

  final List<String> months = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec"
  ];

  List<String> getMonths() {
    final List<String> months = [];

    for (final DailyData dailyData in widget.details.eod) {
      months.add(dailyData.date.getMonth);
    }

    final Set<String> monthsSet = months.toSet();

    return monthsSet.toList();
  }

  List<Candle> getCandles() {
    final List<Candle> candles = widget.details.eod
        .map(
          (DailyData dailyData) => Candle(
            date: dailyData.date,
            close: dailyData.close,
            high: dailyData.high,
            low: dailyData.low,
            open: dailyData.open,
            volume: dailyData.volume,
          ),
        )
        .toList();

    return candles;
  }

  List<DailyData> filteredDailyData() {
    if (selectedMonth == null) {
      return widget.details.eod;
    }

    return widget.details.eod
        .where(
          (DailyData dailyData) => dailyData.date.getMonth == selectedMonth,
        )
        .toList();
  }

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
                height: sy(20),
              ),
              Text(
                widget.details.symbol,
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
                widget.details.name,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: sy(9),
                ),
              ),
              const Divider(
                color: AppColors.gray,
              ),
              SizedBox(
                width: width,
                height: sy(180),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Candlesticks(
                    candles: getCandles(),
                  ),
                ),
              ),
              const Divider(
                color: AppColors.gray,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "Details",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: sy(10),
                      ),
                    ),
                  ),
                  DropdownButton<String>(
                    value: selectedMonth,
                    hint: Text(
                      "Month",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: sy(9),
                      ),
                    ),
                    items: getMonths()
                        .map<DropdownMenuItem<String>>((String month) {
                      return DropdownMenuItem(
                        value: month,
                        child: Text(
                          month,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: sy(9),
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? month) {
                      setState(() {
                        selectedMonth = month;
                      });
                    },
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: sy(9),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: filteredDailyData().length,
                  itemBuilder: (BuildContext context, int index) {
                    final DailyData dailyData = filteredDailyData()[index];
                    return ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        dailyData.date.readableDate,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: sy(9),
                        ),
                      ),
                      subtitle: Text(
                        "Open: ${dailyData.open.money.compactSymbolOnLeft} · "
                        "Close: ${dailyData.close.money.compactSymbolOnLeft} · "
                        "Low: ${dailyData.low.money.compactSymbolOnLeft} · "
                        "High: ${dailyData.high.money.compactSymbolOnLeft}",
                        style: TextStyle(
                          color: Colors.white70,
                          fontWeight: FontWeight.w400,
                          fontSize: sy(8),
                        ),
                      ),
                      trailing: Icon(
                        Icons.auto_graph_rounded,
                        color: Colors.white,
                        size: sy(12),
                      ),
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
