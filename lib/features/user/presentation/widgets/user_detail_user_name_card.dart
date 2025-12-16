import 'package:flutter/material.dart';
import '../../../../core/app_size/dimens.dart';
import '../../domain/entities/user.dart';

class UserDetailUserNameCard extends StatelessWidget {
  const UserDetailUserNameCard({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: Dimens.h20, horizontal: Dimens.w16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(Dimens.radiusSmall),
      ),
      child: Center(
        child: Text(
          user.name,
          style: TextStyle(
            fontSize: Dimens.f16,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onSecondary,
          ),
        ),
      ),
    );
  }
}
