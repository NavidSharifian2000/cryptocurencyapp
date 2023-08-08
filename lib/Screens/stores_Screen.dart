import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constance/Colors.dart';

class store_screen extends StatefulWidget {
  const store_screen({super.key});

  @override
  State<store_screen> createState() => _store_screenState();
}

class _store_screenState extends State<store_screen>
    with TickerProviderStateMixin {
  TabController? tabcontroller;
  @override
  void initState() {
    super.initState();
    tabcontroller = TabController(length: 3, initialIndex: 0, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(
            height: 11,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Image.asset("assets/images/Setting_alt_line.png"),
                SizedBox(
                  width: 16,
                ),
                Image.asset("assets/images/Chat_search.png"),
                SizedBox(
                  width: 40,
                ),
                Expanded(
                  child: Container(
                    width: 180,
                    height: 32,
                    decoration: BoxDecoration(
                        color: ProjectColors().gray100,
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: TextField(
                              maxLength: 5,
                              textAlign: TextAlign.right,
                              decoration: InputDecoration(
                                counterText: '',
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                border: InputBorder.none,
                                label: Text(
                                  "جستوجوی ارز",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: "GM",
                                      color: ProjectColors().shade2),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Image.asset("assets/images/Search.png"),
                        SizedBox(
                          width: 4,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 81),
            child: TabBar(
              controller: tabcontroller,
              indicatorPadding: EdgeInsets.symmetric(horizontal: 40),
              indicatorColor: ProjectColors().yellow,
              tabs: [
                Tab(
                  child: Text(
                    "همه نرخ ها",
                    style: TextStyle(
                        color: ProjectColors().black,
                        fontFamily: "GM",
                        fontSize: 12),
                  ),
                ),
                Tab(
                  child: Text(
                    "نرخ تومان",
                    style: TextStyle(
                        color: ProjectColors().black,
                        fontFamily: "GM",
                        fontSize: 12),
                  ),
                ),
                Tab(
                  child: Text(
                    "نرخ تتر",
                    style: TextStyle(
                        color: ProjectColors().black,
                        fontFamily: "GM",
                        fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 1,
            color: ProjectColors().gray100,
          ),
          SizedBox(
            height: 23,
          ),
          Directionality(
            textDirection: TextDirection.rtl,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "ارزها / حجم",
                    style: TextStyle(
                        fontSize: 10,
                        fontFamily: "GM",
                        color: ProjectColors().shade2),
                  ),
                  SizedBox(
                    width: 145,
                  ),
                  Text("اخرین قیمت",
                      style: TextStyle(
                          fontSize: 10,
                          fontFamily: "GM",
                          color: ProjectColors().shade2)),
                  Spacer(),
                  Text("تغیرات 24 ساعت",
                      style: TextStyle(
                          fontSize: 10,
                          fontFamily: "GM",
                          color: ProjectColors().shade2)),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: TabBarView(controller: tabcontroller, children: [
                CustomScrollView(
                  slivers: [
                    SliverList.builder(itemBuilder: (context, index) {
                      return itemListofCryptos();
                    })
                  ],
                ),
                itemListofCryptos(),
                itemListofCryptos(),
              ]),
            ),
          )
        ],
      ),
    );
    ;
  }
}

class itemListofCryptos extends StatelessWidget {
  const itemListofCryptos({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Stack(children: [
          Positioned(
            top: 20,
            left: 20,
            child: Container(
              height: 20,
              width: 40,
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
          ),
          Container(
            height: 60,
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Image.asset("assets/images/BitcoinBadge.png")],
                ),
                SizedBox(
                  width: 8,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      " بیتکوین /تومان",
                      style: TextStyle(
                          fontSize: 10,
                          fontFamily: "GM",
                          color: ProjectColors().shade2),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "410,000000000",
                      style: TextStyle(
                          fontSize: 10,
                          fontFamily: "GM",
                          color: ProjectColors().shade2),
                    )
                  ],
                ),
                Expanded(
                    child: Container(
                  color: Colors.transparent,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("1200000000"),
                    ],
                  ),
                )),
                SizedBox(
                  width: 100,
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
