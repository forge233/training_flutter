import 'package:exchange_currency/presentation/bloc/exchange_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:exchange_currency/presentation/pages/home_page/home_page.dart';

import '../presentation/bloc/exchange_event.dart';

class App extends StatelessWidget {
  const App({Key? key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        final exchangeBloc = ExchangeBloc();
        exchangeBloc.add(CurrencyLoadDataVisibility());
        return exchangeBloc;
      },
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
