import 'package:flutter/material.dart';

import '../../domain/entities/user.dart';

class UserDetailUserNameCard extends StatelessWidget {
  const UserDetailUserNameCard({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      decoration: BoxDecoration(
        color: Color(0xFF4A7FA7),borderRadius: BorderRadius.circular(8)
      ),
      child: Center(
        child: Text(user.name,style: TextStyle(
        
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white
        ),),
      ),
    );
  }
}