import 'dart:convert';

import 'package:apitest/productmodel.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'productpage.dart';

class DataFromApi extends StatefulWidget {
  const DataFromApi({Key? key}) : super(key: key);

  @override
  State<DataFromApi> createState() => _DataFromApiState();
}

class _DataFromApiState extends State<DataFromApi> {
  List<Product> detail = [];
  Future getDatafromApi() async {
    detail = [];
    var response = await http.get(
        Uri.parse('https://saara24shopping.com/api/ecommerce/products/all'));
    final data = jsonDecode(response.body)["data"];

    for (var u in data) {
      detail.add(Product.fromJson(u));
    }
    return detail;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('User Data')),
      ),
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: getDatafromApi(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    //print(snapshot.data.length);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProductdetailPage(
                                  photo: snapshot.data[index].image,
                                  description: snapshot.data[index].description,
                                  name: snapshot.data[index].productName,
                                  price: snapshot.data[index].price,
                                )));
                  },
                  child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      elevation: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              height: 150,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          snapshot.data[index].image))),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Flexible(
                                child: Text(
                              snapshot.data[index].productName,
                              maxLines: 3,
                              style:
                                  const TextStyle(fontWeight: FontWeight.w500),
                            )),
                            const SizedBox(
                              height: 6,
                            ),
                            Row(
                              children: [
                                const Text(
                                  'Rs.',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                Text(
                                  snapshot.data[index].price,
                                  style: const TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )),
                );
              },
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 300, childAspectRatio: 0.7),
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
