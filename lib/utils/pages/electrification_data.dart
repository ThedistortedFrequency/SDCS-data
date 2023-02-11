import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Electdata extends StatefulWidget {
  const Electdata({Key? key}) : super(key: key);

  @override
  State<Electdata> createState() => _ElectdataState();
}

class _ElectdataState extends State<Electdata> {
  List<String> docIds = [];
  Future getdocIds() async {
    await FirebaseFirestore.instance
        .collection("Electrification")
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
        title: const Text("Electrification Details"),
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
                          title: Getelect(documentId: docIds[index]),
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

class Getelect extends StatelessWidget {
  final String documentId;
  Getelect({required this.documentId});

  @override
  Widget build(BuildContext context) {
    CollectionReference Electrification =
        FirebaseFirestore.instance.collection('Electrification');
    return FutureBuilder<DocumentSnapshot>(
      future: Electrification.doc(documentId).get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Text(
              'Additional Information: ${data['Additional Information']}'
              '\n'
              'Area: ${data['Area']}'
              '\n'
              'Pin Code: ${data['Pin Code']}'
              '\n'
              'Place Description: ${data['Place Description']}');
        }
        return const Text('loading..');
      },
    );
  }
}
