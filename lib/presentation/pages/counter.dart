import 'package:flutter/material.dart';
import 'package:forms_task/application/provider/provide.dart';
import 'package:forms_task/application/storage/storage.dart';
import 'package:provider/provider.dart';

class CounterData extends StatefulWidget {
  const CounterData({super.key, required this.count});

  final int count;

  @override
  State<CounterData> createState() => _CounterDataState();
}

class _CounterDataState extends State<CounterData> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Future<void> didChangeDependencies() async {
    final count = await DeviceStorage.getValue();
    print(count.toString());
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              Provider.of<ProviderOfCounter>(context).getCountPlus.toString(),
              style: const TextStyle(color: Colors.white, fontSize: 30.0),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: () {
                        DeviceStorage.setValue(widget.count);
                        Provider.of<ProviderOfCounter>(context, listen: false)
                            .plus();
                      },
                      child: const Text('+')),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: () {
                        DeviceStorage.setValue(widget.count);
                        Provider.of<ProviderOfCounter>(context, listen: false)
                            .minus();
                      },
                      child: const Text('-')),
                ),
              ],
            ),
            const Text('-')
          ],
        ),
      ),
    );
  }
}
