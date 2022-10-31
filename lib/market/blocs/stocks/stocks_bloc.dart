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
        (r) => emit(StocksLoaded(r)),
      );
    } catch (e, stacktrace) {
      log(e.toString(), stackTrace: stacktrace);
      emit(StocksException(AppException(e.toString())));
    }
  }

  final StocksRepository repository;
}
