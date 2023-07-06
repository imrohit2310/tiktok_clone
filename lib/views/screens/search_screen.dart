import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/constants.dart';
import 'package:tiktok_clone/controller/search_controller.dart';
import 'package:tiktok_clone/views/screens/profile_screen.dart';

import '../../models/user.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  final SearchUserController searchController = Get.put(SearchUserController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: TextFormField(
            onFieldSubmitted: (v) => searchController.searchUser(v),
            decoration: InputDecoration(
                filled: false,
                hintText: 'Search',
                hintStyle: textStyle(FontWeight.w500, Colors.white, 18)),
          ),
        ),
        body: searchController.searchedUsers.isEmpty
            ? Center(
                child: Text(
                  'Search for Users',
                  style: textStyle(FontWeight.bold, Colors.white, 25),
                ),
              )
            : ListView.builder(
                itemCount: searchController.searchedUsers.length,
                itemBuilder: (context, index) {
                  User user = searchController.searchedUsers[index];
                  return InkWell(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ProfileScreen(uid: user.uid))),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(user.profilePhoto),
                      ),
                      title: Text(
                        user.name,
                        style: textStyle(FontWeight.w500, Colors.white, 18),
                      ),
                    ),
                  );
                },
              ),
      );
    });
  }
}
