import 'package:flutter/material.dart';

import '../../../../core/app_size/dimens.dart';
import '../../domain/entities/user.dart';

class UserAddressCard extends StatelessWidget {
  const UserAddressCard({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: Dimens.h8,
      children: [
        Text('Address', style: Theme.of(context).textTheme.titleMedium),

        Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(
            vertical: Dimens.h20,
            horizontal: Dimens.w16,
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(Dimens.radiusSmall),
          ),
          child: Column(
            spacing: Dimens.h4,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  style: const TextStyle(color: Colors.white),
                  children: [
                    TextSpan(
                      text: 'Street: ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: Dimens.f14,
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                    ),
                    TextSpan(
                      text: user.address.city,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: Dimens.f14,
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                    ),
                  ],
                ),
              ),

              RichText(
                text: TextSpan(
                  style: const TextStyle(color: Colors.white),
                  children: [
                    TextSpan(
                      text: 'City: ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: Dimens.f14,
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                    ),
                    TextSpan(
                      text: user.address.city,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: Dimens.f14,
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                    ),
                  ],
                ),
              ),

              RichText(
                text: TextSpan(
                  style: const TextStyle(color: Colors.white),
                  children: [
                    TextSpan(
                      text: 'Zipcode: ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: Dimens.f14,
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                    ),
                    TextSpan(
                      text: user.address.zipcode,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: Dimens.f14,
                        color: Theme.of(context).colorScheme.onSecondary,
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
