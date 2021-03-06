import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farmers_market/src/models/user.dart';

class FirestoreService {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> addUser(User user){
    return _db.collection('users').doc(user.userId).set(user.toMap());
  }

  Future<User> fetchUser(String userId){
    return _db.collection('users').doc(userId).get().then((snapshot) => User.fromFirestore(snapshot.data()));
  }

  Stream<List<String>> fetchUnitTypes(){
    return _db.collection('types').doc('units').snapshots()
            .map((snapshot) => snapshot.data()['production']
            .map<String>((type) => type.toString()).toList());
  }
}