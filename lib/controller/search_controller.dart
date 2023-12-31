// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:get/get.dart';
// import 'package:tiktok_clone/constants.dart';

// class SearchController extends GetxController {
//   final Rx<List<User>> _searchedUsers = Rx<List<User>>([]);

//   List<User> get searchedUser => _searchedUsers.value;

//   searchUser(String typedUSer) async {
//     _searchedUsers.bindStream(
//       firestore
//           .collection('users')
//           .where('name', isGreaterThanOrEqualTo: typedUSer)
//           .snapshots()
//           .map((QuerySnapshot query) {
//             List<User> retVal = [];
//             for(var e in query.docs){
//               retVal.add(User.fromSnap(e));

//             }
//             return retVal;
//           }),
//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/constants.dart';

import 'package:tiktok_clone/models/user.dart';



class SearchUserController extends GetxController {
  final Rx<List<User>> _searchedUsers = Rx<List<User>>([]);

  List<User> get searchedUsers => _searchedUsers.value;

  searchUser(String typedUser) async {
    _searchedUsers.bindStream(firestore
        .collection('users')
        .where('name', isGreaterThanOrEqualTo: typedUser)
        .snapshots()
        .map((QuerySnapshot query) {
      List<User> retVal = [];
      for (var elem in query.docs) {
        retVal.add(User.fromSnap(elem));
      }
      return retVal;
    }));
  }
}