import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iranicart_crypto/bloc/cryptosinfo_bloc/cryptos_bloc.dart';
import 'package:iranicart_crypto/bloc/cryptosinfo_bloc/cryptos_event.dart';
import 'package:iranicart_crypto/bloc/cryptosinfo_bloc/cryptos_state.dart';
import 'package:iranicart_crypto/data/model/CryptocurrencyMetrics.dart';
import 'package:iranicart_crypto/data/model/crypto.dart';

import '../constance/Colors.dart';

class dasboard_Screen extends StatefulWidget {
  const dasboard_Screen({super.key});

  @override
  State<dasboard_Screen> createState() => _dasboard_ScreenState();
}

class _dasboard_ScreenState extends State<dasboard_Screen> {
  @override
  void initState() {
    BlocProvider.of<CryptotBloc>(context).add(CryptogetdataEvent());
    super.initState();
  }

  @override
  void dispose() async {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffFAFAFA),
        body: SafeArea(child:
            BlocBuilder<CryptotBloc, CryptosState>(builder: (context, state) {
          return DefaultTabController(
            length: 3,
            child: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  SliverToBoxAdapter(
                    child: firstwidget(),
                  ),
                  SliverToBoxAdapter(
                    child: secondwidget(),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 10,
                      color: ProjectColors().gray100,
                    ),
                  ),
                  SliverToBoxAdapter(child: thirdwidget()),
                  SliverToBoxAdapter(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 10,
                      color: ProjectColors().gray100,
                    ),
                  ),
                  SliverPersistentHeader(
                      pinned: true,
                      floating: true,
                      delegate: tabbarviewdelegate(TabBar(
                          indicator: UnderlineTabIndicator(
                              borderSide:
                                  BorderSide(width: 2, color: Colors.amber),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          indicatorPadding:
                              EdgeInsets.symmetric(horizontal: 50),
                          tabs: listOfTabview())))
                ];
              },
              body: TabBarView(children: [
                CustomScrollView(
                  slivers: [
                    if (state is CryptosLoadingState) ...{
                      SliverToBoxAdapter(
                        child: Center(child: CircularProgressIndicator()),
                      )
                    } else if (state is CryptossuccessState) ...{
                      state.minescryptos.fold(
                          (l) => SliverToBoxAdapter(
                                child: Text(l.toString()),
                              ),
                          (r) => SliverList.builder(
                                itemBuilder: (context, index) {
                                  return itemListofCryptos(r[index]);
                                },
                                itemCount: r.length,
                              ))
                    }
                  ],
                ),
                CustomScrollView(
                  slivers: [
                    if (state is CryptosLoadingState) ...{
                      SliverToBoxAdapter(
                        child: Center(child: CircularProgressIndicator()),
                      )
                    },
                    if (state is CryptossuccessState) ...{
                      state.pluscryptos.fold(
                          (l) => SliverToBoxAdapter(
                                child: Text(l.toString()),
                              ),
                          (r) => SliverList.builder(
                                itemBuilder: (context, index) {
                                  return itemListofCryptos(r[index]);
                                },
                                itemCount: r.length,
                              ))
                    }
                  ],
                ),
                CustomScrollView(
                  slivers: [
                    if (state is CryptosLoadingState) ...{
                      SliverToBoxAdapter(
                        child: Center(child: CircularProgressIndicator()),
                      )
                    } else if (state is CryptossuccessState) ...{
                      state.cryptos.fold(
                          (l) => SliverToBoxAdapter(
                                child: Text(l.toString()),
                              ),
                          (r) => SliverList.builder(
                                itemBuilder: (context, index) {
                                  return itemListofCryptos(r[index]);
                                },
                                itemCount: r.length,
                              ))
                    }
                  ],
                ),
              ]),
            ),
          );
        })));
  }
}

