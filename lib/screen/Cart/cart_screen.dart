import 'package:flutter/material.dart';
import 'package:styleon_app/utils/global.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back_outlined,color: Colors.black,),
                  backgroundColor: Colors.white,
                ),
                Text("My cart",style: TextStyle(fontSize: 25),),
                FloatingActionButton(onPressed: () {
                  Navigator.pop(context);
                },child: Icon(Icons.menu,color: Colors.black,),
                backgroundColor: Colors.white,)
              ],
            ),
          ),
          Padding(
            padding:  EdgeInsets.all(8.0),
            child: Container(
              height: 120,
              width: MediaQuery.sizeOf(context).width,
              color: Colors.grey.shade600,
              child: Column(
                children: List.generate(cartList.length, (index) =>  Row(
                  children: [
                    Image(image: AssetImage("${cartList[index]['image']}"),width: 80,),
                    Text("₹${cartList[index]['price']}")
                  ],
                ),)
              ),
            ),
          )
        ],
      ),
    ));
  }
}
