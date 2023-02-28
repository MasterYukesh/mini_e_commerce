import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:verzeo_minor_project/model/user.dart';

final FirebaseFirestore ff = FirebaseFirestore.instance;
final CollectionReference cr = ff.collection('Users');

class FireBaseHelper {
  static Future insertUser(User user) async {
    try {
      cr.doc(user.number).set(user.toJson());
      //return user.copy(id: id);
    } catch (e) {
      throw (e.toString());
    }
  }

  static Future updateUser(User user, String id) async {
    try {
      await cr.doc(id).update(<String, dynamic>{
        'id': id,
        'name': user.name,
        'number': user.number,
        'mail': user.mail,
        'password': user.password,
      });
    } catch (e) {
      throw (e.toString());
    }
  }

  static Future deleteUser(String id) async {
    try {
      await cr.doc(id).delete();
    } catch (e) {
      throw (e.toString());
    }
  }

  static Stream<List<User>> readUsersasStream() {
    try {
      return cr.snapshots().map((snapshot) => snapshot.docs
          .map((user) => User.fromJson(user.data() as Map<String, dynamic>))
          .toList());
    } catch (e) {
      throw (e.toString());
    }
  }

  static Future<List<User>> readUsersasList(
      Stream<List<User>> usersStream) async {
    try {
      List<User> userlist = [];
      usersStream.listen((event) {
        for (int i = 0; i < event.length; i++) {
          userlist.add(event[i]);
        }
      });
      return userlist;
    } catch (e) {
      throw (e.toString());
    }
  }

  static Future<User?> readUser(String username) {
    try {
      var doc = cr.doc(username).get();
      var user = doc.then((value) {
        if (value.data() != null) {
          return User.fromJson(value.data() as Map<String, dynamic>);
        } else {
          return null;
        }
      });
      return user;
    } catch (e) {
      throw (e.toString());
    }
  }
}