List<Tab> listOfTabview() {
  return [
    Tab(
      child: Text(
        " بیشترین ضرر",
        style: TextStyle(color: ProjectColors().shade2, fontFamily: "GM"),
      ),
    ),
    Tab(
      child: Padding(
        padding: const EdgeInsets.only(),
        child: Text(
          " بیشترین سود",
          style: TextStyle(color: ProjectColors().shade2, fontFamily: "GM"),
        ),
      ),
    ),
    Tab(
      child: Text(
        "معروف ترین ها",
        style: TextStyle(color: ProjectColors().shade2, fontFamily: "GM"),
      ),
    ),
  ];
}

class itemListofCryptos extends StatelessWidget {
  crypto Crypto;
  itemListofCryptos(
    this.Crypto, {
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
                  color: Crypto.percent_change_24h >= 0
                      ? Colors.green
                      : Colors.red),
              child: Center(
                child: Text(
                  Crypto.percent_change_24h.toString(),
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
                  children: [SvgPicture.network(Crypto.urlimage)],
                ),
                SizedBox(
                  width: 8,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      Crypto.key.toString(),
                      style: TextStyle(
                          fontSize: 10,
                          fontFamily: "GM",
                          color: ProjectColors().shade2),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      Crypto.price.toString(),
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
                      Text(Crypto.volume_24h.toString()),
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

class thirdwidget extends StatefulWidget {
  const thirdwidget({super.key});

  @override
  State<thirdwidget> createState() => _thirdwidgetState();
}

class _thirdwidgetState extends State<thirdwidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CryptotBloc, CryptosState>(builder: (context, state) {
      return Container(
        height: 100,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: ProjectColors().wihte, boxShadow: [
          BoxShadow(
              color: ProjectColors().gray100,
              blurRadius: 3,
              offset: Offset(0, -10))
        ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text(
                        "0.0%",
                        style: TextStyle(
                          fontFamily: "GM",
                          color: ProjectColors().shade2,
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text("USDT/IRR")
                    ],
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    "1.0",
                    style: TextStyle(fontSize: 16, fontFamily: "GM"),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      Text(
                        "تومان",
                        style: TextStyle(fontFamily: "GM", fontSize: 12),
                      ),
                      if (state is CryptossuccessState) ...{
                        state.cryptoPricesIRLS.fold((l) {
                          return Text(
                            l,
                            style: TextStyle(fontFamily: "GM", fontSize: 12),
                          );
                        }, (r) {
                          List<CryptocurrencyMetrics> usdt = r
                              .where((element) => element.name == "usdt")
                              .toList();
                          return Text(
                            usdt[0].latest.toString(),
                            style: TextStyle(fontFamily: "GM", fontSize: 12),
                          );
                        })
                      }
                    ],
                  )
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      if (state is CryptossuccessState) ...{
                        state.cryptos.fold((l) {
                          return Text(
                            l,
                            style: TextStyle(fontSize: 16, fontFamily: "GM"),
                          );
                        }, (r) {
                          List<crypto> ETH = r
                              .where((element) => element.key == "ETH")
                              .toList();
                          return Text(
                            ETH[0]
                                .percent_change_24h
                                .toString()
                                .substring(0, 5),
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: "GM",
                              color: ETH[0].percent_change_24h > 0
                                  ? ProjectColors().green
                                  : ProjectColors().red,
                            ),
                          );
                        })
                      },
                      SizedBox(
                        width: 8,
                      ),
                      Text("ETH / IRR")
                    ],
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  if (state is CryptossuccessState) ...{
                    state.cryptos.fold((l) {
                      return Text(
                        "NAVID",
                        style: TextStyle(fontSize: 16, fontFamily: "GM"),
                      );
                    }, (r) {
                      List<crypto> ETH =
                          r.where((element) => element.key == "ETH").toList();
                      return Text(
                        ETH[0].price.toString(),
                        style: TextStyle(fontSize: 16, fontFamily: "GM"),
                      );
                    })
                  },
                  SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      Text(
                        "تومان",
                        style: TextStyle(fontFamily: "GM", fontSize: 12),
                      ),
                      if (state is CryptossuccessState) ...{
                        state.cryptoPricesIRLS.fold((l) {
                          return Text(
                            l,
                            style: TextStyle(fontFamily: "GM", fontSize: 12),
                          );
                        }, (r) {
                          List<CryptocurrencyMetrics> eth = r
                              .where((element) => element.name == "eth")
                              .toList();
                          return Text(
                            eth[0].latest.toString(),
                            style: TextStyle(fontFamily: "GM", fontSize: 12),
                          );
                        })
                      }
                    ],
                  )
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      if (state is CryptossuccessState) ...{
                        state.cryptos.fold((l) {
                          return Text(
                            l,
                            style: TextStyle(fontSize: 16, fontFamily: "GM"),
                          );
                        }, (r) {
                          List<crypto> ETH = r
                              .where((element) => element.key == "BTC")
                              .toList();
                          return Text(
                            ETH[0]
                                .percent_change_24h
                                .toString()
                                .substring(0, 5),
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: "GM",
                              color: ETH[0].percent_change_24h > 0
                                  ? ProjectColors().green
                                  : ProjectColors().red,
                            ),
                          );
                        })
                      },
                      SizedBox(
                        width: 8,
                      ),
                      Text("BTC / IRR")
                    ],
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  if (state is CryptossuccessState) ...{
                    state.cryptos.fold((l) {
                      return Text(
                        l,
                        style: TextStyle(fontSize: 16, fontFamily: "GM"),
                      );
                    }, (r) {
                      List<crypto> BTC =
                          r.where((element) => element.key == "BTC").toList();
                      return Text(
                        BTC[0].price.toString(),
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: "GM",
                            color: Colors.black),
                      );
                    })
                  },
                  SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      Text(
                        "تومان",
                        style: TextStyle(fontFamily: "GM", fontSize: 12),
                      ),
                      if (state is CryptossuccessState) ...{
                        state.cryptoPricesIRLS.fold((l) {
                          return Text(
                            l,
                            style: TextStyle(fontFamily: "GM", fontSize: 12),
                          );
                        }, (r) {
                          List<CryptocurrencyMetrics> btc = r
                              .where((element) => element.name == "btc")
                              .toList();
                          return Text(
                            btc[0].latest.toString(),
                            style: TextStyle(fontFamily: "GM", fontSize: 12),
                          );
                        })
                      }
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}

