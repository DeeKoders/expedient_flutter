import 'package:flutter/material.dart';

class DataCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final String extraInfo;
  final String label;

  const DataCard(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.extraInfo,
      required this.label});

  @override
  Widget build(BuildContext context) {
    return Card(
        // ignore: prefer_const_constructors
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        elevation: 0,
        color: Colors.blue[100],
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  SizedBox(
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.green,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            label,
                            style: const TextStyle(
                                fontSize: 15.0, color: Colors.white),
                          ),
                        )),
                  ),
                ],
              ),
              // Row(
              //   children: [
              //     Text(
              //       "${resources[i]["fullName"]}",
              //       style: const TextStyle(
              //           fontSize: 18.0,
              //           fontWeight: FontWeight.bold),
              //     )
              //   ],
              // ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text(
                    subTitle == '' ? 'HEELO' : subTitle,
                    style: const TextStyle(
                        fontSize: 15.0, fontWeight: FontWeight.normal),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Text(
                    extraInfo,
                    style: const TextStyle(
                        fontSize: 15.0, fontWeight: FontWeight.normal),
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
