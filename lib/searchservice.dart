import 'package:cloud_firestore/cloud_firestore.dart';

class SearchService {
  searchByName() {
    return FirebaseFirestore.instance.collection('DATA').get();
  }
}
