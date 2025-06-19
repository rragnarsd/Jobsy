import 'package:codehatch/l10n/app_localizations.dart';
import 'package:codehatch/models/link_model.dart';
import 'package:codehatch/pages/profile/widgets/profile_add_btn.dart';
import 'package:codehatch/pages/profile/widgets/profile_header.dart';
import 'package:flutter/material.dart';

class LinkSection extends StatelessWidget {
  const LinkSection({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    final local = AppLocalizations.of(context)!;
    return SliverToBoxAdapter(
      child: Column(
        children: [
          ProfileHeader(text: local.links, onEditTap: () {}),
          Card(
            child: Column(
              children: List.generate(links.length * 2 - 1, (index) {
                if (index.isOdd) {
                  return const Divider(height: 0.5, color: Colors.grey);
                }

                final link = links[index ~/ 2];
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    spacing: 16,
                    children: [
                      const CircleAvatar(
                        backgroundColor: Colors.grey,
                        radius: 16,
                        child: Icon(Icons.link),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            link.site,
                            style: theme.textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            link.media,
                            style: theme.textTheme.bodyLarge!.copyWith(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),

          ProfileAddBtn(title: local.add_link),
        ],
      ),
    );
  }
}
