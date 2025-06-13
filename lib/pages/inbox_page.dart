import 'package:flutter/material.dart';

class InboxPage extends StatelessWidget {
  const InboxPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Innhólf (20)'),
        backgroundColor: const Color(0xffFF6D00),
        actions: [
          IconButton(
            onPressed: () {
              //TODO - Add bottomsheet for sorting options (Virk, í úrvinnslu, lokið)
            },
            icon: const Icon(Icons.sort),
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
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 16, bottom: 8, left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Í ÚRVINNSLU'),
                //Expiry Date
                Text('2 dagar'),
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
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Starfsheiti',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('Vinnustaður', style: TextStyle(fontSize: 16)),
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
