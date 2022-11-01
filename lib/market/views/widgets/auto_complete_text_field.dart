import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../blocs/stocks/stocks_bloc.dart';
import '../../models/data/stock.dart';

class AutoCompleteTextField extends StatelessWidget {
  const AutoCompleteTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return SizedBox(
          width: width,
          child: BlocSelector<StocksBloc, StocksState, StocksLoaded>(
            selector: (state) {
              return state as StocksLoaded;
            },
            builder: (context, state) {
              return Autocomplete(
                optionsBuilder: (TextEditingValue textEditingValue) {
                  if (textEditingValue.text.isEmpty) {
                    return const Iterable<String>.empty();
                  } else {
                    final List<Stock> matches = state.stocks
                      ..retainWhere((Stock stock) {
                        return stock.name.toLowerCase().contains(
                                  textEditingValue.text.toLowerCase(),
                                ) ||
                            stock.symbol
                                .toLowerCase()
                                .contains(textEditingValue.text.toLowerCase());
                      });
                    return matches.map((Stock stock) => stock.name).toList();
                  }
                },
              );
            },
          ),
        );
      },
    );
  }
}
