import '../models/CVData.dart';

final CVData myCVData = CVData(

  name: "USMAN KHAN",
  title: "IT Specialist | Flutter Developer | Monitoring Officer",
  email: "Bangashusman4044@gmail.com",
  phone: "+92 315 9056767",
  location: "Peshawar, KPK, Pakistan",
  linkedin: "https://linkedin.com/in/usman-khan-YOUR_PROFILE",
  github: "https://github.com/UsmanKhan4044",

  summary: """
Experienced IT Specialist with a strong background in designing and maintaining computer systems for diverse business clients. 
Currently working as a Monitoring Officer at Faysal Bank with proven expertise in system monitoring, IT infrastructure management, and ensuring 0% downtime. 
Possess strong technical skills combined with excellent interpersonal abilities, enabling effective interaction with clients across various domains.
""",

  skills: [
    Skill(name: "Dart", level: 0.65, category: "Languages"),
    Skill(name: "JavaScript", level: 0.40, category: "Languages"),
    Skill(name: "Python", level: 0.35, category: "Languages"),
    Skill(name: "Flutter", level: 0.60, category: "Frameworks"),
    Skill(name: "Firebase", level: 0.45, category: "Frameworks"),
    Skill(name: "MS Office", level: 0.90, category: "Tools"),
    Skill(name: "WordPress", level: 0.50, category: "Tools"),
    Skill(name: "Software Installation", level: 0.90, category: "IT Support"),
    Skill(name: "Windows Installation", level: 1.00, category: "IT Support"),
    Skill(name: "Network Configuration", level: 0.55, category: "IT Support"),
    Skill(name: "System Monitoring", level: 0.85, category: "IT Support"),
    Skill(name: "Team Leadership", level: 0.90, category: "Soft Skills"),
    Skill(name: "Problem Solving", level: 0.90, category: "Soft Skills"),
    Skill(name: "Communication", level: 0.80, category: "Soft Skills"),
    Skill(name: "Working Under Pressure", level: 0.95, category: "Soft Skills"),
  ],

  experiences: [
    Experience(
      company: "Faysal Bank Limited",
      role: "Monitoring Officer (IT Department)",
      duration: "July 2025 - December 2025",
      responsibilities: [
        "Monitor and maintain IT systems ensuring 0% downtime across North Region branches",
        "Handle installation, integration, configuration, and maintenance of banking systems",
        "Provide technical support and troubleshooting for hardware/software issues",
        "Collaborate with diverse business clients to understand and resolve IT requirements",
        "Document system performance metrics and prepare status reports for management",
        "Ensure data security and backup protocols are followed across all systems",
      ],
      technologies: ["System Monitoring", "IT Infrastructure", "Banking Systems"],
    ),

    Experience(
      company: "PARAMOUNT LEADING COMPANY PVT LTD",
      role: "Team Leader",
      duration: "August 2024 - June 2025",
      responsibilities: [
        "Lead and coordinate team members to achieve project targets efficiently",
        "Manage workflow distribution and ensure timely delivery of tasks",
        "Proactively identify problems and implement effective solutions under pressure",
        "Collaborate cross-functionally with different departments for smooth operations",
        "Mentor junior team members and conduct training sessions on best practices",
        "Prepare progress reports and present updates to senior management",
      ],
      technologies: ["Team Management", "Leadership", "Project Coordination"],
    ),

    Experience(
      company: "THE LEADERS SCHOOL SYSTEM",
      role: "Administrator",
      duration: "June 2023 - July 2024",
      responsibilities: [
        "Manage school administrative tasks and maintain organized record-keeping systems",
        "Handle IT infrastructure including network setup, software installation, and system maintenance",
        "Install and configure Windows operating systems and educational software across computer labs",
        "Provide technical support to staff and students for smooth daily operations",
        "Ensure internet connectivity and troubleshoot network-related issues promptly",
        "Coordinate with vendors for procurement and maintenance of IT equipment",
      ],
      technologies: ["System Administration", "Windows Server", "Networking"],
    ),
  ],

  educations: [
    Education(
      institution: "The University of Agriculture, Peshawar",
      degree: "Bachelor of Science in Computer Science (BS-CS)",
      field: "Computer Science & Information Technology",
      duration: "2019 - 2023",
      achievements: [
        "Specialized in software development and IT systems",
        "Relevant coursework: Data Structures, Algorithms, OOP, Database Management",
      ],
    ),

    Education(
      institution: "Board of Intermediate and Secondary Education, Peshawar",
      degree: "Higher Secondary School Certificate (HSSC/FSC)",
      field: "Pre-Engineering / Computer Science",
      duration: "2017 - 2019",
      achievements: [
        "Focused on Mathematics, Physics, and Computer Science",
      ],
    ),

    Education(
      institution: "Board of Intermediate and Secondary Education, Peshawar",
      degree: "Secondary School Certificate (SSC/Matriculation)",
      field: "Science",
      duration: "2017",
      achievements: [
        "Strong academic performance in Science subjects",
      ],
    ),
  ],

  certifications: [
  Certification(
  name: "Flutter Development Certification",
  issuer: "Programming Training Center Peshawar (PTCP)",
  date: "2023",
  ),
  ],
);