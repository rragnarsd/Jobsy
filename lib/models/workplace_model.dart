class WorkplaceModel {
  final String id;
  final String name;
  final String description;
  final String location;
  final String websiteUrl;
  final String size;
  final String? imageUrl;
  final String? logoUrl;
  final String? motto;
  final List<String>? awards;
  final List<PerkModel>? perks;
  final List<String> jobIds;
  final String primaryJobTitle;

  WorkplaceModel({
    required this.id,
    required this.name,
    required this.description,
    required this.location,
    required this.websiteUrl,
    required this.size,
    required this.jobIds,
    required this.primaryJobTitle,
    this.imageUrl,
    this.logoUrl,
    this.motto,
    this.awards,
    this.perks,
  });
}

class PerkModel {
  final String title;
  final String description;

  PerkModel({required this.title, required this.description});
}

final List<WorkplaceModel> dummyWorkplaces = [
  WorkplaceModel(
    id: 'w1',
    name: 'Tech Innovators Inc.',
    description: 'A cutting-edge tech company specializing in AI solutions.',
    motto: 'Innovate. Impact. Inspire.',
    location: 'San Francisco, CA',
    websiteUrl: 'https://techinnovators.com',
    size: '500-1000',
    jobIds: ['j1', 'j101', 'j102'],
    primaryJobTitle: 'AI Software Engineer',
    imageUrl:
        'https://images.pexels.com/photos/1181354/pexels-photo-1181354.jpeg',
    logoUrl: 'assets/logos/tech-innovators.png',
    awards: ['Best AI Startup 2023', 'Top Workplace 2022'],
    perks: [
      PerkModel(
        title: 'Remote work',
        description: 'Work from anywhere with flexible hours.',
      ),
      PerkModel(
        title: 'Health insurance',
        description: 'Comprehensive health coverage for you and your family.',
      ),
      PerkModel(
        title: 'Stock options',
        description: 'Opportunity to own a piece of the company.',
      ),
    ],
  ),
  WorkplaceModel(
    id: 'w2',
    name: 'Green Future Ltd.',
    description: 'Focused on sustainable energy and green technologies.',
    imageUrl:
        'https://images.pexels.com/photos/1108572/pexels-photo-1108572.jpeg',
    logoUrl: 'assets/logos/green-future.png',
    motto: 'Powering a greener tomorrow.',
    location: 'Austin, TX',
    websiteUrl: 'https://greenfuture.com',
    size: '200-500',
    jobIds: ['j2'],
    primaryJobTitle: 'Senior Engineer',
  ),
  WorkplaceModel(
    id: 'w3',
    name: 'EduSmart Solutions',
    description:
        'E-learning platform helping students achieve academic success.',
    imageUrl:
        'https://images.pexels.com/photos/5940837/pexels-photo-5940837.jpeg',
    logoUrl: 'assets/logos/edusmart.png',
    motto: 'Unlocking knowledge, empowering futures.',
    location: 'New York, NY',
    websiteUrl: 'https://edusmart.com',
    size: '50-200',
    jobIds: ['j3'],
    primaryJobTitle: 'Curriculum Designer',
    perks: [
      PerkModel(
        title: 'Flexible hours',
        description: 'Choose your own working hours.',
      ),
      PerkModel(
        title: 'Learning budget',
        description: 'Annual stipend for courses, books, and development.',
      ),
    ],
  ),
  WorkplaceModel(
    id: 'w4',
    name: 'HealthTech Partners',
    description: 'Innovating healthcare through advanced software systems.',
    imageUrl:
        'https://images.pexels.com/photos/356040/pexels-photo-356040.jpeg',
    logoUrl: 'assets/logos/health-tech.png',
    motto: 'Unlocking knowledge, empowering futures.',
    location: 'Seattle, WA',
    websiteUrl: 'https://healthtechpartners.com',
    size: '1000+',
    jobIds: ['j4', 'j301'],
    primaryJobTitle: 'Senior HealthTech Engineer',
    awards: ['Healthcare Innovation Award 2021'],
  ),
  WorkplaceModel(
    id: 'w5',
    name: 'DesignLab Studio',
    description: 'A creative design agency with a focus on branding and UX.',
    imageUrl:
        'https://images.pexels.com/photos/196644/pexels-photo-196644.jpeg',
    logoUrl: 'assets/logos/design-lab.png',
    motto: 'Care meets code.',
    location: 'Los Angeles, CA',
    websiteUrl: 'https://designlabstudio.com',
    size: '10-50',
    jobIds: ['j5'],
    primaryJobTitle: 'UI/UX Designer',
  ),
];
