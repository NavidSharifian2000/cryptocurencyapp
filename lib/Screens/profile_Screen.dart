import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iranicart_crypto/data/datasource/cryptosinfo_datasource.dart';
import 'package:iranicart_crypto/data/repository/cryptoinfo_Repository.dart';
import 'package:iranicart_crypto/di/di.dart';

import '../constance/Colors.dart';
import 'dashboard.dart';

class profile_Screen extends StatelessWidget {
  const profile_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: firstwidget()),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 24,
              ),
            ),
            SliverToBoxAdapter(
              child: secondwidget(),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            ),
            SliverToBoxAdapter(
              child: thirdwidget(),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 31,
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        Image.asset("assets/images/Vector 9.png"),
                        Spacer(),
                        Text(
                          "تاریخچه",
                          style: TextStyle(fontFamily: "GM"),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Image.asset("assets/images/File_dock (1).png")
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    )
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        Image.asset("assets/images/Vector 9.png"),
                        Spacer(),
                        Text(
                          "کارمزدهای برنامه",
                          style: TextStyle(fontFamily: "GM"),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Image.asset("assets/images/Percent.png")
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    )
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 4,
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        Image.asset("assets/images/Vector 9.png"),
                        Spacer(),
                        Text(
                          "امنیت برنامه",
                          style: TextStyle(fontFamily: "GM"),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Image.asset("assets/images/Chield_check.png")
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    )
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        Image.asset("assets/images/Vector 9.png"),
                        Spacer(),
                        Text(
                          "اعلان ها",
                          style: TextStyle(fontFamily: "GM"),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Image.asset("assets/images/bell.png")
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    )
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        Image.asset("assets/images/Vector 9.png"),
                        Spacer(),
                        Text(
                          "اموزش های استفاده",
                          style: TextStyle(fontFamily: "GM"),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Image.asset("assets/images/table_settings.png")
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    )
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        CupertinoSwitch(
                            activeColor: ProjectColors().yellow,
                            value: true,
                            onChanged: (value) {
                              print("navid");
                            }),
                        Spacer(),
                        Text(
                          "روشن/تاریک",
                          style: TextStyle(fontFamily: "GM"),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Image.asset("assets/images/Percent.png")
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    )
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 4,
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        Image.asset("assets/images/Vector 9.png"),
                        Spacer(),
                        Text(
                          "دعوت دوستان",
                          style: TextStyle(fontFamily: "GM"),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Image.asset("assets/images/User_add_alt.png")
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    )
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        Image.asset("assets/images/Vector 9.png"),
                        Spacer(),
                        Text(
                          "تنظیمات",
                          style: TextStyle(fontFamily: "GM"),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Image.asset("assets/images/Setting_alt_line (2).png")
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    )
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        Image.asset("assets/images/Vector 9.png"),
                        Spacer(),
                        Text(
                          "اشتراک برنامه",
                          style: TextStyle(fontFamily: "GM"),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Image.asset("assets/images/group_share.png")
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    )
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        Image.asset("assets/images/Vector 9.png"),
                        Spacer(),
                        Text(
                          "خروج از برنامه",
                          style: TextStyle(fontFamily: "GM"),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Image.asset("assets/images/External.png")
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
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
        decoration: BoxDecoration(
            color: Color(0xff99EAEAEA), borderRadius: BorderRadius.circular(8)),
        width: MediaQuery.of(context).size.width,
        height: 70,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              width: 100,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: ProjectColors().green),
                  onPressed: () async {
                    ICryotoInfoDataSource a = locator.get();
                    var b = await a.getUSDTInRLS();
                    print(b[2].name);
                  },
                  child: Text(
                    "دریافت",
                    style: TextStyle(color: Colors.white, fontFamily: "GM"),
                  )),
            ),
            Spacer(),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "هدیه برنامه",
                      style: TextStyle(fontFamily: "GB", fontSize: 15),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: [
                        Text(
                          "جایزه اولین ورود به برنامه",
                          style: TextStyle(
                            fontFamily: "GM",
                            fontSize: 14,
                            color: ProjectColors().shade2,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              width: 10,
            ),
            Image.asset("assets/images/star 1.png")
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 66,
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Image.asset("assets/images/level.png"),
            Spacer(),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "nsharifian0910@gmail.com",
                      style: TextStyle(fontFamily: "GM"),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        Image.asset("assets/images/Copy_alt.png"),
                        SizedBox(
                          width: 10,
                        ),
                        Text("345654",
                            style: TextStyle(
                              fontFamily: "GM",
                              color: ProjectColors().shade2,
                            )),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "کد دعوت",
                          style: TextStyle(
                              fontFamily: "GM", color: ProjectColors().shade2),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              width: 10,
            ),
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage("assets/images/avatar.png"),
            )
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
    return Column(
      children: [
        SizedBox(
          height: 30,
        ),
        Padding(
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
              Spacer(),
              Image.asset("assets/images/Add.png"),
            ],
          ),
        ),
      ],
    );
  }
}
