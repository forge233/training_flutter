import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../application/dot/result.dart';
import '../../bloc/exchange_bloc.dart';
import '../../bloc/exchange_event.dart';
import '../../bloc/exchange_state.dart';
import '../setting_page/setting_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Result> results = [];
  List<bool> currencyVisibility = [];
  String commonDate = '';

  @override
  void initState() {
    super.initState();
    BlocProvider.of<ExchangeBloc>(context).add(FetchData());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExchangeBloc, ExchangeState>(
      builder: (BuildContext context, state) {
        results = state.exchangeState;
        if (currencyVisibility.isEmpty) {
          currencyVisibility = List<bool>.filled(results.length, true);
        }
        if (results.isNotEmpty) {
          commonDate = results[0].currencyData.exchangedate;
        }
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
                  final updatedVisibility = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SettingPage(
                        currencies: results,
                        currencyVisibility: currencyVisibility,
                      ),
                    ),
                  );
                  if (updatedVisibility != null) {
                    setState(() {
                      currencyVisibility = updatedVisibility;
                    });
                  }
                },
                icon: const Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
              )
            ],
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    commonDate,
                    style: const TextStyle(color: Colors.black, fontSize: 15),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: results.length,
                  itemBuilder: (context, index) {
                    Result result = results[index];
                    bool isVisible = currencyVisibility[index];
                    if (!isVisible) {
                      return const Center(
                          child:
                              CircularProgressIndicator(color: Colors.black));
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
