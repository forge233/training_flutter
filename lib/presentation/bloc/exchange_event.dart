abstract class ExchangeEvent {}

class FetchData extends ExchangeEvent {}

class CurrencyVisibilityChanged extends ExchangeEvent {
  final int index;
  final bool isVisible;

  CurrencyVisibilityChanged(this.index, this.isVisible);
}

class CurrencyReordered extends ExchangeEvent {
  final int oldIndex;
  final int newIndex;

  CurrencyReordered(this.oldIndex, this.newIndex);
}
