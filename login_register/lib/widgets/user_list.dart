// lib/widgets/user_list.dart

import 'package:flutter/material.dart';

class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10, // Example: Replace with actual list length
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('User ${index + 1}'),
          subtitle: Text('user${index + 1}@example.com'),
        );
      },
    );
  }
}
