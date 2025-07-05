class ProfileModel {
  final String id;
  final String name;
  final String phoneNumber;
  final DateTime dateOfBirth;
  final String aboutYou;
  final String idNumber;
  final List<JobExperienceModel> jobExperience;
  final List<EducationModel> education;
  final List<SkillsModel> skills;
  final List<LanguageModel> languages;
  final List<ReferenceModel> references;
  final List<LinkModel> links;
  final List<Favorites> favorites;

  ProfileModel({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.dateOfBirth,
    required this.aboutYou,
    required this.idNumber,
    required this.jobExperience,
    required this.education,
    required this.skills,
    required this.languages,
    required this.references,
    required this.links,
    required this.favorites,
  });
}

class JobExperienceModel {
  final String id;
  final String jobTitle;
  final String companyName;
  final DateTime startDate;
  final DateTime endDate;
  final String? description;

  JobExperienceModel({
    required this.id,
    required this.jobTitle,
    required this.companyName,
    required this.startDate,
    required this.endDate,
    this.description,
  });

  factory JobExperienceModel.fromJson(Map<String, dynamic> json) {
    return JobExperienceModel(
      id: json['id'],
      jobTitle: json['jobTitle'],
      companyName: json['companyName'],
      startDate: json['startDate'],
      endDate: json['endDate'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'jobTitle': jobTitle,
      'companyName': companyName,
      'startDate': startDate,
      'endDate': endDate,
    };
  }
}

class EducationModel {
  final String id;
  final String school;
  final String field;
  final String degree;
  final String yearStart;
  final String yearEnd;

  EducationModel({
    required this.id,
    required this.school,
    required this.field,
    required this.degree,
    required this.yearStart,
    required this.yearEnd,
  });

  factory EducationModel.fromJson(Map<String, dynamic> json) {
    return EducationModel(
      id: json['id'],
      school: json['school'],
      field: json['field'],
      degree: json['degree'],
      yearStart: json['yearStart'],
      yearEnd: json['yearEnd'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'school': school,
      'field': field,
      'degree': degree,
      'yearStart': yearStart,
      'yearEnd': yearEnd,
    };
  }
}

class ReferenceModel {
  final String id;
  final String name;
  final String jobTitle;
  final String email;

  ReferenceModel({
    required this.id,
    required this.name,
    required this.jobTitle,
    required this.email,
  });

  factory ReferenceModel.fromJson(Map<String, dynamic> json) {
    return ReferenceModel(
      id: json['id'],
      name: json['name'],
      jobTitle: json['jobTitle'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'jobTitle': jobTitle, 'email': email};
  }
}

class LinkModel {
  final String id;
  final String site;
  final String media;
  final String? iconUrl;

  LinkModel({
    required this.id,
    required this.site,
    required this.media,
    this.iconUrl,
  });

  factory LinkModel.fromJson(Map<String, dynamic> json) {
    return LinkModel(
      id: json['id'],
      site: json['site'],
      media: json['media'],
      iconUrl: json['iconUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'site': site, 'media': media, 'iconUrl': iconUrl};
  }
}

class SkillsModel {
  final String id;
  final String category;
  final String categoryItem;

  SkillsModel({
    required this.id,
    required this.category,
    required this.categoryItem,
  });

  factory SkillsModel.fromJson(Map<String, dynamic> json) {
    return SkillsModel(
      id: json['id'],
      category: json['category'],
      categoryItem: json['categoryItem'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'category': category, 'categoryItem': categoryItem};
  }
}

class LanguageModel {
  final String id;
  final String name;
  final String level;
  final String flagCode;
  final String flagEmoji;

  LanguageModel({
    required this.id,
    required this.name,
    required this.level,
    required this.flagCode,
    required this.flagEmoji,
  });

  factory LanguageModel.fromJson(Map<String, dynamic> json) {
    return LanguageModel(
      id: json['id'],
      name: json['name'],
      level: json['level'],
      flagCode: json['flagCode'],
      flagEmoji: json['flagEmoji'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'level': level,
      'flagCode': flagCode,
      'flagEmoji': flagEmoji,
    };
  }
}

class Favorites {
  final String id;
  final String workplaceId;

  Favorites({required this.id, required this.workplaceId});
}
