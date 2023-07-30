import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:exchange_currency/application/dot/result.dart';
import 'package:exchange_currency/presentation/bloc/exchange_bloc.dart';
import 'package:exchange_currency/presentation/bloc/exchange_event.dart';
import 'package:exchange_currency/presentation/bloc/exchange_state.dart';
import '../setting_page/setting_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ExchangeBloc>(context).add(FetchData());
  }


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExchangeBloc, ExchangeState>(
      builder: (BuildContext context, state) {
        print("State: $state");
        print("exchangeState: ${state.exchangeState}");
        print("exchangeVisible: ${state.exchangeVisible}");
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.grey,
            title: const Text(
              'Курс валют',
              style: TextStyle(fontWeight: FontWeight.w200),
            ),
            centerTitle: true,
            iconTheme: const IconThemeData(color: Colors.white),
            actions: [
              IconButton(
                onPressed: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SettingPage(
                        currencies: state.exchangeState,
                        currencyVisibility: state.exchangeVisible,
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.settings, color: Colors.white),
              )
            ],
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (state.exchangeState.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      state.exchangeState.first.currencyData.exchangedate,
                      style: const TextStyle(color: Colors.black, fontSize: 15),
                    ),
                  ),
                ),
              Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: state.exchangeVisible.length,
                  itemBuilder: (context, index) {
                    Result result = state.exchangeState[index];
                    bool isVisible = state.exchangeVisible[index];
                    if (!isVisible) {
                      return const SizedBox();
                    }
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            result.currencyData.cc,
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Column(
                                children: [
                                  Text(result.currencyData.txt),
                                ],
                              ),
                              Expanded(
                                child: Text(result.currencyData.rate.toString(),
                                    textAlign: TextAlign.right),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
