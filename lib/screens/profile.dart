import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:expedient_flutter/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:expedient_flutter/constants.dart' as constants;

class Profle extends StatefulWidget {
  const Profle({super.key});

  @override
  State<Profle> createState() => _ProfleState();
}

class _ProfleState extends State<Profle> {
  var loading = false;
  late ClientProfile clientProfile;
  Future<ClientProfile> fetchClientProfile() async {
    setState(() {
      loading = true;
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token').toString();
    String userId = prefs.getInt('user_id').toString();
    final response = await http.get(
      Uri.parse(
          'https://staging.api.expedientvms.com/api/clients/$userId/profile?fields=id,firstName,lastName,middleName,email,cellPhone,fk_client_role_id'),
      headers: {
        HttpHeaders.authorizationHeader: "BEARER $token",
      },
    );
    log("LOG${response.body}");

    setState(() {
      loading = false;
    });
    if (response.statusCode == 200) {
      clientProfile = ClientProfile.fromJson(jsonDecode(response.body));
      return ClientProfile.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load ClientProfile');
    }
  }

  late Future<ClientProfile> futureClientProfile;

  @override
  void initState() {
    super.initState();
    futureClientProfile = fetchClientProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Client Profile"),
      ),
      drawer: const Drawer(
        child: MyDrawer(width: 20),
      ),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      // border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(children: [
                      Container(
                        alignment: Alignment.center,
                        height: 70,
                        width: double.infinity,
                        child: const Text(
                          "PROFILE INFORMATION",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            letterSpacing: 2.0,
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      FutureBuilder<ClientProfile>(
                        future: futureClientProfile,
                        builder: (context, snapshot) {
                          debugPrint(snapshot.hasData.toString());
                          if (snapshot.hasData) {
                            Map<String?, String?> dataMap = {};

                            dataMap.putIfAbsent(
                                "First Name", () => snapshot.data!.firstName);
                            dataMap.putIfAbsent(
                                "Last Name", () => snapshot.data!.lastName);
                            dataMap.putIfAbsent(
                                "Email Address", () => snapshot.data!.email);
                            dataMap.putIfAbsent(
                                "Cell Phone", () => snapshot.data!.cellPhone);
                            dataMap.putIfAbsent(
                                "Role", () => snapshot.data!.role!.title ?? '');

                            debugPrint(dataMap.length.toString());
                            return Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                children: <Widget>[
                                  for (int i = 0; i < dataMap.length; i++)
                                    TextFormField(
                                      // ignore: prefer_const_constructors
                                      decoration: InputDecoration(
                                        labelText:
                                            dataMap.keys.toList()[i].toString(),
                                      ),
                                      initialValue:
                                          dataMap.values.toList()[i].toString(),
                                      enabled: false,
                                    ),
                                ],
                              ),
                            );
                          } else if (snapshot.hasError) {
                            return Text('${snapshot.error}');
                          }

                          // By default, show a loading spinner.
                          return const CircularProgressIndicator();
                        },
                      ),
                      const SizedBox(
                        height: 15.0,
                      )
                    ]),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)),
                    // color: Colors.blue,
                    child: Column(children: [
                      Container(
                        alignment: Alignment.center,
                        height: 70,
                        width: double.infinity,
                        child: const Text(
                          "HOSPITAL INFORMATION",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            letterSpacing: 2.0,
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      FutureBuilder<ClientProfile>(
                        future: futureClientProfile,
                        builder: (context, snapshot) {
                          debugPrint(snapshot.hasData.toString());
                          if (snapshot.hasData) {
                            Map<String?, String?> dataMap = {};
                            dataMap.putIfAbsent("Client Name",
                                () => snapshot.data!.client!.name);
                            dataMap.putIfAbsent("Country",
                                () => snapshot.data!.client!.country);
                            dataMap.putIfAbsent(
                                "State", () => snapshot.data!.client!.state);
                            dataMap.putIfAbsent(
                                "City", () => snapshot.data!.client!.city);
                            dataMap.putIfAbsent(
                                "County", () => snapshot.data!.client!.county);
                            dataMap.putIfAbsent("Address",
                                () => snapshot.data!.client!.address);
                            dataMap.putIfAbsent(
                                "Zip Code", () => snapshot.data!.client!.zip);
                            dataMap.putIfAbsent("Cell Phone",
                                () => snapshot.data!.client!.phone);
                            dataMap.putIfAbsent("Website",
                                () => snapshot.data!.client!.website);
                            dataMap.putIfAbsent("Beds",
                                () => snapshot.data!.client!.beds.toString());

                            return Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                children: <Widget>[
                                  for (int i = 0; i < dataMap.length; i++)
                                    TextFormField(
                                      // ignore: prefer_const_constructors
                                      decoration: InputDecoration(
                                        labelText:
                                            dataMap.keys.toList()[i].toString(),
                                      ),
                                      initialValue:
                                          dataMap.values.toList()[i].toString(),
                                      enabled: false,
                                    ),
                                  const SizedBox(height: 16.0),
                                ],
                              ),
                            );
                          } else if (snapshot.hasError) {
                            return Text('${snapshot.error}');
                          }

                          // By default, show a loading spinner.
                          return const CircularProgressIndicator();
                        },
                      ),
                      const SizedBox(
                        height: 15.0,
                      )
                    ]),
                  ),
                ],
              ),
            ),
    );
  }
}

