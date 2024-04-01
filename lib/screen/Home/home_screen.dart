import 'package:flutter/material.dart';
import 'package:styleon_app/screen/Cart/cart_screen.dart';
import 'package:styleon_app/screen/Product/product_screen.dart';
import 'package:styleon_app/utils/global.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 bool isHoodie=true,isShirt =true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff8f8f8),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(22),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "StyleOn",
                    style: TextStyle(fontSize: 40, color: Colors.black),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'cart',arguments: CartScreen());
                    },
                    backgroundColor: Colors.white,
                    child: const Icon(
                      Icons.shopping_bag,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                width: MediaQuery
                    .sizeOf(context)
                    .width,
                decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Search",
                        style:
                        TextStyle(color: Colors.grey.shade600, fontSize: 20),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Icon(Icons.search)
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                    "https://assets.indiadesire.com/images/Flipkart%20Big%20End%20Of%20Season%20Sale%20june%202023.jpg"),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          isHoodie = true;
                          isShirt = true;
                        });
                      },
                      child: Container(
                        height: 45,
                        width: 60,
                        //margin: EdgeInsets.all(5),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.green.shade400,
                            borderRadius: BorderRadius.circular(20)),
                        child: const Text(
                          "All",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  Row(
                      children: List.generate(
                        nameList.length,
                            (index) => InkWell(
                              onTap: () {
                                setState(() {
                                  if(nameList[index]["name"]=="Hoodies")
                                    {
                                      isHoodie = true;
                                      isShirt = false;
                                    }
                                  else if(nameList[index]["name"]=="Shirts")
                                    {
                                      isHoodie = false;
                                      isShirt = true;
                                    }
                                  else
                                    {
                                      isHoodie = false;
                                      isShirt = false;
                                    }
                                });
                              },
                              child: Container(
                                  height: 48,
                                  width: 140,
                                  margin: const EdgeInsets.symmetric(horizontal: 5),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.black, width: 2),
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Text(
                                    "${nameList[index]['name']}",
                                    style:
                                    const TextStyle(
                                        fontSize: 22, fontWeight: FontWeight.w600),
                                  ),
                                ),
                            ),
                            ),
                      )
                ],
              ),
            ),
             Padding(
              padding: EdgeInsets.all(8.0),
              child: Visibility(
                visible: isHoodie,
                child: Text(
                  "Hoodies",
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Visibility(
                visible: isHoodie,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      children: List.generate(productList.length, (index) =>
                          InkWell(
                            onTap: () {
                              Map m1 = productList[index];
                              Navigator.pushNamed(context, 'product',arguments: m1);
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      height: 180,
                                      width: 150,
                                      decoration: BoxDecoration(
                                          color: Colors.grey.shade600,
                                          borderRadius: BorderRadius.circular(15)),
                                      child: ClipRRect(
                                          borderRadius: BorderRadius.circular(20),
                                          child: Image.asset(
                                              "${productList[index]['image']}"))),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "${productList[index]['name']}",
                                    style:
                                    const TextStyle(
                                        fontSize: 15, fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "₹${productList[index]['price']}",
                                        style: const TextStyle(fontSize: 25),
                                      ),
                                      const SizedBox(width: 12,),
                                      const Icon(Icons.star,color: Colors.amber,),
                                      Text("${productList[index]['rate']}",
                                        style: const TextStyle(fontSize: 18),)

                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ))
                  ),
                ),
              ),
            ),
             Padding(
              padding: EdgeInsets.all(8.0),
              child: Visibility(
                visible: isShirt,
                child: Text(
                  "Shirts",
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Visibility(
                visible: isShirt,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      children: List.generate(shirtList.length, (index) =>
                          InkWell(
                            onTap:() {
                              Map m1 = shirtList[index];
                              Navigator.pushNamed(context, 'product',arguments: m1);
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      height: 180,
                                      width: 150,
                                      decoration: BoxDecoration(
                                          color: Colors.grey.shade600,
                                          borderRadius: BorderRadius.circular(15)),
                                      child: ClipRRect(
                                          borderRadius: BorderRadius.circular(20),
                                          child: Image.asset(
                                              "${shirtList[index]['image']}"))),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "${shirtList[index]['name']}",
                                    style:
                                    const TextStyle(
                                        fontSize: 15, fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "₹${shirtList[index]['price']}",
                                        style: const TextStyle(fontSize: 25),
                                      ),
                                      const SizedBox(width: 12,),
                                      const Icon(Icons.star,color: Colors.amber,),
                                      Text("${productList[index]['rate']}",
                                        style: const TextStyle(fontSize: 18),)

                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ))
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
