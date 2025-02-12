import 'package:cloud_firestore/cloud_firestore.dart';

class HxCommon {
  const HxCommon();

  static final FirebaseFirestore _db = FirebaseFirestore.instance;

  static FirebaseFirestore get db => _db;
}
