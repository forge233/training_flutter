import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:exchange_currency/application/dot/result.dart';
import 'package:exchange_currency/presentation/bloc/exchange_bloc.dart';
import 'package:exchange_currency/presentation/bloc/exchange_event.dart';
import 'package:exchange_currency/presentation/bloc/exchange_state.dart';

class SettingPage extends StatefulWidget {
  final List<Result> currencies;
  final List<bool> currencyVisibility;

  const SettingPage({
    Key? key,
    required this.currencies,
    required this.currencyVisibility,
  }) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
          title: const Text(
            'Налаштування',
            style: TextStyle(fontWeight: FontWeight.w200),
          ),
          centerTitle: true,
        ),
        body: BlocBuilder<ExchangeBloc, ExchangeState>(
          builder: (context, state) {
            return ReorderableListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.exchangeVisible.length,
              itemBuilder: (context, index) {
                final currency = state.exchangeState[index];
                final isVisible = state.exchangeVisible[index];
                return Padding(
                  key: ValueKey(currency.currencyData.cc),
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            currency.currencyData.cc,
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Spacer(),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Switch(
                              activeColor: Colors.green,
                              value: isVisible,
                              onChanged: (newValue) {
                                _toggleCurrencyVisibility(
                                    context, index, newValue);
                              },
                            ),
                          ),
                          ReorderableDragStartListener(
                            index: index,
                            child: const Icon(Icons.list),
                          ),
                        ],
                      ),
                      Text(currency.currencyData.txt),
                    ],
                  ),
                );
              },
              onReorder: (oldIndex, newIndex) {
                _handleCurrencyReordered(context, oldIndex, newIndex);
              },
            );
          },
        ),
      ),
    );
  }

  void _toggleCurrencyVisibility(
      BuildContext context, int index, bool isVisible) {
    context.read<ExchangeBloc>().add(
          CurrencyVisibilityChanged(index, isVisible),
        );
  }

  void _handleCurrencyReordered(
      BuildContext context, int oldIndex, int newIndex) async {
    print("Reordering: $oldIndex -> $newIndex");
    context.read<ExchangeBloc>().add(
          CurrencyReordered(
              oldIndex, newIndex > oldIndex ? newIndex - 1 : newIndex),
        );
  }
}
