import 'package:flutter/material.dart';

import '../../dto/results.dart';
import '../../services/services.dart';

class ApiPage extends StatefulWidget {
  const ApiPage({super.key});

  @override
  State<ApiPage> createState() => _ApiPageState();
}

class _ApiPageState extends State<ApiPage> {
  Result? person;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Api Practice'),
        centerTitle: true,
      ),
      body: Center(
        child: person != null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(person!.picture.large),
                  const SizedBox(
                    height: 8.0
                  ),
                  Text(
                    ' ${person?.name.title} ${person?.name.first} ${person?.name.last}',
                    style: const TextStyle(
                        fontSize: 21.0, fontWeight: FontWeight.w600),
                  ),
                ],
              )
            : const Text(
                'Tap person icon for load',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 21.0),
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          fetchUserData();
        },
        child: const Icon(Icons.person),
      ),
    );
  }

  void fetchUserData() async {
    final userData = await PersonService.fetchDataToDto();
    person = userData.results.first;
    setState(() {
    });
  }
}
