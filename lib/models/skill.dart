class Skill {
  final String name;
  final String category;
  final int level; // 1-5
  final String? description;

  const Skill({
    required this.name,
    required this.category,
    required this.level,
    this.description,
  });
}

class SkillData {
  static const List<Skill> skills = [
    // Mobile
    Skill(name: "Flutter", category: "Mobile", level: 4),
    Skill(name: "Dart", category: "Mobile", level: 4),
    Skill(name: "Mobile App Development", category: "Mobile", level: 4),

    // Web
    Skill(name: "HTML & CSS", category: "Web", level: 3),
    Skill(name: "JavaScript", category: "Web", level: 3),
    Skill(name: "Responsive Web Design", category: "Web", level: 3),

    // Backend
    Skill(name: "Node.js", category: "Backend", level: 3),
    Skill(name: "Delphi", category: "Backend", level: 3),
    Skill(name: "Python", category: "Backend", level: 2),
    Skill(name: "C++", category: "Backend", level: 2),
    Skill(name: "REST API Development", category: "Backend", level: 3),

    // Design
    Skill(name: "Adobe XD", category: "Design", level: 4),
    Skill(name: "UI/UX Design", category: "Design", level: 3),
    Skill(name: "Photoshop", category: "Design", level: 2),
    Skill(name: "Illustrator", category: "Design", level: 2),

    // Ferramentas
    Skill(name: "Git & GitHub", category: "Ferramentas", level: 4),
    Skill(name: "Firebase", category: "Ferramentas", level: 3),
    Skill(name: "AdMob", category: "Ferramentas", level: 3),
    Skill(name: "Stripe", category: "Ferramentas", level: 3),
    Skill(name: "REST APIs", category: "Ferramentas", level: 3),
    Skill(name: "Agile/Scrum", category: "Ferramentas", level: 3),
  ];

  static const List<String> softSkills = [
    "Comunicação super comunicativa com experiência em apresentações técnicas",
    "Adaptabilidade e aprendizado rápido com diferentes tecnologias",
    "Trabalho em equipe com cooperação e transparência",
    "Liderança e coordenação de projetos",
    "Resolução de problemas com abordagem sistemática",
    "Proatividade e curiosidade para novos desafios",
  ];

  static List<Skill> getSkillsByCategory(String category) {
    return skills.where((skill) => skill.category == category).toList();
  }

  static List<String> getCategories() {
    return skills.map((skill) => skill.category).toSet().toList();
  }
}
