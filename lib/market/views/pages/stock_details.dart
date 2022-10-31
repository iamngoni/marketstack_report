import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/stock_details/stock_details_bloc.dart';
import '../../models/data/stock.dart';

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
    return Container();
  }
}
