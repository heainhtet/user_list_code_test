import 'package:flutter/material.dart';
import '../../../../core/app_size/dimens.dart';
import '../../domain/entities/user.dart';

class UsrListTile extends StatelessWidget {
  const UsrListTile({super.key, required this.user, required this.onTap});
  final User user;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: Dimens.w12, horizontal: Dimens.h12),
        margin: EdgeInsets.only(bottom: Dimens.mH12),
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).colorScheme.primary,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(Dimens.radiusSmall),
        ),
        child: Column(
          spacing: Dimens.h2,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              user.name,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            Text(user.email, style: Theme.of(context).textTheme.bodyMedium),
            Text(user.phone, style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }
}
