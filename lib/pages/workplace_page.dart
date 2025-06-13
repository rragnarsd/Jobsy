import 'package:flutter/material.dart';

class WorkplacePage extends StatefulWidget {
  const WorkplacePage({super.key});

  @override
  State<WorkplacePage> createState() => _WorkplacePageState();
}

class _WorkplacePageState extends State<WorkplacePage> {
  int selectedTab = 0;
  //TODO - Add jobs count
  final int jobsCount = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Vinnustaðurinn',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xffFF6D00),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: const CustomScrollView(
        slivers: [
          WorkplaceHeader(),
          WorkplaceInfo(),
          WorkplaceAwards(),
          WorkplaceWebsite(),
          WorkplaceMap(),
          WorkplaceSize(),
          WorkplacePerks(),
          WorkplaceJobs(),
        ],
      ),
    );
  }
}

class MenuTile extends StatelessWidget {
  const MenuTile({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
  });

  final String title;
  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        title,

        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
      ),
      onTap:
          onTap ??
          () {
            Navigator.of(context).pop();
          },
    );
  }
}

class WorkplaceDivider extends StatelessWidget {
  const WorkplaceDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverPadding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 16, vertical: 8),
      sliver: SliverToBoxAdapter(child: Divider()),
    );
  }
}

class WorkplaceHeader extends StatelessWidget {
  const WorkplaceHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Card(
        color: Colors.white,
        margin: EdgeInsets.all(16),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            spacing: 16,
            children: [
              Row(
                children: [
                  Placeholder(fallbackHeight: 80, fallbackWidth: 100),
                  SizedBox(width: 16),
                  Text('Landspítali', style: TextStyle(fontSize: 24)),
                ],
              ),
              Text(
                'Vinnum með þeim bestu',
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.w900),
              ),
              Placeholder(fallbackHeight: 200, fallbackWidth: double.infinity),
            ],
          ),
        ),
      ),
    );
  }
}

class WorkplaceInfo extends StatelessWidget {
  const WorkplaceInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Card(
        color: Colors.white,
        margin: EdgeInsets.all(16),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 8,
            children: [
              Text(
                'Um vinnustaðinn',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              Text('Lýsing á vinnustaðnum', style: TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}

class WorkplaceAwards extends StatelessWidget {
  const WorkplaceAwards({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Card(
        color: Colors.white,
        margin: EdgeInsets.symmetric(horizontal: 16),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: CircleAvatar(),
                title: Text('Framúrskarandi fyrirtæki 2023'),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Divider(),
              ),
              ListTile(
                leading: CircleAvatar(),
                title: Text('Jafnvægisvog FKA 2023'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WorkplaceWebsite extends StatelessWidget {
  const WorkplaceWebsite({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Card(
        color: Colors.white,
        margin: EdgeInsets.all(16),
        child: ListTile(
          leading: Icon(Icons.home),
          trailing: Icon(Icons.keyboard_arrow_right),
          title: Text('Vefsíða'),
        ),
      ),
    );
  }
}

class WorkplaceMap extends StatelessWidget {
  const WorkplaceMap({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Card(
        color: Colors.white,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            children: [
              const SizedBox(height: 24),
              const Icon(Icons.location_on, size: 64, color: Colors.orange),
              const Padding(
                padding: EdgeInsets.all(12),
                child: Text('Heimilisfang', style: TextStyle(fontSize: 20)),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffFF6D00),
                  foregroundColor: Colors.white,
                ),
                onPressed: () {},
                child: const Text(
                  'Opna kort',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

class WorkplaceJobs extends StatelessWidget {
  const WorkplaceJobs({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Card(
        color: Colors.white,
        margin: const EdgeInsets.all(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Nýjustu störfin',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      'Öll störf',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Divider(),
              ),
              const SizedBox(height: 8),
              const Placeholder(fallbackHeight: 80, fallbackWidth: 80),
              const SizedBox(height: 8),
              const Text(
                'Starf á lager',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 2),
              const Text('Fastus', style: TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}

class WorkplaceSize extends StatelessWidget {
  const WorkplaceSize({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Card(
        color: Colors.white,
        margin: EdgeInsets.all(16),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 12.0),
          child: Column(
            children: [
              Text(
                '51-200',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              Text(
                'Starfsmenn',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WorkplacePerks extends StatelessWidget {
  const WorkplacePerks({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Card(
        color: Colors.white,
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: Column(
          children: [
            WorkplaceTile(
              title: 'Hreyfing',
              subtitle:
                  'Hreyfing er fyrirtæki sem sérhæfir sig í hreyfingu og heilsu.',
            ),
            Divider(),
            WorkplaceTile(
              title: 'Matur',
              subtitle:
                  'Niðurgreiddur heitur matur í hádeginu mánudaga til fimmtudaga.',
            ),
            Divider(),
            WorkplaceTile(
              title: 'Vinnutími',
              subtitle:
                  'Í mannauðsstefnu fyrirtækisins er lögð áhersla á sveigjanleika í vinnutíma.',
            ),
          ],
        ),
      ),
    );
  }
}

class WorkplaceTile extends StatelessWidget {
  const WorkplaceTile({
    super.key,
    required this.title,
    required this.subtitle,
    this.icon,
  });

  final String title;
  final String subtitle;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      //TODO - Add icons
      leading: const CircleAvatar(),
      title: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
      ),
      subtitle: Text(subtitle, style: const TextStyle(fontSize: 16)),
    );
  }
}

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({
    super.key,
    required this.selectedIndex,
    required this.onTabSelected,
    required this.jobsCount,
  });

  final int selectedIndex;
  final Function(int) onTabSelected;
  final int jobsCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => onTabSelected(0),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: BoxDecoration(
              color: selectedIndex == 0 ? Colors.grey[300] : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
            ),
            alignment: Alignment.center,
            child: const Text(
              'Prófill',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        GestureDetector(
          onTap: () => onTabSelected(1),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: BoxDecoration(
              color: selectedIndex == 1 ? Colors.grey[300] : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
            ),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Badge
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xffFF6D00),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    jobsCount.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                const Text(
                  'Öll störf',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