class secondwidget extends StatelessWidget {
  const secondwidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: ProjectColors().wihte,
        boxShadow: [
          BoxShadow(
              color: Color.fromARGB(255, 228, 223, 223), //New
              blurRadius: 1,
              offset: Offset(0, -1))
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 25, right: 27),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/Chart_pin.png"),
                Text(
                  "نمایه بازار",
                  style: TextStyle(
                      fontFamily: "GM",
                      fontSize: 10,
                      color: ProjectColors().shade1),
                ),
                SizedBox(
                  height: 21,
                ),
                Image.asset("assets/images/Add_ring_light.png"),
                Text(
                  "ارزهای جدید",
                  style: TextStyle(
                      fontFamily: "GM",
                      fontSize: 10,
                      color: ProjectColors().shade1),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/Arrow_alt_ltop.png"),
                Text(
                  "برداشت",
                  style: TextStyle(
                      fontFamily: "GM",
                      fontSize: 10,
                      color: ProjectColors().shade1),
                ),
                SizedBox(
                  height: 21,
                ),
                Image.asset("assets/images/icon.png"),
                Text(
                  "ربات تریدر",
                  style: TextStyle(
                      fontFamily: "GM",
                      fontSize: 10,
                      color: ProjectColors().shade1),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/Arrow_alt_ltop (1).png"),
                Text(
                  "واریز",
                  style: TextStyle(
                      fontFamily: "GM",
                      fontSize: 10,
                      color: ProjectColors().shade1),
                ),
                SizedBox(
                  height: 21,
                ),
                Image.asset("assets/images/Group_add_light.png"),
                Text(
                  "دعوت ..",
                  style: TextStyle(
                      fontFamily: "GM",
                      fontSize: 10,
                      color: ProjectColors().shade1),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/Chart_light.png"),
                Text(
                  "سفارشات شما",
                  style: TextStyle(
                      fontFamily: "GM",
                      fontSize: 10,
                      color: ProjectColors().shade1),
                ),
                SizedBox(
                  height: 21,
                ),
                Image.asset("assets/images/User_scan.png"),
                Text(
                  "احراز هویت",
                  style: TextStyle(
                      fontFamily: "GM",
                      fontSize: 10,
                      color: ProjectColors().shade1),
                )
              ],
            ),
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
    return Container(
      height: 204,
      width: MediaQuery.of(context).size.width,
      color: ProjectColors().white2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            height: 31,
          ),
          searchcryptowidget(),
          SizedBox(
            height: 45,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [dayandweekdashboard(), Spacer(), inventorywidget()],
            ),
          )
        ],
      ),
    );
  }
}

