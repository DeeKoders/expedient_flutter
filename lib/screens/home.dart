import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:expedient_flutter/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:expedient_flutter/constants.dart' as constants;
import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var loading = false;

  Future<DashboardStatistics> fetchDashboardStatistics() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      loading = true;
    });
    String token = prefs.getString('token').toString();
    String userId = prefs.getInt('user_id').toString();

    final response = await http.get(
      Uri.parse(
          'https://staging.api.expedientvms.com/api/clients/$userId/dashboard'),
      headers: {
        HttpHeaders.authorizationHeader: "BEARER $token",
      },
    );
    setState(() {
      loading = false;
    });
    log(response.body.toString());
    if (response.statusCode == 200) {
      return DashboardStatistics.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load DashboardStatistics');
    }
  }

  late Future<DashboardStatistics> futureDashboardStatistics;

  @override
  void initState() {
    super.initState();
    futureDashboardStatistics = fetchDashboardStatistics();
  }

  final gradientList = <List<Color>>[
    [
      const Color.fromRGBO(223, 250, 92, 1),
      const Color.fromRGBO(129, 250, 112, 1),
    ],
    [
      const Color.fromRGBO(129, 182, 205, 1),
      const Color.fromRGBO(91, 253, 199, 1),
    ],
    [
      const Color.fromRGBO(175, 63, 62, 1.0),
      const Color.fromRGBO(254, 154, 92, 1),
    ]
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Client - Expedient VMS")),
      drawer: const Drawer(
        child: MyDrawer(width: 10),
      ),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(shrinkWrap: true, children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    // border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12)),
                  ),
                  alignment: Alignment.center,
                  height: 80,
                  width: double.infinity,
                  // color: Colors.blue,
                  child: const Text(
                    "ORDER STATISTICS",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      letterSpacing: 2.0,
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                FutureBuilder<DashboardStatistics>(
                  future: futureDashboardStatistics,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      Map<String, int> dataMap = {};
                      // dataMap.putIfAbsent("Confirmed", () => 5);
                      // dataMap.putIfAbsent("Open Requests", () => 7);
                      // dataMap.putIfAbsent("Pending", () => 5);

                      dataMap.putIfAbsent(
                          "Completed", () => snapshot.data!.completed);
                      dataMap.putIfAbsent(
                          "Open Requests", () => snapshot.data!.openRequests);
                      dataMap.putIfAbsent(
                          "Assignments", () => snapshot.data!.assignments);
                      dataMap.putIfAbsent(
                          "Voided", () => snapshot.data!.voided);
                      // debugPrint(dataMap.keys.toList().runtimeType.toString());
                      return Column(
                        children: [
                          for (int i = 0; i < dataMap.length; i++)
                            ListTile(
                                horizontalTitleGap: 10,
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                tileColor: Colors.blue,
                                textColor: Colors.white,
                                iconColor: Colors.white,
                                leading: const Icon(
                                  Icons.date_range,
                                  size: 25,
                                ),
                                title: Text(
                                  dataMap.keys.toList()[i],
                                  style: const TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                trailing: Text(
                                  dataMap.values.toList()[i].toString(),
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ))
                        ],
                      );
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }

                    // By default, show a loading spinner.
                    return SizedBox(
                        child: LiquidCircularProgressIndicator(
                      value: 0.25, // Defaults to 0.5.
                      valueColor: const AlwaysStoppedAnimation(Colors
                          .pink), // Defaults to the current Theme's accentColor.
                      backgroundColor: Colors
                          .white, // Defaults to the current Theme's backgroundColor.
                      borderColor: Colors.red,
                      borderWidth: 5.0,
                      direction: Axis
                          .horizontal, // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.vertical.
                      center: const Text("Loading..."),
                    )

                        // child: LiquidCircularProgressIndicator(
                        //   value: 0.5, // Defaults to 0.5.
                        //   valueColor: const AlwaysStoppedAnimation(Colors
                        //       .pink), // Defaults to the current Theme's accentColor.
                        //   backgroundColor: Colors.grey[
                        //       300], // Defaults to the current Theme's backgroundColor.
                        //   borderColor: Colors.red,
                        //   borderWidth: 5.0,

                        //   direction: Axis
                        //       .horizontal, // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.vertical.
                        //   center: const Text("Loading..."),
                        // ),
                        );
                  },
                ),
                SizedBox(
                  height: 20,
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    color: Colors.blue,
                    child: const Text(""),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      // border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    // color: Colors.white,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                          child: Container(
                            height: 50,
                            width: double.infinity,
                            color: Colors.white,
                            child: const Text(""),
                          ),
                        ),
                        const Align(
                          alignment: Alignment.center,
                          child: Text(
                            "ORDER FILL-RATES",
                            style: TextStyle(
                                fontSize: 24,
                                letterSpacing: 2.0,
                                fontWeight: FontWeight.w800),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        FutureBuilder<DashboardStatistics>(
                          future: futureDashboardStatistics,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              Map<String, double> dataMap = {};
                              // dataMap.putIfAbsent("Confirmed", () => 5);
                              // dataMap.putIfAbsent("Open Requests", () => 7);
                              // dataMap.putIfAbsent("Pending", () => 5);
                              dataMap.putIfAbsent("Allied",
                                  () => snapshot.data!.allied.toDouble());
                              dataMap.putIfAbsent("Per Diem",
                                  () => snapshot.data!.perDiem.toDouble());
                              dataMap.putIfAbsent("Local Long Term",
                                  () => snapshot.data!.longTerm.toDouble());
                              dataMap.putIfAbsent("Travel",
                                  () => snapshot.data!.travel.toDouble());
                              return PieChart(
                                dataMap: dataMap,
                                animationDuration:
                                    const Duration(milliseconds: 1000),
                                chartLegendSpacing: 24.0,
                                chartRadius:
                                    MediaQuery.of(context).size.width / 1.5,
                                centerText: "Short Term Orders",
                                emptyColor: Colors.blue,
                                chartValuesOptions: const ChartValuesOptions(
                                    showChartValuesInPercentage: true),
                                gradientList: gradientList,
                                legendOptions: const LegendOptions(
                                    legendPosition: LegendPosition.bottom,
                                    showLegendsInRow: true),
                              );
                            } else if (snapshot.hasError) {
                              return Text('${snapshot.error}');
                            }

                            // By default, show a loading spinner.
                            return Transform.scale(
                              scale: 1,
                              child: const CircularProgressIndicator(),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                )
              ]),
            ),
    );
  }
}

class DashboardStatistics {
  final int openRequests;
  final int assignments;
  final int voided;
  final int completed;
  final int allied;
  final int perDiem;
  final int longTerm;
  final int travel;

  const DashboardStatistics(
      {required this.openRequests,
      required this.assignments,
      required this.completed,
      required this.voided,
      required this.allied,
      required this.longTerm,
      required this.travel,
      required this.perDiem});

  factory DashboardStatistics.fromJson(Map<String, dynamic> json) {
    return DashboardStatistics(
        openRequests: json['Requested'],
        assignments: json['Completed'],
        voided: json['Void'],
        completed: json['Completed'],
        allied: json['Allied'],
        longTerm: json['Local Long Term'],
        travel: json['Travel'],
        perDiem: json['Per Diem']);
  }
}
