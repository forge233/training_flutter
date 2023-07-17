import 'package:bloc/bloc.dart';
import 'package:exchange_currency/application/dot/result.dart';

import '../service.dart';
import 'exchange_event.dart';
import 'exchange_state.dart';

class ExchangeBloc extends Bloc<ExchangeEvent, ExchangeState> {
  ExchangeBloc() : super(ExchangeState.initial()) {
    on<FetchData>(_fetchExchangeCurrencyData);
    on<CurrencyVisibilityChanged>(_handleCurrencyVisibilityChanged);
    on<CurrencyReordered>(_handleCurrencyReordered);
  }

  void _fetchExchangeCurrencyData(
      FetchData event, Emitter<ExchangeState> emit) async {
    List<Result> fetchedResults = await ServiceJson.fetchDataToDto();
    emit(state.copyWith(exchangeState: fetchedResults));
  }

  void _handleCurrencyVisibilityChanged(
      CurrencyVisibilityChanged event, Emitter<ExchangeState> emit) {
    bool updatedVisibility = event.isVisible;
    print(updatedVisibility);
    emit(state.copyWith(exchangeVisible: updatedVisibility));
  }

  void _handleCurrencyReordered(
      CurrencyReordered event, Emitter<ExchangeState> emit) {
    if (event.oldIndex == event.newIndex) {
      return;
    }

    List<Result> updatedCurrencies = List<Result>.from(state.exchangeState);
    bool updatedVisibility = state.exchangeVisible;

    if (event.oldIndex >= 0 &&
        event.oldIndex < updatedCurrencies.length &&
        event.newIndex >= 0 &&
        event.newIndex < updatedCurrencies.length) {
      final currency = updatedCurrencies.removeAt(event.oldIndex);
      updatedCurrencies.insert(event.newIndex, currency);
    }

    emit(state.copyWith(
      exchangeState: updatedCurrencies,
      exchangeVisible: updatedVisibility,
    ));
  }
}
