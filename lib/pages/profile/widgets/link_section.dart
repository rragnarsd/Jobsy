import 'package:codehatch/models/link_model.dart';
import 'package:codehatch/pages/profile/widgets/profile_add_btn.dart';
import 'package:codehatch/pages/profile/widgets/profile_header.dart';
import 'package:flutter/material.dart';

class LinkSection extends StatelessWidget {
  const LinkSection({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Column(
      children: [
        const ProfileHeader(text: 'Links'),
        Card(
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: links.length,
            separatorBuilder: (context, index) =>
                const Divider(height: 0.5, color: Colors.grey),
            itemBuilder: (context, index) {
              final link = links[index];
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
            },
          ),
        ),
        const ProfileAddBtn(title: 'Add new link'),
      ],
    );
  }
}
