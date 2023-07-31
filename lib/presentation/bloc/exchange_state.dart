import 'package:exchange_currency/application/dot/result.dart';

class ExchangeState {
  final List<Result> exchangeState;
  final List<bool> exchangeVisible;
  final List<String> exchangeReordered;

  ExchangeState({
    required this.exchangeState,
    required this.exchangeVisible,
    required this.exchangeReordered,
  });

  ExchangeState.initial()
      : exchangeState = [],
        exchangeVisible = [],
        exchangeReordered = [];

  ExchangeState copyWith({
    List<Result>? exchangeState,
    List<bool>? exchangeVisible,
    List<String>? exchangeReordered,
  }) {
    return ExchangeState(
      exchangeState: exchangeState ?? this.exchangeState,
      exchangeVisible: exchangeVisible ?? this.exchangeVisible,
      exchangeReordered: exchangeReordered ?? this.exchangeReordered,
    );
  }
}