class ClientProfile {
  ClientProfile({
    this.fullName,
    this.isDefaultProfilePhotoApplied,
    this.id,
    this.firstName,
    this.lastName,
    this.middleName,
    this.maidenName,
    this.cellPhone,
    this.profilePhoto,
    this.email,
    this.clientProfileRole,
    this.streetAddress,
    this.apartment,
    this.city,
    this.province,
    this.country,
    this.zip,
    this.county,
    this.archived,
    this.auth0Id,
    this.fkRoleId,
    this.resume,
    this.preferredContact,
    this.homePhone,
    this.workPhone,
    this.otherPhone,
    this.secondaryEmail,
    this.status,
    this.profileStatus,
    this.compliance,
    this.workerType,
    this.fkClientId,
    this.fkVendorId,
    this.salutation,
    this.notes,
    this.createdAt,
    this.updatedAt,
    this.role,
    this.client,
  });

  String? fullName;
  bool? isDefaultProfilePhotoApplied;
  int? id;
  String? firstName;
  String? lastName;
  dynamic middleName;
  dynamic maidenName;
  String? cellPhone;
  String? profilePhoto;
  String? email;
  String? clientProfileRole;
  dynamic streetAddress;
  dynamic apartment;
  dynamic city;
  dynamic province;
  dynamic country;
  dynamic zip;
  bool? archived;
  dynamic county;
  String? auth0Id;
  int? fkRoleId;
  String? preferredContact;
  dynamic resume;
  dynamic homePhone;
  dynamic workPhone;
  dynamic otherPhone;
  String? status;
  dynamic secondaryEmail;
  String? profileStatus;
  String? workerType;
  bool? compliance;
  int? fkClientId;
  dynamic fkVendorId;
  dynamic salutation;
  dynamic notes;
  int? createdAt;
  int? updatedAt;
  Role? role;
  Client? client;

