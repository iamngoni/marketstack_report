import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../core/models/app_exception.dart';
import '../../models/data/stock.dart';
import '../../models/repos/base/stocks_repository.dart';

part 'stocks_event.dart';
part 'stocks_state.dart';

class StocksBloc extends Bloc<StocksEvent, StocksState> {
  StocksBloc({required this.repository}) : super(StocksInitial()) {
    on<LoadStocks>(_loadStocks);
    on<FilterStocks>(_filterStocks);
  }

  Future<void> _loadStocks(
    LoadStocks event,
    Emitter<StocksState> emit,
  ) async {
    try {
      emit(StocksLoading());
      final Either<AppException, List<Stock>> response =
          await repository.getStocks();
      response.fold(
        (l) => emit(StocksException(l)),
        (r) => emit(StocksLoaded(stocks: r)),
      );
    } catch (e, stacktrace) {
      log(e.toString(), stackTrace: stacktrace);
      emit(StocksException(AppException(e.toString())));
    }
  }

  Future<void> _filterStocks(
    FilterStocks event,
    Emitter<StocksState> emit,
  ) async {
    try {
      final List<Stock> filteredStocks = (state as StocksLoaded)
          .stocks
          .where((Stock stock) =>
              stock.name.toLowerCase().contains(event.query.toLowerCase()) ||
              stock.symbol.toLowerCase().contains(event.query.toLowerCase()))
          .toList();
      final newState = (state as StocksLoaded).copyWith(filteredStocks);
      log(newState.toString());
      emit(newState);
    } catch (e, stacktrace) {
      log(e.toString(), stackTrace: stacktrace);
      emit(StocksException(AppException(e.toString())));
    }
  }

  final StocksRepository repository;
}
