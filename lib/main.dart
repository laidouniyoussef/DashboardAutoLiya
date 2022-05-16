import 'package:dashboard_screen/components/card_custom.dart';
import 'package:dashboard_screen/components/circle_progress.dart';
import 'package:dashboard_screen/components/list_tile_custom.dart';
import 'package:dashboard_screen/themes.dart';
import 'package:dashboard_screen/widget/MonthStats/line_chart_widget.dart';
import 'package:dashboard_screen/widget/WeekStats/line_chart_widget.dart';
import 'package:flutter/material.dart';
import 'animated_toggle.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: bgColor),
      home: DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({
    Key? key,
  }) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardScreen> {
  static int _toggleValue = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Image.asset('assets/images/autoliya.png', width: 80, height: 60),

        //   SvgPicture.asset(
        //   "assets/icons/message.svg",
        //
        // ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: size.width / 2 - 20,
                        child: Column(
                          children: [
                            CustomPaint(
                              foregroundPainter: CircleProgress(),
                              child: SizedBox(
                                width: 107,
                                height: 107,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "214",
                                      style: textBold,
                                    ),
                                    Text(
                                      "REACH",
                                      style: textSemiBold,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.arrow_upward_outlined,
                                          color: Color(0xFFFF6600),
                                          size: 14,
                                        ),
                                        Text(
                                          "8.1%",
                                          style: textSemiBold,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Text(
                              "NEW ACHIEVMENT",
                              style: textBold2,
                            ),
                            Text(
                              "Social Star",
                              style: textBold3,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: size.width / 2 - 20,
                        height: 180,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    "assets/images/dashboardicon.png"))),
                      )
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 6,
                  color: sparatorColor,
                ),
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      AnimatedToggle(
                        values: ['This Week', 'This Month'],
                        onToggleCallback: (value) {
                          setState(() {
                            _toggleValue = value;
                          });
                        },
                        buttonColor: const Color(0xFFFF6600),
                        backgroundColor:
                            const Color.fromARGB(255, 248, 218, 198),
                        textColor: const Color(0xFFFFFFFF),
                      ),

                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          CardCustom(
                            width: size.width / 2 - 23,
                            height: 88.9,
                            mLeft: 0,
                            mRight: 3,
                            child: ListTileCustom(
                              bgColor: purpleLight,
                              pathIcon: "line.svg",
                              title: "VISITS",
                              subTitle: _toggleValue == 0 ? "370" : "2395",
                            ),
                          ),
                          CardCustom(
                            width: size.width / 2 - 23,
                            height: 88.9,
                            mLeft: 3,
                            mRight: 0,
                            child: ListTileCustom(
                              bgColor: greenLight,
                              pathIcon: "thumb_up.svg",
                              title: "LIKES",
                              subTitle: _toggleValue == 0 ? "58" : "131",
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          CardCustom(
                            width: size.width / 2 - 23,
                            height: 88.9,
                            mLeft: 0,
                            mRight: 3,
                            child: ListTileCustom(
                              bgColor: yellowLight,
                              pathIcon: "starts.svg",
                              title: "PARKING",
                              subTitle: _toggleValue == 0 ? "26" : "67",
                            ),
                          ),
                          CardCustom(
                            width: size.width / 2 - 23,
                            height: 88.9,
                            mLeft: 3,
                            mRight: 0,
                            child: ListTileCustom(
                              bgColor: blueLight,
                              pathIcon: "eyes.svg",
                              title: "VIEWS",
                              subTitle: _toggleValue == 0 ? "1142" : "4707",
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: size.width,
                        height: 250,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32),
                          ),
                          color: bgColor,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 16),
                            child: _toggleValue == 0
                                ? LineChartWeekWidget()
                                : LineCharMonthtWidget(),
                          ),
                        ),
                      ),
                      // CardCustom(
                      //     mLeft: 0,
                      //     mRight: 0,
                      //     width: size.width - 40,
                      //     height: 250,
                      //     child: Column(
                      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //       children: [
                      //         Padding(
                      //           padding: const EdgeInsets.all(20),
                      //           child: Row(
                      //             children: [
                      //               Container(
                      //                 width: 9.71,
                      //                 height: 9.71,
                      //                 decoration: BoxDecoration(
                      //                     shape: BoxShape.circle,
                      //                     color: purple2),
                      //               ),
                      //               SizedBox(
                      //                 width: 6,
                      //               ),
                      //               Text(
                      //                 "Visits",
                      //                 style: label,
                      //               ),
                      //               SizedBox(
                      //                 width: 12,
                      //               ),
                      //               Container(
                      //                 width: 9.71,
                      //                 height: 9.71,
                      //                 decoration: BoxDecoration(
                      //                     shape: BoxShape.circle, color: green),
                      //               ),
                      //               SizedBox(
                      //                 width: 6,
                      //               ),
                      //               Text(
                      //                 "Likes",
                      //                 style: label,
                      //               ),
                      //               SizedBox(
                      //                 width: 12,
                      //               ),
                      //               Container(
                      //                 width: 9.71,
                      //                 height: 9.71,
                      //                 decoration: BoxDecoration(
                      //                     shape: BoxShape.circle, color: red),
                      //               ),
                      //               SizedBox(
                      //                 width: 6,
                      //               ),
                      //               Text(
                      //                 "Conversions",
                      //                 style: label,
                      //               ),
                      //               SizedBox(
                      //                 width: 12,
                      //               ),
                      //             ],
                      //           ),
                      //         ),
                      //         Container(
                      //           width: size.width - 40,
                      //           height: 144.35,
                      //           decoration: BoxDecoration(
                      //               borderRadius: BorderRadius.only(
                      //                 bottomLeft: Radius.circular(15),
                      //                 bottomRight: Radius.circular(15),
                      //               ),
                      //               image: DecorationImage(
                      //                   image: AssetImage(
                      //                       "assets/images/graph.png"),
                      //                   fit: BoxFit.fill)),
                      //         )
                      //       ],
                      //     )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   elevation: 0,
      //   backgroundColor: Colors.transparent,
      //   showSelectedLabels: false,
      //   showUnselectedLabels: false,
      //   currentIndex: 0,
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: SizedBox(
      //         width: 30,
      //         height: 30,
      //         child: SvgPicture.asset("assets/icons/home.svg"),
      //       ),
      //       label: "Home",
      //     ),
      //     BottomNavigationBarItem(
      //       icon: SizedBox(
      //         width: 30,
      //         height: 30,
      //         child: SvgPicture.asset("assets/icons/chart.svg"),
      //       ),
      //       label: "Chart",
      //     ),
      //     BottomNavigationBarItem(
      //       icon: SizedBox(
      //         width: 30,
      //         height: 30,
      //         child: SvgPicture.asset("assets/icons/bell.svg"),
      //       ),
      //       label: "Bell",
      //     ),
      //     BottomNavigationBarItem(
      //       icon: SizedBox(
      //         width: 30,
      //         height: 30,
      //         child: SvgPicture.asset("assets/icons/maps.svg"),
      //       ),
      //       label: "Maps",
      //     ),
      //     BottomNavigationBarItem(
      //       icon: SizedBox(
      //         width: 30,
      //         height: 30,
      //         child: SvgPicture.asset("assets/icons/profile.svg"),
      //       ),
      //       label: "Profile",
      //     ),
      //   ],
      // ),
    );
  }
}
