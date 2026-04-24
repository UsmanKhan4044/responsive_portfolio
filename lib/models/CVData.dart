class CVData {
  final String name;
  final String title;
  final String email;
  final String phone;
  final String location;
  final String linkedin;
  final String github;
  final String summary;

  final List<Skill> skills;
  final List<Experience> experiences;
  final List<Education> educations;
  final List<Certification> certifications;

  CVData({
    required this.name,
    required this.title,
    required this.email,
    required this.phone,
    required this.location,
    required this.linkedin,
    required this.github,
    required this.summary,
    required this.skills,
    required this.experiences,
    required this.educations,
    required this.certifications,
  });
}

class Skill {
  final String name;
  final double level;
  final String category;

  Skill({required this.name, required this.level, required this.category});
}

class Experience {
  final String company;
  final String role;
  final String duration;
  final List<String> responsibilities;
  final List<String> technologies;

  Experience({
    required this.company,
    required this.role,
    required this.duration,
    required this.responsibilities,
    required this.technologies,
  });
}

class Education {
  final String institution;
  final String degree;
  final String field;
  final String duration;
  final double gpa;
  final List<String> achievements;

  Education({
    required this.institution,
    required this.degree,
    required this.field,
    required this.duration,
    this.gpa = 0.0,
    required this.achievements,
  });
}

class Certification {
  final String name;
  final String issuer;
  final String date;
  final String? credentialId;

  Certification({
    required this.name,
    required this.issuer,
    required this.date,
    this.credentialId,
  });
}