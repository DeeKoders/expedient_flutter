import 'dart:convert';
import 'dart:io';
import 'package:expedient_flutter/screens/home.dart';
import 'package:expedient_flutter/widgets/data_card.dart';
import 'package:expedient_flutter/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Resources extends StatefulWidget {
  const Resources({super.key});

  @override
  State<Resources> createState() => _ResourcesState();
}

class _ResourcesState extends State<Resources> {
  var loading = false;
  List<dynamic> resources = [];

  void fetchResourcesDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      loading = true;
    });
    String token = prefs.getString('token').toString();
    String userId = prefs.getInt('user_id').toString();
    final response = await http.get(
      Uri.parse(
          'http://staging.expedientvms.com/api/clients/$userId/candidates'),
      headers: {
        HttpHeaders.authorizationHeader: "BEARER $token",
      },
    );
    setState(() {
      loading = false;
    });
    if (response.statusCode == 200) {
      setState(() {
        resources = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to load ResourcesDetails');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchResourcesDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Resources")),
      drawer: const Drawer(
        child: MyDrawer(width: 20),
      ),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: resources.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Home()),
                  ),
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: DataCard(
                          title: resources[index]["fullName"],
                          subTitle: resources[index]["email"],
                          extraInfo:
                              "Contact Number: ${resources[index]["cellPhone"]}",
                          label: resources[index]["profileStatus"])),
                );
              }),
    );
  }
}
