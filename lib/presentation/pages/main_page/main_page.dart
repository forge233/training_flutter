import 'package:api_makeup/presentation/navigation/model_arguments/model_arguments.dart';
import 'package:api_makeup/presentation/navigation/routes.dart';
import 'package:api_makeup/presentation/pages/service.dart';
import 'package:flutter/material.dart';
import 'package:api_makeup/application/dot/result.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  TextEditingController controller = TextEditingController();
  List<Result>? product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: const Text('Make Up'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: TextFormField(
              controller: controller,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter product',
                  prefixIcon: Icon(Icons.production_quantity_limits)),
              onFieldSubmitted: (brand) {
                fetchToDto(brand);
              },
            ),
          ),
          product != null
              ? Expanded(
                  child: GridView.builder(
                    itemCount: product!.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.5,
                    ),
                    itemBuilder: (context, index) {
                      final item = product!.elementAt(index);
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width / 2,
                          child: Column(
                            children: [
                              Hero(
                                tag: index,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      AppRoutes.detailPage,
                                      arguments: SecondPageArguments(
                                          apiFeaturedImage:
                                              item.apiFeaturedImage,
                                          description: item.description),
                                    );
                                  },
                                  child: Image.network(
                                    'http:${item.apiFeaturedImage.apiFeaturedImage}',
                                    height: 280.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 4.0),
                              Container(
                                width: MediaQuery.of(context).size.width / 2,
                                height: 100.0,
                                decoration: BoxDecoration(
                                    color: Colors.black54,
                                    borderRadius: BorderRadius.circular(3.0)),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        item.name.name,
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 12.0),
                                      child: Container(
                                        width: 50.0,
                                        height: 20.0,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                        ),
                                        child: Center(
                                          child: Text(
                                            '${item.price.price}\$',
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                )
              : const Text('Empty screen')
        ],
      ),
    );
  }

  void fetchToDto(String brand) async {
    product = await ServiceJson.fetchDataToDto(brand);
    setState(() {});
  }
}
