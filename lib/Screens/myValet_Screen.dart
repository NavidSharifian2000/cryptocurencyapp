import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:iranicart_crypto/constance/Colors.dart';

class myValet_Screen extends StatefulWidget {
  const myValet_Screen({super.key});

  @override
  State<myValet_Screen> createState() => _myValet_ScreenState();
}

class _myValet_ScreenState extends State<myValet_Screen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: firstsectionofscreen(),
        ),
        SliverToBoxAdapter(
          child: secondsectionofscreen(),
        ),
        SliverToBoxAdapter(
          child: thirdsectionofscreen(),
        ),
        SliverToBoxAdapter(
          child: foursectionofscreen(),
        ),
        SliverList.builder(itemBuilder: (context, index) {
          return fivesectionofscreen();
        })
      ],
    ));
  }
}

class fivesectionofscreen extends StatefulWidget {
  const fivesectionofscreen({
    super.key,
  });

  @override
  State<fivesectionofscreen> createState() => _fivesectionofscreenState();
}

class _fivesectionofscreenState extends State<fivesectionofscreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20, top: 20),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            Text(
              "تومان",
              style: TextStyle(
                  fontFamily: "GM",
                  fontSize: 10,
                  color: ProjectColors().shade2),
            ),
            SizedBox(
              width: 5,
            ),
            Text("450,000",
                style: TextStyle(
                    fontFamily: "GM",
                    fontSize: 15,
                    color: ProjectColors().shade2)),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("BTC"),
                Text("بیتکوین",
                    style: TextStyle(
                        fontFamily: "GM",
                        fontSize: 12,
                        color: ProjectColors().black)),
              ],
            ),
            SizedBox(
              width: 8,
            ),
            Image.asset("assets/images/BitcoinBadge.png")
          ],
        ),
      ),
    );
  }
}

class foursectionofscreen extends StatefulWidget {
  foursectionofscreen({
    super.key,
  });

  @override
  State<foursectionofscreen> createState() => _foursectionofscreenState();
}

class _foursectionofscreenState extends State<foursectionofscreen> {
  bool ischeck = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: MediaQuery.of(context).size.width,
      color: ProjectColors().wihte,
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 96,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: ProjectColors().gray100),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "تبدیل ارز",
                        style: TextStyle(
                            color: ProjectColors().black, fontFamily: "GM"),
                      ),
                      Image.asset(
                          "assets/images/Vertical_switch_long_light.png")
                    ],
                  ),
                ),
                Container(
                  width: 96,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: ProjectColors().red),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "برداشت وجه",
                        style: TextStyle(
                            color: ProjectColors().wihte,
                            fontFamily: "GM",
                            fontSize: 12),
                      ),
                      Image.asset(
                        "assets/images/Arrow_alt_ltop (2).png",
                        width: 20,
                      )
                    ],
                  ),
                ),
                Container(
                  width: 96,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: ProjectColors().green),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "واریز وجه",
                        style: TextStyle(
                            color: ProjectColors().wihte, fontFamily: "GM"),
                      ),
                      Image.asset(
                        "assets/images/Arrow_alt_ltop (3).png",
                        width: 20,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Divider(
              color: ProjectColors().black,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Text(
                  "مقدار دارایی",
                  style: TextStyle(fontSize: 12, fontFamily: "GM"),
                ),
                SizedBox(
                  width: 30,
                ),
                Checkbox(
                    shape: CircleBorder(),
                    value: ischeck,
                    onChanged: (value) {
                      setState(() {
                        ischeck = value!;
                      });
                    }),
                Text(
                  "مخفی کردن دارایی های اندک",
                  style: TextStyle(
                    fontFamily: "GM",
                    fontSize: 8,
                  ),
                ),
                Spacer(),
                Text(
                  "ارز ها",
                  style: TextStyle(fontFamily: "GM", fontSize: 12),
                ),
                SizedBox(
                  width: 5,
                ),
                Image.asset("assets/images/Sort list_alt.png"),
                SizedBox(
                  width: 4,
                ),
                Image.asset("assets/images/Menu.png"),
                SizedBox(
                  width: 4,
                ),
                Image.asset("assets/images/pie_chart_light.png"),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class thirdsectionofscreen extends StatelessWidget {
  const thirdsectionofscreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 10,
      color: ProjectColors().white2,
    );
  }
}