class inventorywidget extends StatelessWidget {
  const inventorywidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 136,
      height: 56,
      color: ProjectColors().white2,
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
          )
        ],
      ),
    );
  }
}

class searchcryptowidget extends StatelessWidget {
  const searchcryptowidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Image.asset("assets/images/bell.png"),
          SizedBox(
            width: 16,
          ),
          Image.asset("assets/images/Headphones_fill.png"),
          SizedBox(
            width: 40,
          ),
          Container(
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
                            )))),
                SizedBox(
                  width: 6,
                ),
                Image.asset("assets/images/Search.png"),
              ],
            ),
          ),
          Spacer(),
          CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage("assets/images/avatar.png"),
          ),
        ],
      ),
    );
  }
}

class dayandweekdashboard extends StatelessWidget {
  const dayandweekdashboard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 72,
      decoration: BoxDecoration(
          color: ProjectColors().wihte,
          borderRadius: BorderRadius.all(Radius.circular(8)),
          border: Border.all(color: ProjectColors().gray100, width: 1)),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              SizedBox(
                height: 8,
              ),
              Text(
                "هفته گذشته",
                style: TextStyle(fontFamily: "GM", fontSize: 8),
              ),
              Text(
                "175,960",
                style: TextStyle(
                    fontFamily: "GM", fontSize: 10, color: Colors.red),
              ),
              SizedBox(
                height: 8,
              ),
              Image.asset("assets/images/bottom.png")
            ],
          ),
          Column(
            children: [
              SizedBox(
                height: 8,
              ),
              Text(
                "روز گذشته",
                style: TextStyle(fontFamily: "GM", fontSize: 8),
              ),
              Text(
                "146,700",
                style: TextStyle(
                    fontFamily: "GM", fontSize: 10, color: Colors.green),
              ),
              SizedBox(
                height: 8,
              ),
              Image.asset("assets/images/bottom (1).png")
            ],
          ),
        ],
      ),
    );
  }
}

class tabbarviewdelegate extends SliverPersistentHeaderDelegate {
  tabbarviewdelegate(this.tabbar);
  TabBar tabbar;
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return pinedHeaderofCryptos(tabbar: tabbar);
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => 90;

  @override
  // TODO: implement minExtent
  double get minExtent => 90;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

class pinedHeaderofCryptos extends StatelessWidget {
  const pinedHeaderofCryptos({
    super.key,
    required this.tabbar,
  });

  final TabBar tabbar;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: ProjectColors().wihte,
          child: tabbar,
        ),
        Container(
          color: ProjectColors().wihte,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              SizedBox(
                height: 20,
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
                        "قیمت / ارز",
                        style: TextStyle(
                            fontSize: 10,
                            fontFamily: "GM",
                            color: ProjectColors().shade2),
                      ),
                      SizedBox(
                        width: 120,
                      ),
                      Text("حجم معاملات روزانه",
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
            ],
          ),
        ),
      ],
    );
  }
}
