import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetuserName extends StatelessWidget {
  final String documentId;
  const GetuserName({super.key, required this.documentId});
  @override
  Widget build(BuildContext context) {
    CollectionReference Complaints =
        FirebaseFirestore.instance.collection('Complaints');
    return FutureBuilder<DocumentSnapshot>(
      future: Complaints.doc(documentId).get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Text('Pole Number:  ${data['Pole Number']}'
              '\n'
              'Pole Address: ${data['Pole Address']}'
              '\n'
              'Problem Description: ${data['Problem description']}');
        }
        return const Text('loading..');
      },
    );
  }
}