class secondsectionofscreen extends StatelessWidget {
  const secondsectionofscreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: MediaQuery.of(context).size.width,
      color: ProjectColors().wihte,
      child: Column(
        children: [
          SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: DottedBorder(
              dashPattern: [5, 5],
              strokeWidth: 1,
              borderType: BorderType.RRect,
              radius: Radius.circular(15),
              color: ProjectColors().shade2,
              child: Container(
                decoration: BoxDecoration(
                    color: ProjectColors().wihte,
                    borderRadius: BorderRadius.circular(15)),
                height: 88,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    SizedBox(
                      width: 8,
                    ),
                    Container(
                      width: 123,
                      height: 38,
                      child: Center(
                        child: Text(
                          "دیدن پرتفوی",
                          style: TextStyle(
                              color: ProjectColors().wihte,
                              fontFamily: "GM",
                              fontSize: 12),
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: ProjectColors().green,
                          borderRadius: BorderRadius.circular(2)),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(right: 8),
                        width: 150,
                        height: 56,
                        color: Colors.transparent,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Image.asset(
                                  "assets/images/Eye.png",
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  "ارزش کل موجودی",
                                  style: TextStyle(
                                      fontFamily: "GM",
                                      fontSize: 12,
                                      color: ProjectColors().shade1),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Image.asset(
                                    "assets/images/Arrow_drop_down.png"),
                                Text(
                                  "تومان",
                                  style: TextStyle(
                                      fontFamily: "GM",
                                      fontSize: 12,
                                      color: ProjectColors().shade1),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  "19,850,500",
                                  style: TextStyle(
                                      color: ProjectColors().yellow,
                                      fontFamily: "GM",
                                      fontSize: 17),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Text(
                  "تومان",
                  style: TextStyle(
                      fontFamily: "GM",
                      fontSize: 12,
                      color: ProjectColors().shade2),
                ),
                SizedBox(
                  width: 5,
                ),
                Text("112,000",
                    style: TextStyle(
                        fontFamily: "GM",
                        fontSize: 12,
                        color: ProjectColors().green)),
                SizedBox(
                  width: 16,
                ),
                Container(
                  width: 78,
                  height: 27,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xff3322B573),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          "+",
                          style: TextStyle(color: ProjectColors().green),
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Text("1.45"),
                        Spacer(),
                        Image.asset("assets/images/Sort_arrow_da.png")
                      ],
                    ),
                  ),
                ),
                Expanded(
                    child: Container(
                  child: Text(
                    "سود و زیان روز گذشته",
                    style: TextStyle(
                        color: ProjectColors().black,
                        fontFamily: "GM",
                        fontSize: 12),
                    textDirection: TextDirection.rtl,
                  ),
                )),
                SizedBox(
                  width: 4,
                ),
                Image.asset("assets/images/Sort_arrow.png")
              ],
            ),
          )
        ],
      ),
    );
  }
}

class firstsectionofscreen extends StatelessWidget {
  const firstsectionofscreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 102,
      decoration: BoxDecoration(color: ProjectColors().white2),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Image.asset("assets/images/bell.png"),
                  SizedBox(
                    width: 21,
                  ),
                  Image.asset("assets/images/Desk_alt.png"),
                  Spacer(),
                  Image.asset("assets/images/listicon.png"),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    "کیف پول من",
                    style: TextStyle(
                        fontFamily: "GM",
                        fontSize: 15,
                        color: ProjectColors().black),
                  ),
                ],
              ),
            )
          ]),
        ],
      ),
    );
  }
}