  factory ClientProfile.fromRawJson(String str) =>
      ClientProfile.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ClientProfile.fromJson(Map<String, dynamic> json) => ClientProfile(
        fullName: json["fullName"],
        isDefaultProfilePhotoApplied: json["isDefaultProfilePhotoApplied"],
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        middleName: json["middleName"],
        maidenName: json["maidenName"],
        cellPhone: json["cellPhone"],
        profilePhoto: json["profilePhoto"],
        email: json["email"],
        clientProfileRole: json["role"],
        streetAddress: json["streetAddress"],
        apartment: json["apartment"],
        city: json["city"],
        province: json["province"],
        country: json["country"],
        zip: json["zip"],
        county: json["county"],
        archived: json["archived"],
        auth0Id: json["auth0Id"],
        fkRoleId: json["fk_role_id"],
        resume: json["resume"],
        preferredContact: json["preferredContact"],
        homePhone: json["homePhone"],
        workPhone: json["workPhone"],
        otherPhone: json["otherPhone"],
        secondaryEmail: json["secondaryEmail"],
        status: json["status"],
        profileStatus: json["profileStatus"],
        compliance: json["compliance"],
        workerType: json["workerType"],
        fkClientId: json["fk_client_id"],
        fkVendorId: json["fk_vendor_id"],
        salutation: json["salutation"],
        notes: json["notes"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        role: Role.fromJson(json["Role"]),
        client: Client.fromJson(json["client"]),
      );

  Map<String, dynamic> toJson() => {
        "fullName": fullName,
        "isDefaultProfilePhotoApplied": isDefaultProfilePhotoApplied,
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "middleName": middleName,
        "maidenName": maidenName,
        "cellPhone": cellPhone,
        "profilePhoto": profilePhoto,
        "email": email,
        "role": clientProfileRole,
        "streetAddress": streetAddress,
        "apartment": apartment,
        "city": city,
        "province": province,
        "country": country,
        "zip": zip,
        "county": county,
        "archived": archived,
        "auth0Id": auth0Id,
        "fk_role_id": fkRoleId,
        "resume": resume,
        "preferredContact": preferredContact,
        "homePhone": homePhone,
        "workPhone": workPhone,
        "otherPhone": otherPhone,
        "secondaryEmail": secondaryEmail,
        "status": status,
        "profileStatus": profileStatus,
        "compliance": compliance,
        "workerType": workerType,
        "fk_client_id": fkClientId,
        "fk_vendor_id": fkVendorId,
        "salutation": salutation,
        "notes": notes,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "Role": role!.toJson(),
        "client": client!.toJson(),
      };
}

class Client {
  Client({
    this.id,
    this.name,
    this.email,
    this.address,
    this.status,
    this.city,
    this.state,
    this.zip,
    this.county,
    this.country,
    this.phone,
    this.website,
    this.beds,
    this.teaching,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;
  dynamic email;
  String? address;
  String? status;
  String? city;
  String? state;
  String? zip;
  String? county;
  String? country;
  String? phone;
  String? website;
  int? beds;
  bool? teaching;
  int? createdAt;
  int? updatedAt;

  factory Client.fromRawJson(String str) => Client.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Client.fromJson(Map<String, dynamic> json) => Client(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        address: json["address"],
        status: json["status"],
        city: json["city"],
        state: json["state"],
        zip: json["zip"],
        county: json["county"],
        country: json["country"],
        phone: json["phone"],
        website: json["website"],
        beds: json["beds"],
        teaching: json["teaching"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "address": address,
        "status": status,
        "city": city,
        "state": state,
        "zip": zip,
        "county": county,
        "country": country,
        "phone": phone,
        "website": website,
        "beds": beds,
        "teaching": teaching,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
      };
}

class Invoices {
  Invoices({
    this.read,
    this.modify,
    this.delete,
  });

  bool? read;
  bool? modify;
  bool? delete;

  factory Invoices.fromRawJson(String str) =>
      Invoices.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Invoices.fromJson(Map<String, dynamic> json) => Invoices(
        read: json["read"],
        modify: json["modify"],
        delete: json["delete"],
      );

  Map<String, dynamic> toJson() => {
        "read": read,
        "modify": modify,
        "delete": delete,
      };
}

class Role {
  Role({
    this.title,
    this.type,
  });

  String? title;
  String? type;

  factory Role.fromRawJson(String str) => Role.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Role.fromJson(Map<String, dynamic> json) => Role(
        title: json["title"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "type": type,
      };
}
