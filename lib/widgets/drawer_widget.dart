import 'package:expedient_flutter/screens/display_data_screen.dart';
import 'package:expedient_flutter/screens/home.dart';
import 'package:expedient_flutter/screens/login_page.dart';
import 'package:expedient_flutter/screens/orderManager/short_term.dart';
import 'package:expedient_flutter/screens/resources.dart';
import 'package:flutter/material.dart';
import 'package:expedient_flutter/screens/profile.dart';

class MyDrawer extends StatelessWidget {
  final double width;
  const MyDrawer({Key? key, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SafeArea(
        child: Theme(
          data: ThemeData(brightness: Brightness.light),
          child: SizedBox(
            width: width,
            height: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'images/logo.png',
                      width: 200,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Home()),
                  ),
                  child: const ListTile(
                    leading: Icon(Icons.dashboard),
                    title: Text(
                      'Dashboard',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Profle()),
                  ),
                  child: const ListTile(
                    leading: Icon(Icons.person),
                    title: Text(
                      'Profile',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Resources()),
                  ),
                  child: const ListTile(
                    leading: Icon(Icons.people),
                    title: Text(
                      'Resources',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Resources()),
                  ),
                  child: ExpansionTile(
                    leading: const Icon(Icons.collections_bookmark),
                    title: const Text(
                      'Order Manager',
                      style: TextStyle(fontSize: 18),
                    ),
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: GestureDetector(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ShortTermOrder()),
                          ),
                          child: const ListTile(
                            leading: Icon(Icons.card_travel),
                            title: Text(
                              'Short Term Orders',
                              style: TextStyle(fontWeight: FontWeight.w300),
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: ListTile(
                          leading: Icon(Icons.card_travel),
                          title: Text(
                            'Long Term Orders',
                            style: TextStyle(fontWeight: FontWeight.w300),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const ListTile(
                  leading: Icon(Icons.map),
                  title: Text(
                    'Invoices',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                const ListTile(
                  leading: Icon(Icons.watch_later),
                  title: Text(
                    'Timesheets',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  ),
                  child: const ListTile(
                    leading: Icon(Icons.logout),
                    title: Text(
                      'Logout',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
