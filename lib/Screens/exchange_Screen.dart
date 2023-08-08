import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:iranicart_crypto/constance/Colors.dart';

class exchange_screen extends StatefulWidget {
  const exchange_screen({super.key});

  @override
  State<exchange_screen> createState() => _exchange_screenState();
}

class _exchange_screenState extends State<exchange_screen> {
  int selecteddarsad = 0;
  var listdarsads = ["25%", "50%", "75%", "100%"];
  var listsellsprce = [1212121, 1212112, 12121212, 12121, 1221212];
  String controllerprice = '';
  var textcontrollerprice = new TextEditingController();
  String controllervalue = '';
  var textcontrollervalue = new TextEditingController();
  var sumcontroller = new TextEditingController();
  bool selltap = true;
  bool buytab = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: DefaultTabController(
            length: 2,
            child: NestedScrollView(
              headerSliverBuilder: (context, isscroll) {
                return [
                  SliverToBoxAdapter(
                    child: firstwidget(),
                  ),
                  SliverToBoxAdapter(
                    child: secondwidget(),
                  ),
                  SliverToBoxAdapter(
                    child: thirdwidget(),
                  ),
                  SliverToBoxAdapter(
                    child: getfourwidghet(),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 46,
                    ),
                  ),
                  SliverPersistentHeader(
                      floating: true,
                      pinned: true,
                      delegate: tabbarviewdelegate(TabBar(
                          labelPadding: EdgeInsets.only(right: 20),
                          isScrollable: true,
                          indicator: BoxDecoration(color: Colors.transparent),
                          labelColor: ProjectColors().yellow,
                          unselectedLabelColor: ProjectColors().black,
                          indicatorColor: Colors.amber,
                          tabs: [
                            Tab(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Row(
                                  children: [
                                    Image.asset("assets/images/File_dock.png"),
                                    Text(
                                      "سبددارایی های من",
                                      style: TextStyle(fontFamily: "GM"),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Tab(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Image.asset(
                                        "assets/images/Basket_alt_light.png"),
                                    Text(
                                      " سفارش های در حال انجام",
                                      style: TextStyle(
                                          fontFamily: "GM", fontSize: 12),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ])))
                ];
              },
              body: TabBarView(children: [
                CustomScrollView(
                  slivers: [
                    SliverList.builder(itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Container(
                              decoration:
                                  BoxDecoration(color: ProjectColors().white2),
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 16,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 155,
                                      ),
                                      Container(
                                        height: 26,
                                        width: 57,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(4)),
                                            color: Color(0xff33EF233C)),
                                        child: Center(
                                          child: Text(
                                            "22%",
                                            style: TextStyle(
                                                fontSize: 10,
                                                fontFamily: "GM",
                                                color: ProjectColors().shade2),
                                          ),
                                        ),
                                      ),
                                      Spacer(),
                                      Row(
                                        children: [
                                          Column(
                                            children: [
                                              Text("اتریوم/تتر"),
                                              Text("ETH/USDT"),
                                            ],
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Image.asset(
                                              "assets/images/EthereumBadge.png")
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 140),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              "مقدار",
                                              style: TextStyle(
                                                  fontFamily: "GM",
                                                  color:
                                                      ProjectColors().shade2),
                                            ),
                                            Text("ETH 0.0314")
                                          ],
                                        ),
                                      ),
                                      Spacer(),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          SizedBox(
                                            height: 12,
                                          ),
                                          Text(
                                            "مقدار",
                                            style: TextStyle(
                                                fontFamily: "GM",
                                                color: ProjectColors().shade2),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "تتر",
                                                style: TextStyle(
                                                    color:
                                                        ProjectColors().shade2,
                                                    fontFamily: "GM"),
                                              ),
                                              Text("1,365.8"),
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 16,
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 2,
                            color: ProjectColors().gray100,
                          )
                        ],
                      );
                    })
                  ],
                ),
                CustomScrollView(
                  slivers: [
                    SliverList.builder(itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Container(
                              decoration:
                                  BoxDecoration(color: ProjectColors().white2),
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 16,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 155,
                                      ),
                                      Container(
                                        height: 26,
                                        width: 57,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(4)),
                                            color: Color(0xff33EF233C)),
                                        child: Center(
                                          child: Text(
                                            "22%",
                                            style: TextStyle(
                                                fontSize: 10,
                                                fontFamily: "GM",
                                                color: ProjectColors().shade2),
                                          ),
                                        ),
                                      ),
                                      Spacer(),
                                      Row(
                                        children: [
                                          Column(
                                            children: [
                                              Text("اتریوم/تتر"),
                                              Text("ETH/USDT"),
                                            ],
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Image.asset(
                                              "assets/images/EthereumBadge.png")
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 140),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              "مقدار",
                                              style: TextStyle(
                                                  fontFamily: "GM",
                                                  color:
                                                      ProjectColors().shade2),
                                            ),
                                            Text("ETH 0.0314")
                                          ],
                                        ),
                                      ),
                                      Spacer(),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          SizedBox(
                                            height: 12,
                                          ),
                                          Text(
                                            "مقدار",
                                            style: TextStyle(
                                                fontFamily: "GM",
                                                color: ProjectColors().shade2),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "تتر",
                                                style: TextStyle(
                                                    color:
                                                        ProjectColors().shade2,
                                                    fontFamily: "GM"),
                                              ),
                                              Text("1,365.8"),
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 16,
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 2,
                            color: ProjectColors().gray100,
                          )
                        ],
                      );
                    })
                  ],
                ),
              ]),
            )));
  }

  Widget getfourwidghet() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 385,
      color: ProjectColors().white2,
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Stack(alignment: Alignment.center, children: [
                  if (selltap == false) ...{
                    Container(
                      width: 80,
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: ProjectColors().gray100),
                    )
                  },
                  if (selltap == true) ...{
                    Container(
                        width: 80,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: ProjectColors().red)),
                  },
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selltap = true;
                        buytab = false;
                      });
                      print(selltap);
                    },
                    child: Container(
                      color: Colors.transparent,
                      width: 80,
                      height: 30,
                      child: Center(
                        child: Text(
                          "فروش",
                          style: TextStyle(
                              color: ProjectColors().wihte,
                              fontFamily: "GM",
                              fontSize: 12),
                        ),
                      ),
                    ),
                  )
                ]),
                SizedBox(
                  width: 10,
                ),
                Stack(alignment: Alignment.center, children: [
                  if (buytab == false) ...{
                    Container(
                        width: 80,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: ProjectColors().gray100))
                  },
                  if (buytab == true) ...{
                    Container(
                        width: 80,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: ProjectColors().green))
                  },
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selltap = false;
                        buytab = true;
                      });
                    },
                    child: Container(
                      color: Colors.transparent,
                      width: 80,
                      height: 30,
                      child: Center(
                        child: Text(
                          "خرید",
                          style: TextStyle(
                              color: ProjectColors().wihte,
                              fontFamily: "GM",
                              fontSize: 12),
                        ),
                      ),
                    ),
                  )
                ]),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 2.5),
                    child: Container(
                      height: 325,
                      color: Colors.white,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "مقدار",
                                style: TextStyle(
                                    fontFamily: "GM",
                                    fontSize: 10,
                                    color: ProjectColors().black),
                              ),
                              Spacer(),
                              Text("قیمت",
                                  style: TextStyle(
                                      fontFamily: "GM",
                                      fontSize: 10,
                                      color: ProjectColors().black)),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            height: 120,
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 8),
                                  child: Row(
                                    children: [
                                      Text(
                                        "12000",
                                        style: TextStyle(
                                            color: ProjectColors().shade2,
                                            fontFamily: "GM",
                                            fontSize: 10),
                                      ),
                                      Spacer(),
                                      GestureDetector(
                                        onTap: () {
                                          textcontrollerprice.text =
                                              listsellsprce[index].toString();
                                        },
                                        child: Text(
                                          listsellsprce[index].toString(),
                                          style: TextStyle(
                                              color: ProjectColors().shade2,
                                              fontFamily: "GM",
                                              fontSize: 10),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              itemCount: 5,
                            ),
                          ),
                          SizedBox(
                            height: 19,
                          ),
                          Text(
                            "62121212221122",
                            style: TextStyle(
                                color: ProjectColors().green,
                                fontSize: 12,
                                fontFamily: "GM"),
                          ),
                          SizedBox(
                            height: 19,
                          ),
                          SizedBox(
                            height: 115,
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 8),
                                  child: Row(
                                    children: [
                                      Text("1,402,08",
                                          style: TextStyle(
                                              color: ProjectColors().shade2,
                                              fontFamily: "GM",
                                              fontSize: 10)),
                                      Spacer(),
                                      Text("680,212,115",
                                          style: TextStyle(
                                              color: ProjectColors().green,
                                              fontFamily: "GM",
                                              fontSize: 10))
                                    ],
                                  ),
                                );
                              },
                              itemCount: 5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 2.5),
                    child: Container(
                      height: 325,
                      color: Colors.white,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Image.asset("assets/images/Info_alt_duotone.png"),
                              SizedBox(
                                width: 4,
                              ),
                              Expanded(
                                  child: Container(
                                height: 26,
                                decoration: BoxDecoration(
                                    color: ProjectColors().gray100,
                                    borderRadius: BorderRadius.circular(5)),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Image.asset("assets/images/downarrow.png"),
                                    Spacer(),
                                    Text(
                                      "با تعیین قیمت",
                                      textAlign: TextAlign.end,
                                    ),
                                  ],
                                ),
                              ))
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  if (double.parse(textcontrollerprice.text) ==
                                      0) {
                                    return;
                                  }
                                  if (textcontrollerprice.text.isNotEmpty) {
                                    controllerprice =
                                        (int.parse(textcontrollerprice.text) -
                                                1)
                                            .toString();
                                    textcontrollerprice.text = controllerprice;
                                  }
                                  if (textcontrollervalue.text.isNotEmpty &&
                                      textcontrollerprice.text != '' &&
                                      textcontrollervalue.text != '') {
                                    var sum =
                                        int.parse(textcontrollerprice.text) *
                                            int.parse(textcontrollervalue.text);
                                    sumcontroller.text = sum.toString();
                                  }
                                  if (textcontrollerprice.text.isEmpty ||
                                      textcontrollervalue.text.isEmpty) {
                                    sumcontroller.text = "";
                                  }
                                },
                                child: Container(
                                  height: 40,
                                  width: 15,
                                  decoration: BoxDecoration(
                                      color: ProjectColors().gray100,
                                      borderRadius: BorderRadius.circular(2)),
                                  child: Center(
                                    child: Text("-"),
                                  ),
                                ),
                              ),
                              Expanded(
                                  child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Container(
                                        height: 40,
                                        decoration: BoxDecoration(
                                            color: ProjectColors().gray100,
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: TextField(
                                          onChanged: (value) {
                                            if (textcontrollervalue
                                                    .text.isNotEmpty &&
                                                textcontrollerprice.text !=
                                                    '' &&
                                                textcontrollervalue.text !=
                                                    '') {
                                              var sum = int.parse(
                                                      textcontrollerprice
                                                          .text) *
                                                  int.parse(
                                                      textcontrollervalue.text);
                                              sumcontroller.text =
                                                  sum.toString();
                                            }
                                            if (textcontrollerprice
                                                    .text.isEmpty ||
                                                textcontrollervalue
                                                    .text.isEmpty) {
                                              sumcontroller.text = "";
                                            }
                                          },
                                          controller: textcontrollerprice,
                                          maxLength: 13,
                                          textAlign: TextAlign.right,
                                          decoration: InputDecoration(
                                            counterText: '',
                                            floatingLabelBehavior:
                                                FloatingLabelBehavior.never,
                                            border: InputBorder.none,
                                            label: Row(
                                              children: [
                                                Spacer(),
                                                Text(
                                                  "قیمت واحد",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontFamily: "GM",
                                                      color: ProjectColors()
                                                          .shade1),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ))),
                              GestureDetector(
                                onTap: () {
                                  if (textcontrollerprice.text.isNotEmpty) {
                                    controllerprice =
                                        (int.parse(textcontrollerprice.text) +
                                                1)
                                            .toString();
                                    textcontrollerprice.text = controllerprice;
                                  }
                                  if (textcontrollervalue.text.isNotEmpty &&
                                      textcontrollerprice.text != '' &&
                                      textcontrollervalue.text != '') {
                                    var sum =
                                        int.parse(textcontrollerprice.text) *
                                            int.parse(textcontrollervalue.text);
                                    sumcontroller.text = sum.toString();
                                  }
                                  if (textcontrollerprice.text.isEmpty ||
                                      textcontrollervalue.text.isEmpty) {
                                    sumcontroller.text = "";
                                  }
                                },
                                child: Container(
                                  height: 40,
                                  width: 15,
                                  decoration: BoxDecoration(
                                      color: ProjectColors().gray100,
                                      borderRadius: BorderRadius.circular(2)),
                                  child: Center(
                                    child: Text("+"),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  if (double.parse(textcontrollervalue.text) ==
                                      0) {
                                    return;
                                  }
                                  if (textcontrollervalue.text.isNotEmpty) {
                                    controllervalue =
                                        (int.parse(textcontrollervalue.text) -
                                                1)
                                            .toString();
                                    textcontrollervalue.text = controllervalue;
                                  }
                                  if (textcontrollervalue.text.isNotEmpty &&
                                      textcontrollerprice.text != '' &&
                                      textcontrollervalue.text != '') {
                                    var sum =
                                        int.parse(textcontrollerprice.text) *
                                            int.parse(textcontrollervalue.text);
                                    sumcontroller.text = sum.toString();
                                  }
                                  if (textcontrollerprice.text.isEmpty ||
                                      textcontrollervalue.text.isEmpty) {
                                    sumcontroller.text = "";
                                  }
                                },
                                child: Container(
                                  height: 40,
                                  width: 15,
                                  decoration: BoxDecoration(
                                      color: ProjectColors().gray100,
                                      borderRadius: BorderRadius.circular(2)),
                                  child: Center(
                                    child: Text("-"),
                                  ),
                                ),
                              ),
                              Expanded(
                                  child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Container(
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: ProjectColors().gray100,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: TextField(
                                    onChanged: (value) {
                                      if (textcontrollervalue.text.isNotEmpty &&
                                          textcontrollerprice.text != '' &&
                                          textcontrollervalue.text != '') {
                                        var sum = int.parse(
                                                textcontrollerprice.text) *
                                            int.parse(textcontrollervalue.text);
                                        sumcontroller.text = sum.toString();
                                      }
                                      if (textcontrollerprice.text.isEmpty ||
                                          textcontrollervalue.text.isEmpty) {
                                        sumcontroller.text = "";
                                      }
                                    },
                                    controller: textcontrollervalue,
                                    maxLength: 13,
                                    textAlign: TextAlign.right,
                                    decoration: InputDecoration(
                                      counterText: '',
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.never,
                                      border: InputBorder.none,
                                      label: Row(
                                        children: [
                                          Spacer(),
                                          Text(
                                            "مقدار",
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontFamily: "GM",
                                                color: ProjectColors().shade1),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              )),
                              GestureDetector(
                                onTap: () {
                                  if (textcontrollervalue.text.isNotEmpty) {
                                    controllervalue =
                                        (int.parse(textcontrollervalue.text) +
                                                1)
                                            .toString();
                                    textcontrollervalue.text = controllervalue;
                                  }
                                  if (textcontrollervalue.text.isNotEmpty &&
                                      textcontrollerprice.text != '' &&
                                      textcontrollervalue.text != '') {
                                    var sum =
                                        int.parse(textcontrollerprice.text) *
                                            int.parse(textcontrollervalue.text);
                                    sumcontroller.text = sum.toString();
                                  }
                                  if (textcontrollerprice.text.isEmpty ||
                                      textcontrollervalue.text.isEmpty) {
                                    sumcontroller.text = "";
                                  }
                                },
                                child: Container(
                                  height: 40,
                                  width: 15,
                                  decoration: BoxDecoration(
                                      color: ProjectColors().gray100,
                                      borderRadius: BorderRadius.circular(2)),
                                  child: Center(
                                    child: Text("+"),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: SizedBox(
                                  width: 150,
                                  height: 22,
                                  child: ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (contex, index) {
                                      return Padding(
                                        padding:
                                            const EdgeInsets.only(right: 4),
                                        child: SizedBox(
                                          width: 40,
                                          child: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                selecteddarsad = index;
                                              });
                                            },
                                            child: DottedBorder(
                                                color: (selecteddarsad == index
                                                    ? ProjectColors().yellow
                                                    : ProjectColors().black),
                                                child: Center(
                                                    child: Text(
                                                  listdarsads[index],
                                                  style: TextStyle(
                                                      color: (selecteddarsad ==
                                                              index
                                                          ? ProjectColors()
                                                              .yellow
                                                          : ProjectColors()
                                                              .black)),
                                                ))),
                                          ),
                                        ),
                                      );
                                    },
                                    itemCount: 4,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: Container(
                                height: 40,
                                child: TextField(
                                  controller: sumcontroller,
                                  maxLength: 13,
                                  textAlign: TextAlign.right,
                                  decoration: InputDecoration(
                                    counterText: '',
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.never,
                                    border: InputBorder.none,
                                    label: Row(
                                      children: [
                                        Spacer(),
                                        Text(
                                          "مجموع ارزش",
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontFamily: "GM",
                                              color: ProjectColors().shade1),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    color: ProjectColors().gray100,
                                    borderRadius: BorderRadius.circular(5)),
                              )),
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Directionality(
                            textDirection: TextDirection.rtl,
                            child: Row(
                              children: [
                                Text(
                                  "در دسترس:",
                                  style: TextStyle(
                                      color: ProjectColors().black,
                                      fontFamily: "GM",
                                      fontSize: 12),
                                ),
                                Text("0",
                                    style: TextStyle(
                                        color: ProjectColors().black,
                                        fontFamily: "GM",
                                        fontSize: 12)),
                                Text("تتر",
                                    style: TextStyle(
                                        color: ProjectColors().black,
                                        fontFamily: "GM",
                                        fontSize: 12)),
                                Spacer(),
                                Image.asset(
                                    "assets/images/doubleSort_arrow.png"),
                                SizedBox(
                                  width: 8,
                                )
                              ],
                            ),
                          ),
                          Directionality(
                            textDirection: TextDirection.rtl,
                            child: Row(
                              children: [
                                Text(" حداقل خرید:",
                                    style: TextStyle(
                                        color: ProjectColors().black,
                                        fontFamily: "GM",
                                        fontSize: 12)),
                                Text("100",
                                    style: TextStyle(
                                        color: ProjectColors().black,
                                        fontFamily: "GM",
                                        fontSize: 12)),
                                Text("تتر",
                                    style: TextStyle(
                                        color: ProjectColors().black,
                                        fontFamily: "GM",
                                        fontSize: 12)),
                              ],
                            ),
                          ),
                          Spacer(),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 30,
                                  decoration: BoxDecoration(
                                      color: (selltap == true
                                          ? ProjectColors().red
                                          : ProjectColors().green),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Center(
                                      child: Text("خرید اتریوم",
                                          style: TextStyle(
                                              color: ProjectColors().black,
                                              fontFamily: "GM",
                                              fontSize: 12))),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class thirdwidget extends StatelessWidget {
  const thirdwidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 64,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset("assets/images/candlestick_duotone_line.png"),
                SizedBox(
                  width: 8,
                ),
                Image.asset("assets/images/Star_duotone.png"),
              ],
            ),
            Container(
              height: 26,
              width: 57,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  color: Color(0xff33EF233C)),
              child: Center(
                child: Text(
                  "22%",
                  style: TextStyle(
                      fontSize: 10,
                      fontFamily: "GM",
                      color: ProjectColors().shade2),
                ),
              ),
            ),
            Row(
              children: [
                Text(
                  "تتر",
                  style: TextStyle(
                      fontFamily: "GM",
                      fontSize: 10,
                      color: ProjectColors().shade2),
                ),
                Text(
                  "/",
                  style: TextStyle(fontSize: 23),
                ),
                Text(
                  "اتریوم",
                  style: TextStyle(
                      fontFamily: "GM",
                      fontSize: 16,
                      color: ProjectColors().black),
                ),
                SizedBox(
                  width: 4,
                ),
                Image.asset("assets/images/EthereumBadge.png"),
                SizedBox(
                  width: 5,
                ),
                Image.asset("assets/images/Frame 427318694.png")
              ],
            )
          ],
        ),
      ),
    );
  }
}

class secondwidget extends StatelessWidget {
  const secondwidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Image.asset("assets/images/Setting_alt_line (1).png"),
            SizedBox(
              width: 10,
            ),
            Image.asset("assets/images/Chat_search.png"),
            Spacer(),
            Text(
              "سفارش گذاری",
              style: TextStyle(
                fontFamily: "GM",
                color: ProjectColors().black,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Image.asset("assets/images/Info_alt_duotone.png"),
          ],
        ),
      ),
    );
  }
}

class firstwidget extends StatelessWidget {
  const firstwidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
    );
  }
}

class tabbarviewdelegate extends SliverPersistentHeaderDelegate {
  tabbarviewdelegate(this.tabbar);
  TabBar tabbar;
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: tabbar,
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => 50;

  @override
  // TODO: implement minExtent
  double get minExtent => 50;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
