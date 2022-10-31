import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../../core/models/app_exception.dart';
import '../../blocs/stock_details/stock_details_bloc.dart';
import '../../models/data/stock.dart';

class StockDetailsExceptionWidget extends StatelessWidget {
  const StockDetailsExceptionWidget({
    super.key,
    required this.stock,
    required this.exception,
  });

  final Stock stock;
  final AppException exception;

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Container(
          height: height,
          width: width,
          padding: EdgeInsets.symmetric(
            horizontal: sx(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.running_with_errors_rounded,
                color: Colors.white,
                size: sy(30),
              ),
              SizedBox(
                height: sy(10),
              ),
              Text(
                exception.title,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: sy(12),
                ),
              ),
              SizedBox(
                height: sy(3),
              ),
              Text(
                exception.message,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: sy(9.5),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: sy(20),
              ),
              GestureDetector(
                onTap: () {
                  BlocProvider.of<StockDetailsBloc>(context)
                      .add(LoadStockDetails(stock));
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: sy(10),
                    horizontal: sx(10),
                  ),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "RETRY",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: sy(10),
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
