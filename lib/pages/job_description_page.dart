import 'package:codehatch/pages/workplace_page.dart';
import 'package:flutter/material.dart';

class JobDescriptionPage extends StatelessWidget {
  const JobDescriptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Starfslýsing',
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
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Card(
              color: Colors.white,
              margin: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  JobHeader(),
                  JobTitle(),
                  JobDescription(),
                  SizedBox(height: 8),
                  Divider(),
                  JobResponsibility(),
                  Divider(),
                  JobQualification(),
                ],
              ),
            ),
          ),
          JobDeadline(),
          SliverToBoxAdapter(child: SizedBox(height: 16)),
          JobLanguageSkills(),
          SliverToBoxAdapter(child: SizedBox(height: 16)),
          JobLocation(),
          SliverToBoxAdapter(child: SizedBox(height: 16)),
          JobType(),
          SliverToBoxAdapter(child: SizedBox(height: 16)),
          JobProfession(),
          SliverToBoxAdapter(child: SizedBox(height: 24)),
        ],
      ),
    );
  }
}

class JobProfession extends StatelessWidget {
  const JobProfession({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Card(
        color: Colors.white,
        margin: EdgeInsets.symmetric(horizontal: 16),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Starfsgreinar',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      child: Text(
                        'Skrifstofustörf',
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      child: Text(
                        'Þjónustustörf',
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Divider(),
              ),
              Text(
                'Starfsmerkingar',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      child: Text('Ritari', style: TextStyle(fontSize: 14)),
                    ),
                  ),
                  SizedBox(width: 8),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      child: Text('Símsvörun', style: TextStyle(fontSize: 14)),
                    ),
                  ),
                  SizedBox(width: 8),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      child: Text('Afgreiðsla', style: TextStyle(fontSize: 14)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class JobType extends StatelessWidget {
  const JobType({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Card(
        color: Colors.white,
        margin: EdgeInsets.symmetric(horizontal: 16),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Starfstegund',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  child: Text('Fullt starf', style: TextStyle(fontSize: 14)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class JobLocation extends StatelessWidget {
  const JobLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Card(
        color: Colors.white,
        margin: EdgeInsets.symmetric(horizontal: 16),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //TODO - Add map
              Text(
                'Staðsetning',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Divider(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                spacing: 8,
                children: [
                  Text(
                    'Auðbrekka 17, 200 Kópavogur',
                    style: TextStyle(fontSize: 16),
                  ),
                  Icon(Icons.keyboard_arrow_right, size: 24),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class JobLanguageSkills extends StatelessWidget {
  const JobLanguageSkills({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Card(
        color: Colors.white,
        margin: EdgeInsets.symmetric(horizontal: 16),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tungumálahæfni',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    spacing: 8,
                    children: [
                      Placeholder(fallbackHeight: 20, fallbackWidth: 40),
                      Text('Íslenska', style: TextStyle(fontSize: 16)),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          child: Text(
                            'Nauðsyn',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text('Framúrskarandi', style: TextStyle(fontSize: 16)),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Divider(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    spacing: 8,
                    children: [
                      Placeholder(fallbackHeight: 20, fallbackWidth: 40),
                      Text('Enska', style: TextStyle(fontSize: 16)),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          child: Text(
                            'Nauðsyn',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text('Mjög góð', style: TextStyle(fontSize: 16)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class JobDeadline extends StatelessWidget {
  const JobDeadline({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Card(
        color: Colors.white,
        margin: EdgeInsets.symmetric(horizontal: 16),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Auglýsing birt',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  Text('12. júní 2025', style: TextStyle(fontSize: 16)),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Divider(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Umsóknarfrestur',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  Text('Enginn', style: TextStyle(fontSize: 16)),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Divider(),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Row(
                  spacing: 8,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.person, size: 24),
                    Text(
                      'Sækja um',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Row(
                      children: [
                        Icon(Icons.favorite, color: Colors.orange),
                        SizedBox(width: 8),
                        Text('Vista', style: TextStyle(fontSize: 16)),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Row(
                      children: [
                        Icon(Icons.share, color: Colors.orange),
                        SizedBox(width: 8),
                        Text('Deila', style: TextStyle(fontSize: 16)),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class JobQualification extends StatelessWidget {
  const JobQualification({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Menntunar- og hæfniskröfur',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 16),
          Text(
            '• Framúrskarandi samskiptahæfni',
            style: TextStyle(fontSize: 16),
          ),
          Text('• Skipulagshæfni', style: TextStyle(fontSize: 16)),
          Text('• Góð almenn tölvukunnátta', style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}

class JobResponsibility extends StatelessWidget {
  const JobResponsibility({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Helstu verkefni og ábyrgð',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 16),
          Text(
            '• Vinna við viðhald og viðgerðir á bifreiðum',
            style: TextStyle(fontSize: 16),
          ),
          Text(
            '• Greina bilanir og framkvæma viðgerðir',
            style: TextStyle(fontSize: 16),
          ),
          Text(
            '• Halda utan um verkfæri og búnað',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}

class JobDescription extends StatelessWidget {
  const JobDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text('Starfslýsing', style: TextStyle(fontSize: 16)),
    );
  }
}

class JobTitle extends StatelessWidget {
  const JobTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Text(
        'Bifvélavirki / Car Mechanic',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class JobHeader extends StatelessWidget {
  const JobHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              //TODO - Add Workplace logo
              Placeholder(fallbackHeight: 100, fallbackWidth: 100),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Landspítali',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    style: ButtonStyle(
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      padding: WidgetStateProperty.all(EdgeInsets.zero),
                    ),
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const WorkplacePage(),
                      ),
                    ),
                    child: Row(
                      children: [
                        Text('Vinnustaðurinn', style: TextStyle(fontSize: 16)),
                        Icon(Icons.keyboard_arrow_right, size: 24),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
