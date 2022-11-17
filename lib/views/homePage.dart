// ignore_for_file: prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:serener/models/itemModel.dart';
import 'package:serener/models/myApi.dart';
import 'package:serener/post/dbProvider.dart';
import 'package:serener/post/fetchDataProvider.dart';
import 'package:serener/widgets/myColor.dart';
import 'package:serener/widgets/myImage.dart';
import 'package:serener/widgets/myText.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List items = [];
  @override
  void initState() {
    super.initState();
    FetchItems().fetchItems();
  }

  // _getItem() {
  //   CallApi().getItemData("all").then((response) {
  //     Iterable list = json.decode(response.body);
  //     items = list.map((model) => Data.fromJson(model)).toList();
  //   });
  // }

  // final item = [
  //   ItemInfo(
  //       itemImage: Image.asset('assets/images/hennessy.png'),
  //       itemName: 'Hennessy',
  //       itemPrice: '4000'),
  //   ItemInfo(
  //       itemImage: Image.asset('assets/images/eur.png'),
  //       itemName: 'Brandy',
  //       itemPrice: '5000'),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffFFFFFF),
        appBar: AppBar(
          toolbarHeight: 120,
          backgroundColor: Palette.kBackgroundColor,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('All Available Items',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Color(0xffFFFFFF))),
                  IconButton(
                    icon: const Icon(Icons.logout_rounded),
                    onPressed: () {
                      DatabaseProvider().logOut(context);
                    },
                  )
                ],
              ),
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
          padding: const EdgeInsets.all(20),
          itemCount: 1,
          itemBuilder: (context, index) {
            return Container(
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
                              const myText(
                                data: 'Hennessy',
                                // data: myItem.confectionary.toString(),
                                color: Color(0xff000000),
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
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
                            '# ${500}',
                            // '₦ ${myItem.price}',
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
                ));
          },
        ));
  }
}
