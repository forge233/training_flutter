import 'package:exchange_currency/application/dot/result.dart';

class ExchangeState {
  final List<Result> exchangeState;
  final bool exchangeVisible;

  ExchangeState({
    required this.exchangeState,
    required this.exchangeVisible,
  });

  ExchangeState.initial()
      : exchangeState = [],
        exchangeVisible = true;

  ExchangeState copyWith({
    List<Result>? exchangeState,
    bool? exchangeVisible,
  }) {
    return ExchangeState(
      exchangeState: exchangeState ?? this.exchangeState,
      exchangeVisible: exchangeVisible ?? this.exchangeVisible,
    );
  }
}
