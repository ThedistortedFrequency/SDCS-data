import 'package:flutter/material.dart';
import 'package:sdcs_data/utils/routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SDCS-Admin"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 50,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 50,
                color: Colors.transparent,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.userdetailRoute);
                  },
                  child: const Text("User Details"),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 50,
                color: Colors.transparent,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.complainRoute);
                  },
                  child: const Text("Complaint Details"),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 50,
                color: Colors.transparent,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.electrificationRoute);
                  },
                  child: const Text("Electrification Details"),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 50,
                color: Colors.transparent,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.feedbackRoute);
                  },
                  child: const Text("Feedback Details"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
