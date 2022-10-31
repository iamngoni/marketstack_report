import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../../core/configs/app_colors.dart';
import '../../models/data/daily_data.dart';
import '../../models/data/stock_details.dart';

class StockDetailsWidget extends StatelessWidget {
  const StockDetailsWidget({
    super.key,
    required this.details,
  });

  final StockDetails details;

  List<LineChartBarData> getLineChartBarData() {
    final LineChartBarData highData = LineChartBarData(
      spots: details.eod.map<FlSpot>((DailyData dailyData) {
        return FlSpot(dailyData.date.month.toDouble(), dailyData.high);
      }).toList(),
      color: AppColors.success,
      dotData: FlDotData(
        show: false,
      ),
    );

    final LineChartBarData lowData = LineChartBarData(
      spots: details.eod.map<FlSpot>((DailyData dailyData) {
        return FlSpot(dailyData.date.month.toDouble(), dailyData.low);
      }).toList(),
      color: AppColors.warning,
      dotData: FlDotData(
        show: false,
      ),
    );
    return [highData, lowData];
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
                details.symbol,
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
                details.name,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: sy(9),
                ),
              ),
              SizedBox(
                height: sy(30),
              ),
              SizedBox(
                width: width,
                height: sy(150),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: LineChart(
                    LineChartData(
                      lineBarsData: getLineChartBarData(),
                      gridData: FlGridData(
                        drawHorizontalLine: true,
                        drawVerticalLine: true,
                      ),
                    ),
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
