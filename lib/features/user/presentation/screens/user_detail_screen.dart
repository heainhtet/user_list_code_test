// presentation/screens/user_detail_screen.dart
import 'package:ace_plus_code_test/features/user/presentation/widgets/user_detail_contect_info_card.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../domain/entities/user.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/user_address_card.dart';
import '../widgets/user_detail_user_name_card.dart';

class UserDetailScreen extends StatelessWidget {
  final User user;

  const UserDetailScreen({required this.user, super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, color: Color(0xFF1A3D63)),
        ),
        title: Text(
          "User Detail",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1A3D63),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 20,
            children: [
              UserDetailUserNameCard(user: user),
              UserDetailContectInfoCard(user: user),
        
              UserAddressCard(user: user),
              
            ],
          ),
        ),
      ),
    );
  }
}
