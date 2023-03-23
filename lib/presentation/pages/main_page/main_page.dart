import 'package:flutter/material.dart';

import '../../../application/dot/result.dart';
import '../../service.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  TextEditingController controller = TextEditingController();
  List<Result>? object;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Country API'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              controller: controller,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Введите страну',
                  prefixIcon: Icon(Icons.location_city)),
              onFieldSubmitted: (country) {
                fetchToDto(country);
              },
            ),
          ),
          object != null
              ? Expanded(
                  child: ListView.builder(
                    itemCount: object!.length,
                    itemBuilder: (context, index) {
                      final item = object!.elementAt(index);
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          width: 300.0,
                          height: 80.0,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(3.0)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                item.name.name,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18.0,
                                    color: Colors.white),
                              ),
                              Text(
                                item.webPage.webPage,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                )
              : const Padding(
                  padding: EdgeInsets.only(top: 250.0),
                  child: Text(
                    'List empty input country',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.w600,
                        fontSize: 40.0),
                  ),
                )
        ],
      ),
    );
  }

  void fetchToDto(String country) async {
    final userData = await ServiceJson.fetchDataToDto(country);
    setState(
      () {
        object = List<Result>.from(userData);
      },
    );
  }
}
