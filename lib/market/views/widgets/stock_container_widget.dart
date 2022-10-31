import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../../core/configs/app_colors.dart';
import '../../blocs/stock_details/stock_details_bloc.dart';
import '../../models/data/stock.dart';
import '../../models/repos/impl/istocks_repository.dart';
import '../pages/stock_details.dart';

class StockContainerWidget extends StatelessWidget {
  const StockContainerWidget({
    super.key,
    required this.stock,
  });

  final Stock stock;

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
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
          child: Row(
            children: [
              Expanded(
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
              ),
              Image(
                image: const AssetImage("assets/images/graph.png"),
                height: sy(15),
              ),
              SizedBox(
                width: sx(20),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => BlocProvider(
                        create: (_) => StockDetailsBloc(
                          repository: StocksRepositoryImpl(),
                        )..add(LoadStockDetails(stock)),
                        child: StockDetailsPage(
                          stock: stock,
                        ),
                      ),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(5),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.arrow_forward_rounded,
                    color: Colors.white,
                    size: sy(10),
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
