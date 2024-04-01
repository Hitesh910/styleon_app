import 'package:flutter/material.dart';
import 'package:styleon_app/utils/global.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    Map m1 = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      backgroundColor: const Color(0xfffcfcfc),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(children: [
            Container(
              height: 450,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(38),
                      bottomRight: Radius.circular(38))),
              child: Image.asset("${m1['image']}"),
            ),
          ]),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Text(
                  "size :",
                  style: TextStyle(fontSize: 32),
                ),
                const SizedBox(
                  width: 40,
                ),
                Container(
                  height: 35,
                  width: 35,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300, shape: BoxShape.circle),
                  child: const Text(
                    "S",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Container(
                  height: 35,
                  width: 35,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                      color: Colors.amber, shape: BoxShape.circle),
                  child: const Text(
                    "M",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Container(
                  height: 35,
                  width: 35,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300, shape: BoxShape.circle),
                  child: const Text(
                    "L",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Container(
                  height: 35,
                  width: 35,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300, shape: BoxShape.circle),
                  child: const Text(
                    "XL",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${m1['name']}",
                  style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Text(
                  "₹${m1['price']}",
                  style: const TextStyle(fontSize: 35),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              "DAMENSCH Mens Regular Fit Cotton Blend Full Sleeve Statement "
              "Elemental Hoodies | Hoodies for Men, Hoodies for Boys,Hoodie for Men,Travel Hoodies for Men-Pack "
              "of 1-Charcoal Dust-XL",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FloatingActionButton.extended(
                  onPressed: () {
                    cartList.add(m1);
                    Navigator.pop(context);
                  },
                  label: const Text("Add to cart"),
                  icon: const Icon(Icons.shopping_cart),
                  backgroundColor: const Color(0xffe7961a),
                ),
                Container(
                    height: 50,
                    width: 150,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(color: const Color(0xff1e1e2d),borderRadius: BorderRadius.circular(15)),
                    child: const Text("Buy Now",style: TextStyle(color: Colors.white,fontSize: 22),))
              ],
            ),
          )
        ],
      ),
    );
  }
}
