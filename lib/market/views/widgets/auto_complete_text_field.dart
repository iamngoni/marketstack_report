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
        return Container(
          width: width,
          padding: EdgeInsets.symmetric(
            horizontal: sx(20),
          ),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
          ),
          child: BlocSelector<StocksBloc, StocksState, StocksLoaded>(
            selector: (state) {
              return state as StocksLoaded;
            },
            builder: (context, state) {
              return Row(
                children: [
                  const Icon(Icons.search, color: Colors.white),
                  SizedBox(
                    width: sx(10),
                  ),
                  Expanded(
                    child: Autocomplete(
                      fieldViewBuilder: (
                        context,
                        textEditingController,
                        focusNode,
                        onFieldSubmitted,
                      ) =>
                          TextFormField(
                        controller: textEditingController,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: sy(9),
                        ),
                        decoration: InputDecoration(
                          hintText: "Looking for specific company?",
                          hintStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: sy(9),
                          ),
                          border: InputBorder.none,
                        ),
                        focusNode: focusNode,
                        onFieldSubmitted: (String value) {
                          onFieldSubmitted();
                        },
                      ),
                      optionsBuilder: (TextEditingValue textEditingValue) {
                        BlocProvider.of<StocksBloc>(context)
                            .add(FilterStocks(textEditingValue.text));
                        if (textEditingValue.text.isEmpty) {
                          return const Iterable<String>.empty();
                        } else {
                          final List<Stock> matches = [...state.stocks]
                            ..retainWhere((Stock stock) {
                              return stock.name.toLowerCase().contains(
                                        textEditingValue.text.toLowerCase(),
                                      ) ||
                                  stock.symbol.toLowerCase().contains(
                                        textEditingValue.text.toLowerCase(),
                                      );
                            });
                          return matches
                              .map((Stock stock) => stock.name)
                              .toList();
                        }
                      },
                      optionsViewBuilder: (
                        BuildContext context,
                        AutocompleteOnSelected<String> onSelected,
                        Iterable<String> options,
                      ) {
                        return Align(
                          alignment: Alignment.topLeft,
                          child: Material(
                            elevation: 4,
                            child: SizedBox(
                              height: sy(150),
                              width: sx(400),
                              child: ListView.builder(
                                padding: const EdgeInsets.all(8),
                                itemCount: options.length,
                                itemBuilder: (BuildContext context, int index) {
                                  final String option =
                                      options.elementAt(index);
                                  return GestureDetector(
                                    onTap: () {
                                      onSelected(option);
                                    },
                                    child: ListTile(
                                      title: Text(
                                        option,
                                        style: TextStyle(
                                          fontSize: sy(9),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
