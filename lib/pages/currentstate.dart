import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart'
    show DocumentSnapshot, FirebaseFirestore;
import 'package:micromobitech/helper/define.dart';
import 'package:percent_indicator/circular_percent_indicator.dart'
    show CircularPercentIndicator, CircularStrokeCap;

class CurrentState extends StatelessWidget {
  const CurrentState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
            stream: FirebaseFirestore.instance
                .collection('factory')
                .doc(globalUserModel.factoryId)
                .snapshots(),
            builder: (BuildContext context,
                AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>>
                    snapshot) {
              if (snapshot.hasError) {
                return const Text('Something went wrong');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Text("Loading");
              }
              if (!snapshot.data!.exists) {
                return const Text("No Data!");
              }

              return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularPercentIndicator(
                      radius: 120.0,
                      lineWidth: 13.0,
                      animation: true,
                      animationDuration: 200,
                      percent: double.parse(snapshot.data!
                              .data()!['waterAmount']
                              .toString()) /
                          double.parse(snapshot.data!
                              .data()!['waterFullAmount']
                              .toString()),
                      center: Text(
                        snapshot.data!.data()!['waterAmount'].toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20.0),
                      ),
                      footer: const Text(
                        "현재물의양",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17.0),
                      ),
                      circularStrokeCap: CircularStrokeCap.round,
                      progressColor: Colors.blueAccent,
                    ),
                    const SizedBox(height: 80),
                    CircularPercentIndicator(
                      radius: 120.0,
                      lineWidth: 13.0,
                      animation: true,
                      animationDuration: 400,
                      percent: 0.7,
                      center: Text(
                        snapshot.data!.data()!['waterTemperature'].toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20.0),
                      ),
                      footer: const Text(
                        "현재온도",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17.0),
                      ),
                      circularStrokeCap: CircularStrokeCap.round,
                      progressColor: Colors.blueAccent,
                    ),
                  ]);
            },
          ),
        ),
      ],
    ));
  }
}
