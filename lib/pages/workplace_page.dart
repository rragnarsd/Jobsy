import 'package:flutter/material.dart';

class WorkplacePage extends StatelessWidget {
  const WorkplacePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> tabs = <String>['Prófill', 'Öll störf'];
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
        actions: [
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            //TODO - Add menu
            onPressed: () {},
          ),
        ],
      ),
      body: DefaultTabController(
        length: tabs.length,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverToBoxAdapter(
              child: Column(
                //TODO - Custom tabbar
                children: [
                  const WorkplaceHeader(),
                  TabBar(
                    tabs: tabs.map((String name) {
                      return Tab(text: name);
                    }).toList(),
                    labelColor: const Color(0xffFF6D00),
                    unselectedLabelColor: Colors.grey,
                    indicatorColor: const Color(0xffFF6D00),
                  ),
                ],
              ),
            ),
          ],
          body: TabBarView(
            children: [
              CustomScrollView(
                slivers: const [
                  WorkplaceInfo(),
                  WorkplaceAwards(),
                  WorkplaceWebsite(),
                  WorkplaceMap(),
                  WorkplaceSize(),
                  WorkplacePerks(),
                  WorkplaceJobs(),
                ],
              ),
              const Center(
                child: Text('Starf', style: TextStyle(fontSize: 24)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WorkplaceDivider extends StatelessWidget {
  const WorkplaceDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 16, vertical: 8),
      sliver: SliverToBoxAdapter(child: Divider()),
    );
  }
}

class WorkplaceHeader extends StatelessWidget {
  const WorkplaceHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          spacing: 16,
          children: [
            Row(
              children: [
                Placeholder(fallbackHeight: 80, fallbackWidth: 100),
                const SizedBox(width: 16),
                const Text('Landspítali', style: TextStyle(fontSize: 24)),
              ],
            ),
            const Text(
              'Vinnum með þeim bestu',
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.w900),
            ),
            Placeholder(fallbackHeight: 200, fallbackWidth: double.infinity),
          ],
        ),
      ),
    );
  }
}

class WorkplaceInfo extends StatelessWidget {
  const WorkplaceInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Card(
        color: Colors.white,
        margin: const EdgeInsets.all(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
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
    return SliverToBoxAdapter(
      child: Card(
        color: Colors.white,
        margin: EdgeInsets.symmetric(horizontal: 16),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: CircleAvatar(),
                title: Text('Framúrskarandi fyrirtæki 2023'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
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
    return SliverToBoxAdapter(
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
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            children: [
              SizedBox(height: 24),
              Icon(Icons.location_on, size: 64, color: Colors.orange),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Text('Heimilisfang', style: TextStyle(fontSize: 20)),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffFF6D00),
                  foregroundColor: Colors.white,
                ),
                onPressed: () {},
                child: Text(
                  'Opna kort',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                ),
              ),
              SizedBox(height: 24),
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
        margin: EdgeInsets.all(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Nýjustu störfin',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Öll störf',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Divider(),
              ),
              SizedBox(height: 8),
              Placeholder(fallbackHeight: 80, fallbackWidth: 80),
              SizedBox(height: 8),
              Text(
                'Starf á lager',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 2),
              Text('Fastus', style: TextStyle(fontSize: 16)),
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
    return SliverToBoxAdapter(
      child: Card(
        color: Colors.white,
        margin: EdgeInsets.all(16),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
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
    return SliverToBoxAdapter(
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
      leading: CircleAvatar(),
      title: Text(
        title,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
      ),
      subtitle: Text(subtitle, style: TextStyle(fontSize: 16)),
    );
  }
}
