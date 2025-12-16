import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/app_size/dimens.dart';
import '../../domain/entities/user.dart';

class UserDetailContectInfoCard extends StatelessWidget {
  const UserDetailContectInfoCard({super.key, required this.user});

  final User user;
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url.startsWith('http') ? url : 'http://$url');
    if (!await launchUrl(uri)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: Dimens.h8,
      children: [
        Text(
          'Contact Informations',
          style: Theme.of(context).textTheme.titleMedium,
        ),

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
                      text: 'Email: ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: Dimens.f14,
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                    ),
                    TextSpan(
                      text: user.email,
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
                      text: 'Username: ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: Dimens.f14,
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                    ),
                    TextSpan(
                      text: user.username,
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
                      text: 'Phone: ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: Dimens.f14,
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                    ),
                    TextSpan(
                      text: user.phone,
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
                  style: Theme.of(context).textTheme.bodyMedium,
                  children: [
                    TextSpan(
                      text: 'Website: ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: Dimens.f14,
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                    ),
                    TextSpan(
                      text: user.website,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold,
                      ),

                      recognizer: TapGestureRecognizer()
                        ..onTap = () => _launchURL(user.website),
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
