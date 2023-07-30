import 'package:bloc/bloc.dart';
import 'package:exchange_currency/application/dot/result.dart';

import 'package:exchange_currency/presentation/service.dart';
import '../../application/storage/storage.dart';
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
    List<bool> currencyVisibility =
        await DeviceStorage.loadCurrencyVisibility();
    List<String> reorderCurrency = await DeviceStorage.loadCurrencyOrder();
    print("Loaded currency order: $reorderCurrency");
    List<bool> initialVisible = currencyVisibility.isNotEmpty
        ? currencyVisibility
        : List<bool>.filled(fetchedResults.length, true);

    emit(state.copyWith(
      exchangeState: fetchedResults,
      exchangeVisible: initialVisible,
      exchangeReordered: reorderCurrency,
    ));
  }

  void _handleCurrencyVisibilityChanged(
    CurrencyVisibilityChanged event,
    Emitter<ExchangeState> emit,
  ) {
    final isVisible = state.exchangeVisible.toList();
    isVisible[event.index] = event.isVisible;
    DeviceStorage.saveCurrencyVisibility(isVisible);
    emit(state.copyWith(exchangeVisible: isVisible));
  }

  void _handleCurrencyReordered(
      CurrencyReordered event,
      Emitter<ExchangeState> emit,
      ) {
    if (event.oldIndex == event.newIndex ||
        state.exchangeState.isEmpty ||
        event.oldIndex >= state.exchangeState.length ||
        event.newIndex >= state.exchangeState.length) {
      return;
    }

    List<Result> updatedCurrencies = List<Result>.from(state.exchangeState);
    List<bool> updatedVisibility = List<bool>.from(state.exchangeVisible);

    if (event.oldIndex >= 0 &&
        event.oldIndex < updatedCurrencies.length &&
        event.newIndex >= 0 &&
        event.newIndex < updatedCurrencies.length) {
      final currency = updatedCurrencies.removeAt(event.oldIndex);
      updatedCurrencies.insert(event.newIndex, currency);

      final isVisible = updatedVisibility.removeAt(event.oldIndex);
      updatedVisibility.insert(event.newIndex, isVisible);

      List<String> currencyOrder =
      updatedCurrencies.map((result) => result.currencyData.cc).toList();
      print("Currency order to save: $currencyOrder");

      DeviceStorage.saveCurrencyOrder(currencyOrder);

      emit(state.copyWith(
        exchangeState: updatedCurrencies,
        exchangeVisible: updatedVisibility,
        exchangeReordered: currencyOrder,
      ));
    }
  }

}
