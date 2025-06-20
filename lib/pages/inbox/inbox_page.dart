import 'package:codehatch/l10n/app_localizations.dart';
import 'package:codehatch/models/inbox_model.dart';
import 'package:codehatch/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InboxPage extends StatelessWidget {
  const InboxPage({super.key});

  //TODO - Hide inbox if not logged in
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${AppLocalizations.of(context)!.inbox} (20)'),
        leading: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GestureDetector(
            onTap: () => context.push('/profile'),
            child: const Icon(Icons.person, color: Colors.white, size: 26),
          ),
        ),
        actions: [
          //TODO - Add bottomsheet for sorting options
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.filter_list, color: Colors.white),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => InboxCard(inboxItem: inboxItems[index]),
              childCount: inboxItems.length,
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
        ],
      ),
    );
  }
}

class InboxCard extends StatelessWidget {
  const InboxCard({super.key, required this.inboxItem});

  final InboxModel inboxItem;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Card(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 16,
              bottom: 8,
              left: 16,
              right: 16,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  inboxItem.jobStatus.displayName.toUpperCase(),
                  style: theme.textTheme.bodyMedium!.copyWith(
                    color: inboxItem.jobStatus.color,
                  ),
                ),
                //Expiry Date
                Text(inboxItem.deadline, style: theme.textTheme.bodyMedium),
              ],
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              spacing: 16,
              children: [
                Image.asset(
                  inboxItem.logoUrl,
                  width: 60,
                  height: 60,
                  fit: BoxFit.fitWidth,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      inboxItem.title,
                      style: theme.textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      inboxItem.workplace,
                      style: theme.textTheme.bodyMedium!.copyWith(
                        color: const Color(0xFFFF7200),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
