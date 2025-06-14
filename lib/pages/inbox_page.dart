import 'package:flutter/material.dart';

class InboxPage extends StatelessWidget {
  const InboxPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Innhólf (20)'),
        leading: const Padding(
          padding: EdgeInsets.all(16.0),
          child: Icon(Icons.person, color: Colors.white, size: 26),
        ),
        actions: [
          IconButton(
            onPressed: () {
              //TODO - Add bottomsheet for sorting options
            },
            icon: const Icon(Icons.sort, color: Colors.white),
          ),
        ],
      ),
      body: const CustomScrollView(
        slivers: [
          InboxList(),
          SliverToBoxAdapter(child: SizedBox(height: 16)),
        ],
      ),
    );
  }
}

class InboxList extends StatelessWidget {
  const InboxList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => InboxCard(index: index),
        childCount: 10,
      ),
    );
  }
}

class InboxCard extends StatelessWidget {
  const InboxCard({super.key, required this.index});

  final int index;

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
                Text('Í ÚRVINNSLU', style: theme.textTheme.bodyMedium),
                //Expiry Date
                Text('2 dagar', style: theme.textTheme.bodyMedium),
              ],
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              spacing: 16,
              children: [
                Placeholder(
                  fallbackHeight: 80,
                  fallbackWidth: 80,
                  color: Colors.grey.shade300,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Starfsheiti',
                      style: theme.textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text('Vinnustaður', style: theme.textTheme.bodyMedium),
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
