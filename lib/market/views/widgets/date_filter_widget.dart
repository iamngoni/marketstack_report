import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handy_extensions/handy_extensions.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../../core/configs/app_colors.dart';
import '../../blocs/stock_details/stock_details_bloc.dart';
import '../../models/data/stock.dart';

class DateFilterWidget extends StatefulWidget {
  const DateFilterWidget({super.key, required this.stock});

  final Stock stock;

  @override
  State<DateFilterWidget> createState() => _DateFilterWidgetState();
}

class _DateFilterWidgetState extends State<DateFilterWidget> {
  DateTime? startDate;

  DateTime? endDate;

  Future<void> pickStartDate() async {
    final DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(
        const Duration(days: 720),
      ),
      lastDate: DateTime.now(),
    );

    if (date != null) {
      setState(() {
        startDate = date;
      });
    }
  }

  Future<void> pickEndDate() async {
    final DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(
        const Duration(days: 720),
      ),
      lastDate: DateTime.now(),
    );
    if (date != null) {
      setState(() {
        endDate = date;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: sx(20),
            vertical: sy(10),
          ),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 1,
                offset: const Offset(1, 1),
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: pickStartDate,
                  child: Text(
                    startDate != null
                        ? "${startDate?.readableDate}"
                        : "Start Date",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: sy(9),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                width: sx(10),
              ),
              Container(
                height: sy(10),
                width: sx(2),
                color: Colors.white,
              ),
              SizedBox(
                width: sx(10),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: pickEndDate,
                  child: Text(
                    endDate != null ? "${endDate?.readableDate}" : "End Date",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: sy(9),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Container(
                height: sy(10),
                width: sx(2),
                color: Colors.white,
              ),
              SizedBox(
                width: sx(10),
              ),
              InkWell(
                onTap: () {
                  if (startDate != null && endDate != null) {
                    if (startDate!.isAfter(endDate!)) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            "Start date cannot be after end date",
                          ),
                          backgroundColor: AppColors.critical,
                        ),
                      );
                      return;
                    }
                    BlocProvider.of<StockDetailsBloc>(context).add(
                      LoadStockDetails(
                        widget.stock,
                        from: startDate,
                        to: endDate,
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          "Select all dates",
                        ),
                        backgroundColor: AppColors.critical,
                      ),
                    );
                  }
                },
                child: const Icon(
                  Icons.filter_list_alt,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
