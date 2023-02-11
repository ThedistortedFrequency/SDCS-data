import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FeedData extends StatefulWidget {
  const FeedData({Key? key}) : super(key: key);

  @override
  State<FeedData> createState() => _FeedDataState();
}

class _FeedDataState extends State<FeedData> {
  List<String> docIds = [];
  Future getdocIds() async {
    await FirebaseFirestore.instance
        .collection("Feedback")
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
        title: const Text("Feedback Details"),
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
                          title: Getfeed(documentId: docIds[index]),
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

class Getfeed extends StatelessWidget {
  final String documentId;
  Getfeed({required this.documentId});

  @override
  Widget build(BuildContext context) {
    CollectionReference Feedback =
        FirebaseFirestore.instance.collection('Feedback');
    return FutureBuilder<DocumentSnapshot>(
      future: Feedback.doc(documentId).get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Text('Feedback:  ${data['feedback details']}'
              '\n'
              'Email:  ${data['Email Address']}');
        }
        return const Text('loading..');
      },
    );
  }
}
