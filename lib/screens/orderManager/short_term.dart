import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:expedient_flutter/models/short_term_model.dart';
import 'package:expedient_flutter/screens/home.dart';
import 'package:expedient_flutter/widgets/data_card.dart';
import 'package:expedient_flutter/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ShortTermOrder extends StatefulWidget {
  const ShortTermOrder({super.key});

  @override
  State<ShortTermOrder> createState() => _ShortTermOrderState();
}

class _ShortTermOrderState extends State<ShortTermOrder> {
  var loading = false;
  //Map<String, dynamic> orders = {};
  var orders = [];
  fetchOrders() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      loading = true;
    });
    String token = prefs.getString('token').toString();
    String userId = prefs.getInt('user_id').toString();
    final response = await http.get(
      Uri.parse(
          'https://staging.api.expedientvms.com/api/clients/$userId/orders?page=0&size=10&type=Per+Diem,Allied&status=Requested,Confirmed,Void,Recommended'),
      headers: {
        HttpHeaders.authorizationHeader: "BEARER $token",
      },
    );
    setState(() {
      loading = false;
    });
    if (response.statusCode == 200) {
      setState(() {
        orders.add(jsonDecode(response.body));
      });

      //order.
      debugPrint(orders.toString());
      AllOrders.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load ResourcesDetails');
    }
  }

  late Future<AllOrders> futureOrders;
  @override
  void initState() {
    super.initState();
    fetchOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Short Term Orders")),
      drawer: const Drawer(
        child: MyDrawer(width: 20),
      ),
      body: loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: orders.first['data'].length,
              itemBuilder: ((context, index) {
                return GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Home()),
                  ),
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: DataCard(
                          // title: 'Order No. ${orders[index]["id"]}',

                          title:
                              'Order No. ${orders.first['data'][index]['id']}',
                          // subTitle: orders["$index"]["candidate"] == null
                          subTitle: orders.first['data'][index]['candidate'] ==
                                  null
                              ? 'Candidate: Not Available'
                              : "Candidate: ${orders.first['data'][index]['candidate']['firstName']}",
                          extraInfo:
                              "Client: ${orders.first['data'][index]['client']['name']}",
                          label: orders.first['data'][index]['status'])),
                );
              })),
    );
  }
}
