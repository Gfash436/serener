// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:serener/models/itemInfo.dart';
import 'package:serener/widgets/myColor.dart';
import 'package:serener/widgets/myImage.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final item = [
    ItemInfo(
        itemImage: Image.asset('assets/images/hennessy.png'),
        itemName: 'Hennessy',
        itemPrice: '4000'),
    ItemInfo(
        itemImage: Image.asset('assets/images/eur.png'),
        itemName: 'Brandy',
        itemPrice: '5000')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Palette.kBackgroundColor,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('All Available Items',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Color(0xffFFFFFF))),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                  color: const Color(0xffFFFFFF),
                  borderRadius: BorderRadius.circular(10)),
              child: TextField(
                onChanged: (value) {},
                cursorColor: Colors.black,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    hintText: '  Search...',
                    suffixIcon: Icon(Icons.search)),
              ),
            )
          ],
        ),
      ),
      body: ListView.builder(
          itemCount: item.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                      color: Palette.kColorWhite,
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(5),
                          bottomRight: Radius.circular(5)),
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 3),
                          blurRadius: 0,
                          color: const Color(0xff000000).withOpacity(0.3),
                        ),
                        BoxShadow(
                          color: const Color(0xff000000).withOpacity(0.3),
                          offset: const Offset(0, 0),
                        ),
                        BoxShadow(
                          color: const Color(0xff000000).withOpacity(0.3),
                          offset: const Offset(0, 0),
                        )
                      ]),
                  child: Row(
                    children: [
                      SizedBox(
                          width: 150,
                          height: 150,
                          child: myImage('assets/images/hennessy.png')),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  item[index].itemName,
                                  style: const TextStyle(
                                    color: Color(0xff000000),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            // const Text(
                            //   'description',
                            //   style: TextStyle(
                            //     color: Color(0xff000000),
                            //     fontSize: 16,
                            //   ),
                            // ),
                            Text(
                              '₦ ${item[index].itemPrice}',
                              style: TextStyle(
                                color: Palette.kBackgroundColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
            );
          }),
    );
  }
}
