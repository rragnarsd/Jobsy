import 'package:codehatch/pages/workplace_page.dart';
import 'package:flutter/material.dart';

class JobDescriptionPage extends StatelessWidget {
  const JobDescriptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Starfslýsing'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: const CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Card(
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
          JobLanguageSkills(),
          JobLocation(),
          JobType(),
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
    ThemeData theme = Theme.of(context);
    return SliverToBoxAdapter(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Starfsgreinar',
                style: theme.textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 16),
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
                        style: theme.textTheme.bodyMedium,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
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
                        style: theme.textTheme.bodyMedium,
                      ),
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Divider(),
              ),
              Text(
                'Starfsmerkingar',
                style: theme.textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                spacing: 8,
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
                      child: Text('Ritari', style: theme.textTheme.bodyMedium),
                    ),
                  ),
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
                        'Símsvörun',
                        style: theme.textTheme.bodyMedium,
                      ),
                    ),
                  ),
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
                        'Afgreiðsla',
                        style: theme.textTheme.bodyMedium,
                      ),
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
    ThemeData theme = Theme.of(context);
    return SliverToBoxAdapter(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            spacing: 16,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Starfstegund',
                style: theme.textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
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
                  child: Text('Fullt starf', style: theme.textTheme.bodyMedium),
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
    ThemeData theme = Theme.of(context);
    return SliverToBoxAdapter(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //TODO - Add map
              Text(
                'Staðsetning',
                style: theme.textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Divider(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                spacing: 8,
                children: [
                  Text(
                    'Auðbrekka 17, 200 Kópavogur',
                    style: theme.textTheme.bodyLarge,
                  ),
                  const Icon(
                    Icons.keyboard_arrow_right,
                    size: 24,
                    color: Colors.white,
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

class JobLanguageSkills extends StatelessWidget {
  const JobLanguageSkills({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return SliverToBoxAdapter(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tungumálahæfni',
                style: theme.textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    spacing: 8,
                    children: [
                      const Placeholder(fallbackHeight: 20, fallbackWidth: 40),
                      Text('Íslenska', style: theme.textTheme.bodyLarge),
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
                            style: theme.textTheme.bodyLarge,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text('Framúrskarandi', style: theme.textTheme.bodyLarge),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Divider(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    spacing: 8,
                    children: [
                      const Placeholder(fallbackHeight: 20, fallbackWidth: 40),
                      Text('Enska', style: theme.textTheme.bodyLarge),
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
                            style: theme.textTheme.bodyLarge,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text('Mjög góð', style: theme.textTheme.bodyLarge),
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
    ThemeData theme = Theme.of(context);
    return SliverToBoxAdapter(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Auglýsing birt',
                    style: theme.textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text('12. júní 2025', style: theme.textTheme.bodyLarge),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Divider(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Umsóknarfrestur',
                    style: theme.textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text('Enginn', style: theme.textTheme.bodyLarge),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Divider(),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffFF6D00),
                  padding: const EdgeInsets.all(16),
                ),
                child: Row(
                  spacing: 8,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.person, size: 24, color: Colors.white),
                    Text('Sækja um', style: theme.textTheme.titleLarge),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Row(
                      children: [
                        const Icon(Icons.favorite, color: Color(0xffFF6D00)),
                        const SizedBox(width: 8),
                        Text('Vista', style: theme.textTheme.bodyLarge),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Row(
                      children: [
                        const Icon(Icons.share, color: Color(0xffFF6D00)),
                        const SizedBox(width: 8),
                        Text('Deila', style: theme.textTheme.bodyLarge),
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
    ThemeData theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Menntunar- og hæfniskröfur',
            style: theme.textTheme.bodyLarge!.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            '• Framúrskarandi samskiptahæfni',
            style: theme.textTheme.bodyLarge,
          ),
          Text('• Skipulagshæfni', style: theme.textTheme.bodyLarge),
          Text('• Góð almenn tölvukunnátta', style: theme.textTheme.bodyLarge),
        ],
      ),
    );
  }
}

class JobResponsibility extends StatelessWidget {
  const JobResponsibility({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Helstu verkefni og ábyrgð',
            style: theme.textTheme.bodyLarge!.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            '• Vinna við viðhald og viðgerðir á bifreiðum',
            style: theme.textTheme.bodyLarge,
          ),
          Text(
            '• Greina bilanir og framkvæma viðgerðir',
            style: theme.textTheme.bodyLarge,
          ),
          Text(
            '• Halda utan um verkfæri og búnað',
            style: theme.textTheme.bodyLarge,
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
      child: Text('Starfslýsing', style: Theme.of(context).textTheme.bodyLarge),
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
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}

class JobHeader extends StatelessWidget {
  const JobHeader({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              //TODO - Add Workplace logo
              const Placeholder(fallbackHeight: 100, fallbackWidth: 100),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Landspítali', style: theme.textTheme.titleLarge),
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
                        Text(
                          'Vinnustaðurinn',
                          style: theme.textTheme.bodyLarge!.copyWith(
                            color: const Color(0xFFFF7200),
                          ),
                        ),
                        const Icon(Icons.keyboard_arrow_right, size: 24),
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
