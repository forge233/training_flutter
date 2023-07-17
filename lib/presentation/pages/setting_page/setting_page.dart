import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../application/dot/result.dart';
import '../../bloc/exchange_bloc.dart';
import '../../bloc/exchange_event.dart';
import '../../bloc/exchange_state.dart';

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
  List<Result> currencies = [];
  List<bool> currencyVisibility = [];

  @override
  void initState() {
    super.initState();
    currencies = List.from(widget.currencies);
    currencyVisibility = List.from(widget.currencyVisibility);
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
              itemCount: currencies.length,
              itemBuilder: (context, index) {
                final currency = currencies[index];
                final isVisible = currencyVisibility[index];

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
                                  context,
                                  index,
                                  newValue,
                                );
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
                _handleCurrencyReorder(context, oldIndex, newIndex);
              },
            );
          },
        ),
      ),
    );
  }

  void _toggleCurrencyVisibility(
      BuildContext context,
      int index,
      bool isVisible,
      ) {
    context.read<ExchangeBloc>().add(
      CurrencyVisibilityChanged(index, isVisible),
    );

    setState(() {
      currencyVisibility = List.from(currencyVisibility);
      currencyVisibility[index] = isVisible;
    });
  }

  void _handleCurrencyReorder(
      BuildContext context,
      int oldIndex,
      int newIndex,
      ) {
    setState(() {
      final currency = currencies.removeAt(oldIndex);
      currencies.insert(newIndex > oldIndex ? newIndex - 1 : newIndex, currency);

      final visibility = currencyVisibility.removeAt(oldIndex);
      currencyVisibility.insert(newIndex > oldIndex ? newIndex - 1 : newIndex, visibility);
    });

    context.read<ExchangeBloc>().add(
      CurrencyReordered(oldIndex, newIndex > oldIndex ? newIndex - 1 : newIndex),
    );
  }
}
