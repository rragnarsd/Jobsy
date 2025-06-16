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
        title: const Text('Vinnustaðurinn'),
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
    ThemeData theme = Theme.of(context);
    return SliverToBoxAdapter(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            spacing: 16,
            children: [
              Row(
                children: [
                  const Placeholder(fallbackHeight: 80, fallbackWidth: 100),
                  const SizedBox(width: 16),
                  Text('Landspítali', style: theme.textTheme.headlineSmall),
                ],
              ),
              Text(
                'Vinnum með þeim bestu',
                style: theme.textTheme.headlineMedium!.copyWith(
                  fontSize: 36,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const Placeholder(
                fallbackHeight: 200,
                fallbackWidth: double.infinity,
              ),
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
    ThemeData theme = Theme.of(context);

    return SliverToBoxAdapter(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 8,
            children: [
              Text(
                'Um vinnustaðinn',
                style: theme.textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text('Lýsing á vinnustaðnum', style: theme.textTheme.bodyLarge),
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
    ThemeData theme = Theme.of(context);
    return SliverToBoxAdapter(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: const CircleAvatar(),
                title: Text(
                  'Framúrskarandi fyrirtæki 2023',
                  style: theme.textTheme.bodyLarge,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Divider(),
              ),
              ListTile(
                leading: const CircleAvatar(),
                title: Text(
                  'Jafnvægisvog FKA 2023',
                  style: theme.textTheme.bodyLarge,
                ),
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
    ThemeData theme = Theme.of(context);
    return SliverToBoxAdapter(
      child: Card(
        child: ListTile(
          leading: const Icon(Icons.home, color: Color(0xFFFF7200)),
          trailing: const Icon(Icons.keyboard_arrow_right),
          title: Text('Vefsíða', style: theme.textTheme.bodyLarge),
        ),
      ),
    );
  }
}

class WorkplaceMap extends StatelessWidget {
  const WorkplaceMap({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return SliverToBoxAdapter(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            children: [
              const SizedBox(height: 24),
              const Icon(Icons.location_on, size: 64, color: Color(0xFFFF7200)),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  'Heimilisfang',
                  style: theme.textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffFF6D00),
                  foregroundColor: Colors.white,
                ),
                onPressed: () {},
                child: Text(
                  'Opna kort',
                  style: theme.textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
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
    ThemeData theme = Theme.of(context);
    return SliverToBoxAdapter(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Nýjustu störfin',
                    style: theme.textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffFF6D00),
                    ),
                    child: Text(
                      'Öll störf',
                      style: theme.textTheme.bodyMedium!.copyWith(
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
              Text(
                'Starf á lager',
                style: theme.textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 2),
              Text('Fastus', style: theme.textTheme.bodyLarge),
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
    ThemeData theme = Theme.of(context);
    return SliverToBoxAdapter(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Column(
            children: [
              Text(
                '51-200',
                style: theme.textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                'Starfsmenn',
                style: theme.textTheme.bodyLarge!.copyWith(color: Colors.grey),
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
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0),
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
    ThemeData theme = Theme.of(context);
    return ListTile(
      //TODO - Add icons
      leading: const CircleAvatar(),
      title: Text(
        title,
        style: theme.textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w700),
      ),
      subtitle: Text(subtitle, style: theme.textTheme.bodyLarge),
    );
  }
}

//TODO - the tabbar is missing
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
    ThemeData theme = Theme.of(context);
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
            child: Text(
              'Prófill',
              style: theme.textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w600,
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
                Text(
                  'Öll störf',
                  style: theme.textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w600,
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
