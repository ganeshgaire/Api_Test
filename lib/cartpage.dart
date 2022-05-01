import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.only(top: 10, left: 8),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  child: Text(
                    'My Carts',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 2),
                child: Container(
                  color: Colors.black,
                  height: 1,
                  width: double.infinity,
                ),
              ),
              Container(
                color: Colors.amber,
                width: double.infinity,
                height: 200,
                child: Row(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10, left: 10),
                          child: Container(
                            height: 130,
                            width: 90,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://www.kindpng.com/picc/m/289-2890345_ichiban-ramen-chow-mein-hd-png-download.png'),
                                  fit: BoxFit.cover),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: const [
                            Icon(Icons.favorite_outline),
                            SizedBox(
                              width: 25,
                            ),
                            Icon(Icons.delete_outline)
                          ],
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 20),
                      child: Column(
                        children: const [
                          Text(
                            'Ramin Chau Chau',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
