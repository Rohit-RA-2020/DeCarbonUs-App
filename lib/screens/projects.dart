import 'package:decarbonus/screens/subscribe.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProjectsScreen extends StatefulWidget {
  const ProjectsScreen({super.key});

  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Projects"),
        backgroundColor: Colors.green.shade100,
        elevation: 1,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => const SubscribePage(),
                  ),
                );
              },
              child: const Text("Skip"),
            ),
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(18.sp),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Select",
              style: TextStyle(
                fontSize: 30.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20.sp,
            ),
            const Text(
              "Which carbon-offset initiatives hold significance for you?",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 30.sp,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  onPressed: () {},
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.15.sp,
                    width: MediaQuery.of(context).size.width * 0.30.sp,
                    decoration: const BoxDecoration(
                      color: Colors.pink,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 8.sp,
                ),
                MaterialButton(
                  onPressed: () {},
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.15.sp,
                    width: MediaQuery.of(context).size.width * 0.30.sp,
                    decoration: const BoxDecoration(
                      color: Colors.pink,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30.sp,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  onPressed: () {},
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.15.sp,
                    width: MediaQuery.of(context).size.width * 0.30.sp,
                    decoration: const BoxDecoration(
                      color: Colors.pink,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 8.sp,
                ),
                MaterialButton(
                  onPressed: () {},
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.15.sp,
                    width: MediaQuery.of(context).size.width * 0.30.sp,
                    decoration: const BoxDecoration(
                      color: Colors.pink,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50.sp,
            ),
            const Text(
              "How is this used?",
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            SizedBox(
              height: 20.sp,
            ),
            const Text(
              "The opinions and perspectives of the DeCarbonUs community hold great value for us.\n We take into account the preferences of our community when evaluating new initiatives.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
