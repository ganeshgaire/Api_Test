import 'package:apitest/cartpage.dart';
import 'package:flutter/material.dart';

class ProductdetailPage extends StatefulWidget {
  String photo;
  String name;
  String description;
  String? price;

  ProductdetailPage(
      {Key? key,
      required this.photo,
      required this.name,
      required this.description,
      this.price})
      : super(key: key);

  @override
  State<ProductdetailPage> createState() => _ProductdetailPageState();
}

class _ProductdetailPageState extends State<ProductdetailPage> {
  int _itemcount = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        child: Column(
          children: [
            Expanded(
                child: ListView(
              children: [
                SizedBox(
                    height: 200,
                    width: double.infinity,
                    child: Image.network(
                      widget.photo,
                      fit: BoxFit.contain,
                    )),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  widget.name,
                  style: const TextStyle(fontSize: 20, color: Colors.black),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Rs.',
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.red,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      widget.price!,
                      style: const TextStyle(
                          fontSize: 24,
                          color: Colors.red,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.description,
                    style: const TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    const Text(
                      'Quantity',
                      style: TextStyle(fontSize: 22),
                    ),
                    _itemcount == 0
                        ? TextButton(
                            onPressed: () {
                              setState(() {
                                _itemcount = 0;
                              });
                            },
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Color.fromARGB(255, 239, 233, 233)),
                              child: Center(
                                child: const Text(
                                  '-',
                                  style: TextStyle(
                                      fontSize: 30, color: Colors.grey),
                                ),
                              ),
                            ),
                          )
                        : Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Color.fromARGB(255, 239, 233, 233)),
                            height: 40,
                            width: 40,
                            child: TextButton(
                              style: TextButton.styleFrom(),
                              onPressed: () {
                                setState(() {
                                  _itemcount = _itemcount - 1;
                                });
                              },
                              child: const Center(
                                child: Text(
                                  '-',
                                  style: TextStyle(
                                      fontSize: 30, color: Colors.grey),
                                ),
                              ),
                            ),
                          ),
                    Text(
                      _itemcount.toString(),
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Color.fromARGB(255, 239, 233, 233)),
                      height: 40,
                      width: 40,
                      child: TextButton(
                        style: TextButton.styleFrom(),
                        onPressed: () {
                          setState(() {
                            _itemcount = _itemcount + 1;
                          });
                        },
                        child: Text(
                          '+',
                          style: TextStyle(fontSize: 30, color: Colors.grey),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(fixedSize: Size(120, 40)),
                    child: const Text(
                      'Buy Now',
                      style: TextStyle(),
                    )),
                const SizedBox(
                  width: 30,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => CartPage()));
                    },
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(120, 40)),
                    child: const Text('Add to cart')),
              ],
            )
          ],
        ),
      )),
    );
  }
}
