class Project {
  final String title;
  final String description;
  final List<String> imageUrls;
  final String problem;
  final List<String> technologies;
  final String? repositoryUrl;
  final String? demoUrl;
  final bool isFeatured;

  const Project({
    required this.title,
    required this.description,
    required this.imageUrls,
    required this.problem,
    required this.technologies,
    this.repositoryUrl,
    this.demoUrl,
    this.isFeatured = false,
  });
}

// Lista de projetos baseados nos repositórios reais do GitHub
class ProjectData {
  static const List<Project> projects = [
    Project(
      title: "Portfólio Pessoal",
      description:
          "Portfólio pessoal desenvolvido em Flutter para exibir projetos, habilidades e experiência profissional",
      imageUrls: [
        "assets/images/portfolio_1.png",
        "assets/images/portfolio_2.png",
        "assets/images/portfolio_3.png",
      ],
      problem:
          "Criar uma apresentação profissional e interativa das competências e trabalhos realizados",
      technologies: [
        "Flutter",
        "Dart",
        "Material Design",
        "Responsive Design",
        "Carousel/PageView",
      ],
      repositoryUrl: "https://github.com/RichardOtto95/Portifolio",
      isFeatured: true,
    ),
    Project(
      title: "Sistema de Delivery White Label",
      description:
          "Sistema completo de delivery white label que permite criar aplicativos personalizados para diferentes marcas",
      imageUrls: [
        "assets/images/delivery_white_label_1.png",
        "assets/images/delivery_white_label_2.png",
        "assets/images/delivery_white_label_3.png",
      ],
      problem:
          "Permitir que empresas tenham seu próprio app de delivery com identidade visual personalizada, agentes e lojas próprias",
      technologies: [
        "Flutter",
        "Dart",
        "JavaScript",
        "Backend API",
        "Dashboard Admin",
        "HotSite",
      ],
      repositoryUrl:
          "https://github.com/RichardOtto95/DeliveryWhiteLabelCustomer",
      isFeatured: true,
    ),
    Project(
      title: "DiaClean - Sistema de Limpeza",
      description:
          "Plataforma para conectar diaristas e clientes, facilitando a contratação de serviços de limpeza",
      imageUrls: [
        "assets/images/diaclean_1.png",
        "assets/images/diaclean_2.png",
        "assets/images/diaclean_3.png",
      ],
      problem:
          "Conectar pessoas que precisam de serviços de limpeza com diaristas qualificados, oferecendo pagamento justo",
      technologies: ["Flutter", "Dart", "Design System"],
      repositoryUrl: "https://github.com/RichardOtto95/DiaCleanCustomer",
      isFeatured: true,
    ),
    Project(
      title: "Expressfy - Delivery Express",
      description:
          "Sistema de delivery express para entrega rápida de qualquer item em qualquer lugar",
      imageUrls: [
        "assets/images/expressfy_1.png",
        "assets/images/expressfy_2.png",
        "assets/images/expressfy_3.png",
      ],
      problem:
          "Criar uma solução de entrega ultra-rápida conectando clientes, vendedores e entregadores",
      technologies: [
        "Flutter",
        "Dart",
        "JavaScript",
        "HTML",
        "Backend API",
        "Landing Page",
      ],
      repositoryUrl: "https://github.com/RichardOtto95/ExpressfyCustomer",
      isFeatured: true,
    ),
    Project(
      title: "BatePonto",
      description:
          "Aplicativo Flutter para gerenciamento de pontos de trabalho",
      imageUrls: [
        "assets/images/bateponto_1.png",
        "assets/images/bateponto_2.png",
        "assets/images/bateponto_3.png",
      ],
      problem: "Facilitar o controle de entrada e saída de funcionários",
      technologies: ["Flutter", "Dart"],
      repositoryUrl: "https://github.com/RichardOtto95/BatePonto",
      isFeatured: false,
    ),
    Project(
      title: "ChatApp",
      description: "Aplicativo de chat desenvolvido com Flutter e Firebase",
      imageUrls: [
        "assets/images/chatapp_1.png",
        "assets/images/chatapp_2.png",
        "assets/images/chatapp_3.png",
      ],
      problem: "Criar uma plataforma de comunicação em tempo real",
      technologies: ["Flutter", "Dart", "Firebase"],
      repositoryUrl: "https://github.com/RichardOtto95/ChatApp",
      isFeatured: false,
    ),
    Project(
      title: "Meals",
      description:
          "Aplicativo Flutter com receitas de refeições usando Riverpod como gerenciamento de estado",
      imageUrls: [
        "assets/images/meals_1.png",
        "assets/images/meals_2.png",
        "assets/images/meals_3.png",
      ],
      problem: "Organizar e apresentar receitas de forma intuitiva",
      technologies: ["Flutter", "Dart", "Riverpod"],
      repositoryUrl: "https://github.com/RichardOtto95/Meals",
      isFeatured: false,
    ),
    Project(
      title: "PersonFront - Análise de Personalidade",
      description: "Aplicativo para descoberta e análise de personalidade",
      imageUrls: [
        "assets/images/personfront_1.png",
        "assets/images/personfront_2.png",
        "assets/images/personfront_3.png",
      ],
      problem:
          "Ajudar usuários a descobrirem e entenderem melhor sua personalidade",
      technologies: ["Flutter", "Dart", "Design System"],
      repositoryUrl: "https://github.com/RichardOtto95/PersonFront",
      isFeatured: false,
    ),
    Project(
      title: "StairBattleCounter",
      description: "Aplicativo para contagem de batalhas em escadas",
      imageUrls: [
        "assets/images/stairbattle_1.png",
        "assets/images/stairbattle_2.png",
        "assets/images/stairbattle_3.png",
      ],
      problem:
          "Facilitar a contagem e organização de batalhas em jogos de escada",
      technologies: ["Flutter", "Dart"],
      repositoryUrl: "https://github.com/RichardOtto95/StairBattleCounter",
      isFeatured: false,
    ),
    Project(
      title: "Pigu",
      description:
          "Aplicativo para restaurante e lanchonete, com cardápio e mesa para realização de pedidos",
      imageUrls: [
        "assets/images/pigu_1.png",
        "assets/images/pigu_2.png",
        "assets/images/pigu_3.png",
      ],
      problem:
          "Sistema completo de pedidos com atualização de status em tempo real, pedidos coletivos para uma pessoa, casais e alguns amigos",
      technologies: ["Flutter", "Dart", "Firebase"],
      repositoryUrl: "https://github.com/RichardOtto95/Pigu",
      isFeatured: false,
    ),
    Project(
      title: "Encontrar Cuidado",
      description: "Plataforma para encontrar serviços de cuidado e saúde",
      imageUrls: [
        "assets/images/encontrar_cuidado_1.png",
        "assets/images/encontrar_cuidado_2.png",
        "assets/images/encontrar_cuidado_3.png",
      ],
      problem:
          "Conectar pessoas que precisam de cuidados com profissionais qualificados",
      technologies: ["Flutter", "Dart", "Firebase"],
      repositoryUrl: "https://github.com/RichardOtto95/Encontrar Cuidado",
      isFeatured: false,
    ),
    Project(
      title: "Kaihe",
      description:
          "Aplicativo Flutter criado para criar uma comunicação simples entre alunos, professores e pais",
      imageUrls: [
        "assets/images/kaihe_1.png",
        "assets/images/kaihe_2.png",
        "assets/images/kaihe_3.png",
      ],
      problem:
          "Facilitar a comunicação e acompanhamento escolar entre todos os envolvidos no processo educacional",
      technologies: ["Flutter", "Dart", "Firebase"],
      repositoryUrl: "https://github.com/RichardOtto95/Kaihe",
      isFeatured: false,
    ),
  ];
}
