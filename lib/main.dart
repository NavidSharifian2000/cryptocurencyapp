import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:iranicart_crypto/Screens/dashboard.dart';
import 'package:iranicart_crypto/Screens/exchange_Screen.dart';
import 'package:iranicart_crypto/Screens/myValet_Screen.dart';
import 'package:iranicart_crypto/Screens/profile_Screen.dart';
import 'package:iranicart_crypto/Screens/stores_Screen.dart';
import 'package:iranicart_crypto/bloc/cryptosinfo_bloc/cryptos_bloc.dart';
import 'package:iranicart_crypto/bloc/cryptosinfo_bloc/cryptos_event.dart';
import 'package:iranicart_crypto/constance/Colors.dart';
import 'package:iranicart_crypto/di/di.dart';

void main() {
  getInit();
  runApp(Main_Screen());
}

class Main_Screen extends StatefulWidget {
  Main_Screen({super.key});

  @override
  State<Main_Screen> createState() => _Main_ScreenState();
}

class _Main_ScreenState extends State<Main_Screen> {
  var bloc;
  int selectedBottomnavigation = 0;

  @override
  void dispose() {
    // TODO: implement dispose
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        bottomNavigationBar: Container(
          width: MediaQuery.of(context).size.width,
          height: 75,
          child: Column(
            children: [
              Spacer(),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    width: 16,
                  ),
                  Visibility(
                    visible: (selectedBottomnavigation == 0 ? true : false),
                    child: Container(
                      width: 40,
                      height: 2,
                      color: Colors.yellow,
                    ),
                  ),
                  SizedBox(
                    width: 80,
                  ),
                  Visibility(
                    visible: (selectedBottomnavigation == 1 ? true : false),
                    child: Container(
                      width: 40,
                      height: 2,
                      color: Colors.yellow,
                    ),
                  ),
                  SizedBox(
                    width: 80,
                  ),
                  Visibility(
                    visible: (selectedBottomnavigation == 2 ? true : false),
                    child: Container(
                      width: 40,
                      height: 2,
                      color: Colors.yellow,
                    ),
                  ),
                  SizedBox(
                    width: 80,
                  ),
                  Visibility(
                    visible: (selectedBottomnavigation == 3 ? true : false),
                    child: Container(
                      width: 40,
                      height: 2,
                      color: Colors.yellow,
                    ),
                  ),
                  SizedBox(
                    width: 75,
                  ),
                  Visibility(
                    visible: (selectedBottomnavigation == 4 ? true : false),
                    child: Container(
                      width: 40,
                      height: 2,
                      color: Colors.yellow,
                    ),
                  ),
                ],
              ),
              BottomNavigationBar(
                  currentIndex: selectedBottomnavigation,
                  onTap: (value) {
                    setState(() {
                      selectedBottomnavigation = value;
                    });
                  },
                  type: BottomNavigationBarType.fixed,
                  unselectedFontSize: 12,
                  unselectedLabelStyle: TextStyle(fontFamily: "GM"),
                  unselectedItemColor: ProjectColors().shade2,
                  selectedLabelStyle: TextStyle(fontFamily: "GM", fontSize: 12),
                  selectedItemColor: ProjectColors().yellow,
                  items: [
                    BottomNavigationBarItem(
                        activeIcon: Image.asset("assets/images/user.png"),
                        icon: Image.asset("assets/images/u-ser.png"),
                        label: "پروفایل"),
                    BottomNavigationBarItem(
                        activeIcon: Image.asset("assets/images/C-hart_alt.png"),
                        icon: Image.asset("assets/images/Chart_alt.png"),
                        label: "مبادله"),
                    BottomNavigationBarItem(
                        activeIcon: Image.asset("assets/images/C-hart_alt.png"),
                        icon: Image.asset("assets/images/Chart_alt.png"),
                        label: "بازارها"),
                    BottomNavigationBarItem(
                        activeIcon: Image.asset("assets/images/wallet.png"),
                        icon: Image.asset("assets/images/w-allet.png"),
                        label: "کیف پول"),
                    BottomNavigationBarItem(
                        activeIcon: Image.asset("assets/images/h-ome.png"),
                        icon: Image.asset("assets/images/home.png"),
                        label: "خانه")
                  ]),
            ],
          ),
        ),
        body: getScreens().elementAt(selectedBottomnavigation),
      ),
    );
  }

  List<Widget> getScreens() {
    return <Widget>[
      profile_Screen(),
      exchange_screen(),
      store_screen(),
      myValet_Screen(),
      BlocProvider<CryptotBloc>.value(
        value: locator.get<CryptotBloc>(),
        child: dasboard_Screen(),
      )
    ];
  }
}
