// ignore_for_file: non_constant_identifier_names, avoid_print, avoid_function_literals_in_foreach_calls

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sdcs_data/complist.dart';

class CompDetail extends StatefulWidget {
  const CompDetail({Key? key}) : super(key: key);

  @override
  State<CompDetail> createState() => _CompDetailState();
}

class _CompDetailState extends State<CompDetail> {
  List<String> docIds = [];
  Future getdocIds() async {
    await FirebaseFirestore.instance
        .collection("Complaints")
        .orderBy("timestamp", descending: true)
        .get()
        .then(
          (snapshot) => snapshot.docs.forEach(
            (document) {
              print(document.reference);
              docIds.add(document.reference.id);
            },
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Complaints Details"),
        centerTitle: true,
      ),
      body: Center(
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                  child: FutureBuilder(
                future: getdocIds(),
                builder: (context, snapshot) {
                  return ListView.builder(
                    itemCount: docIds.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          tileColor: Colors.grey[100],
                          title: GetuserName(documentId: docIds[index]),
                        ),
                      );
                    },
                  );
                },
              ))
            ],
          ),
        ),
      ),
    );
  }
}
