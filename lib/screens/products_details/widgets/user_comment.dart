import 'package:flutter/material.dart';

class UserComment extends StatelessWidget {
  const UserComment({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(
              "https://img.freepik.com/free-photo/sports-tools_53876-138077.jpg?uid=R162128033&ga=GA1.1.971563098.1745924156&semt=ais_items_boosted&w=740", // Replace with user profile image
            ),
          ),
          title: Text("User Name"), // Replace with user name
          subtitle: Text("This is a comment."), // Replace with comment text
        );
      },
      separatorBuilder: (context, index) => Divider(),
      itemCount: 10,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
    );
  }
}
