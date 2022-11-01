import 'package:fl_chart/fl_chart.dart';
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

  List<LineChartBarData> getLineChartBarData() {
    final LineChartBarData highData = LineChartBarData(
      spots: widget.details.eod.map<FlSpot>((DailyData dailyData) {
        return FlSpot(dailyData.date.month.toDouble(), dailyData.high);
      }).toList(),
      color: AppColors.success,
      barWidth: 3,
      isStrokeCapRound: true,
      dotData: FlDotData(
        show: false,
      ),
    );

    final LineChartBarData lowData = LineChartBarData(
      spots: widget.details.eod.map<FlSpot>((DailyData dailyData) {
        return FlSpot(dailyData.date.month.toDouble(), dailyData.low);
      }).toList(),
      color: AppColors.warning,
      barWidth: 3,
      isStrokeCapRound: true,
      dotData: FlDotData(
        show: false,
      ),
    );

    final LineChartBarData openData = LineChartBarData(
      spots: widget.details.eod.map<FlSpot>((DailyData dailyData) {
        return FlSpot(dailyData.date.month.toDouble(), dailyData.open);
      }).toList(),
      color: AppColors.critical,
      barWidth: 3,
      isStrokeCapRound: true,
      dotData: FlDotData(
        show: false,
      ),
    );

    final LineChartBarData closeData = LineChartBarData(
      spots: widget.details.eod.map<FlSpot>((DailyData dailyData) {
        return FlSpot(dailyData.date.month.toDouble(), dailyData.close);
      }).toList(),
      color: AppColors.interaction,
      barWidth: 3,
      isStrokeCapRound: true,
      dotData: FlDotData(
        show: false,
      ),
    );

    return [highData, lowData, openData, closeData];
  }

  List<String> getMonths() {
    final List<String> months = [];

    for (final DailyData dailyData in widget.details.eod) {
      months.add(dailyData.date.getMonth);
    }

    final Set<String> monthsSet = months.toSet();

    return monthsSet.toList();
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
              SizedBox(
                height: sy(10),
              ),
              const Divider(
                color: AppColors.gray,
              ),
              SizedBox(
                height: sy(10),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Container(
                        height: sy(8),
                        width: sy(8),
                        decoration: const BoxDecoration(
                          color: AppColors.interaction,
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(
                        width: sx(10),
                      ),
                      Text(
                        "Close",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: sy(9),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: sx(10),
                  ),
                  Row(
                    children: [
                      Container(
                        height: sy(8),
                        width: sy(8),
                        decoration: const BoxDecoration(
                          color: AppColors.critical,
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(
                        width: sx(10),
                      ),
                      Text(
                        "Open",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: sy(9),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: sx(10),
                  ),
                  Row(
                    children: [
                      Container(
                        height: sy(8),
                        width: sy(8),
                        decoration: const BoxDecoration(
                          color: AppColors.success,
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(
                        width: sx(10),
                      ),
                      Text(
                        "High",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: sy(9),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: sx(10),
                  ),
                  Row(
                    children: [
                      Container(
                        height: sy(8),
                        width: sy(8),
                        decoration: const BoxDecoration(
                          color: AppColors.warning,
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(
                        width: sx(10),
                      ),
                      Text(
                        "Low",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: sy(9),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: sy(15),
              ),
              SizedBox(
                width: width,
                height: sy(150),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: LineChart(
                    LineChartData(
                      lineBarsData: getLineChartBarData(),
                      backgroundColor: Colors.black,
                      gridData: FlGridData(
                        drawHorizontalLine: true,
                        drawVerticalLine: true,
                      ),
                      titlesData: FlTitlesData(
                        show: true,
                        leftTitles: AxisTitles(
                          axisNameWidget: Text(
                            "Amount",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: sy(10),
                            ),
                          ),
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: sx(70),
                            getTitlesWidget:
                                (double reservedSize, TitleMeta titleMeta) {
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: sx(10),
                                ),
                                child: Text(
                                  titleMeta.formattedValue,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: sy(7),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        rightTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: false,
                          ),
                        ),
                        topTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: false,
                          ),
                        ),
                        bottomTitles: AxisTitles(
                          axisNameWidget: Text(
                            "Period (in months)",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: sy(10),
                            ),
                          ),
                          sideTitles: SideTitles(
                            showTitles: true,
                            getTitlesWidget:
                                (double reservedSize, TitleMeta titleMeta) {
                              final int value =
                                  double.parse(titleMeta.formattedValue)
                                      .round();
                              return Text(
                                months[value],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: sy(7),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: sy(10),
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
