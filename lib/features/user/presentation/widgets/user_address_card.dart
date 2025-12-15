
import 'package:flutter/material.dart';

import '../../domain/entities/user.dart';

class UserAddressCard extends StatelessWidget {
  const UserAddressCard({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 8,
          children: [
            Text(
              'Address',
              style: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.black,
    // color: Color(0xFF1A3D63),
              ),
            ),
        
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              decoration: BoxDecoration(
    color: Color(0xFF4A7FA7),
    borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      RichText(
        text: TextSpan(
          style: const TextStyle(color: Colors.white),
          children: [
            const TextSpan(
              text: 'Street: ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: user.address.city,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
        
      RichText(
        text: TextSpan(
          style: const TextStyle(color: Colors.white),
          children: [
            const TextSpan(
              text: 'City: ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: user.address.city,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
        
      RichText(
        text: TextSpan(
          style: const TextStyle(color: Colors.white),
          children: [
            const TextSpan(
              text: 'Zipcode: ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: user.address.zipcode,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
        
     
    ],
              ),
            ),
          ],
        );
  }
}
