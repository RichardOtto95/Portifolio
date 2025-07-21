import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../widgets/navigation_bar.dart';
import '../widgets/hero_section.dart';
import '../widgets/about_section.dart';
import '../widgets/experience_section.dart';
import '../widgets/skills_section.dart';
import '../widgets/projects_section.dart';
import '../widgets/contact_section.dart';
import '../widgets/footer_widget.dart';
import '../constants/app_text.dart';

class HomeScreen extends StatefulWidget {
  final bool isDarkMode;
  final VoidCallback onThemeToggle;

  const HomeScreen({
    super.key,
    required this.isDarkMode,
    required this.onThemeToggle,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  int _currentSection = 0;

  // GlobalKeys para cada seção
  final heroKey = GlobalKey();
  final aboutKey = GlobalKey();
  final experienceKey = GlobalKey();
  final skillsKey = GlobalKey();
  final projectsKey = GlobalKey();
  final contactKey = GlobalKey();

  late List<GlobalKey> sectionKeys;

  @override
  void initState() {
    super.initState();
    sectionKeys = [
      heroKey,
      aboutKey,
      experienceKey,
      skillsKey,
      projectsKey,
      contactKey,
    ];
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    // Detecta qual seção está mais próxima do topo
    double minDiff = double.infinity;
    int active = 0;
    for (int i = 0; i < sectionKeys.length; i++) {
      final ctx = sectionKeys[i].currentContext;
      if (ctx != null) {
        final box = ctx.findRenderObject() as RenderBox;
        final offset =
            box.localToGlobal(Offset.zero, ancestor: null).dy - kToolbarHeight;
        final diff = offset.abs();
        if (diff < minDiff) {
          minDiff = diff;
          active = i;
        }
      }
    }
    if (active != _currentSection) {
      setState(() {
        _currentSection = active;
      });
    }
  }

  void _scrollToSection(int sectionIndex) {
    final ctx = sectionKeys[sectionIndex].currentContext;
    if (ctx != null) {
      Scrollable.ensureVisible(
        ctx,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    }
  }

  Widget _buildMobileDrawer(BuildContext context) {
    return Drawer(
      child: Container(
        color: Theme.of(context).colorScheme.surface,
        child: Column(
          children: [
            // Header do drawer
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  // Logo e nome
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/logotipo.png',
                        height: 50,
                        width: 50,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(width: 12),
                      Text(
                        AppText.name,
                        style: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    AppText.title,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(
                        context,
                      ).colorScheme.onSurface.withOpacity(0.7),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),

            // Itens do menu
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  _MobileNavItem(
                    title: AppText.homeNav,
                    icon: Icons.home,
                    isActive: _currentSection == 0,
                    onTap: () {
                      Navigator.pop(context);
                      _scrollToSection(0);
                    },
                  ),
                  _MobileNavItem(
                    title: AppText.aboutNav,
                    icon: Icons.person,
                    isActive: _currentSection == 1,
                    onTap: () {
                      Navigator.pop(context);
                      _scrollToSection(1);
                    },
                  ),
                  _MobileNavItem(
                    title: 'Experiência',
                    icon: Icons.work,
                    isActive: _currentSection == 2,
                    onTap: () {
                      Navigator.pop(context);
                      _scrollToSection(2);
                    },
                  ),
                  _MobileNavItem(
                    title: AppText.skillsNav,
                    icon: Icons.psychology,
                    isActive: _currentSection == 3,
                    onTap: () {
                      Navigator.pop(context);
                      _scrollToSection(3);
                    },
                  ),
                  _MobileNavItem(
                    title: AppText.projectsNav,
                    icon: Icons.folder,
                    isActive: _currentSection == 4,
                    onTap: () {
                      Navigator.pop(context);
                      _scrollToSection(4);
                    },
                  ),
                  _MobileNavItem(
                    title: AppText.contactNav,
                    icon: Icons.contact_mail,
                    isActive: _currentSection == 5,
                    onTap: () {
                      Navigator.pop(context);
                      _scrollToSection(5);
                    },
                  ),
                ],
              ),
            ),

            // Footer do drawer
            Container(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  // Botão de tema
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pop(context);
                        widget.onThemeToggle();
                      },
                      icon: Icon(
                        widget.isDarkMode ? Icons.light_mode : Icons.dark_mode,
                      ),
                      label: Text(
                        widget.isDarkMode ? 'Modo Claro' : 'Modo Escuro',
                      ),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    '© 2025 Richard Otto',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(
                        context,
                      ).colorScheme.onSurface.withOpacity(0.6),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      drawer: MediaQuery.of(context).size.width <= 1020
          ? _buildMobileDrawer(context)
          : null,
      body: Stack(
        children: [
          CustomScrollView(
            controller: _scrollController,
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            scrollBehavior: CustomScrollBehavior(),
            slivers: [
              // Barra de navegação
              SliverAppBar(
                floating: true,
                // pinned: true,
                collapsedHeight: 70,
                backgroundColor: Theme.of(
                  context,
                ).colorScheme.surface.withOpacity(0.9),

                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(
                        context,
                      ).colorScheme.surface.withOpacity(0.9),
                    ),
                  ),
                  title: PortfolioNavigationBar(
                    isDarkMode: widget.isDarkMode,
                    onThemeToggle: widget.onThemeToggle,
                    onSectionTap: _scrollToSection,
                    currentSection: _currentSection,
                  ),
                  titlePadding: EdgeInsets.zero,
                ),
              ),

              // Seção Hero
              SliverToBoxAdapter(
                child: Container(
                  key: heroKey,
                  child:
                      HeroSection(
                            onKnowMoreTap: () =>
                                _scrollToSection(4), // Projetos
                          )
                          .animate()
                          .fadeIn(duration: 600.ms)
                          .slideY(begin: 0.3, end: 0),
                ),
              ),

              // Seção Sobre
              SliverToBoxAdapter(
                child: Container(
                  key: aboutKey,
                  child: AboutSection()
                      .animate()
                      .fadeIn(duration: 600.ms)
                      .slideY(begin: 0.3, end: 0),
                ),
              ),

              // Seção Experiência Profissional & Formação
              SliverToBoxAdapter(
                child: Container(
                  key: experienceKey,
                  child: ExperienceSection()
                      .animate()
                      .fadeIn(duration: 600.ms)
                      .slideY(begin: 0.3, end: 0),
                ),
              ),

              // Seção Habilidades
              SliverToBoxAdapter(
                child: Container(
                  key: skillsKey,
                  child: SkillsSection()
                      .animate()
                      .fadeIn(duration: 600.ms)
                      .slideY(begin: 0.3, end: 0),
                ),
              ),

              // Seção Projetos
              SliverToBoxAdapter(
                child: Container(
                  key: projectsKey,
                  child: ProjectsSection()
                      .animate()
                      .fadeIn(duration: 600.ms)
                      .slideY(begin: 0.3, end: 0),
                ),
              ),

              // Seção Contato
              SliverToBoxAdapter(
                child: Container(
                  key: contactKey,
                  child: ContactSection()
                      .animate()
                      .fadeIn(duration: 600.ms)
                      .slideY(begin: 0.3, end: 0),
                ),
              ),

              // Footer
              SliverToBoxAdapter(
                child: FooterWidget().animate().fadeIn(duration: 600.ms),
              ),
            ],
          ),
          // Indicador de scroll (apenas desktop)
          if (MediaQuery.of(context).size.width > 1020)
            Positioned(
              right: 20,
              top: MediaQuery.of(context).size.height * 0.5,
              child: _ScrollIndicator(
                scrollController: _scrollController,
                onSectionTap: _scrollToSection,
                currentSection: _currentSection,
              ),
            ),
        ],
      ),
    );
  }
}

class _ScrollIndicator extends StatelessWidget {
  final ScrollController scrollController;
  final Function(int) onSectionTap;
  final int currentSection;

  const _ScrollIndicator({
    required this.scrollController,
    required this.onSectionTap,
    required this.currentSection,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface.withOpacity(0.8),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _ScrollDot(
            isActive: currentSection == 0,
            onTap: () => onSectionTap(0),
            label: 'Home',
          ),
          _ScrollDot(
            isActive: currentSection == 1,
            onTap: () => onSectionTap(1),
            label: 'Sobre',
          ),
          _ScrollDot(
            isActive: currentSection == 2,
            onTap: () => onSectionTap(2),
            label: 'Exp',
          ),
          _ScrollDot(
            isActive: currentSection == 3,
            onTap: () => onSectionTap(3),
            label: 'Skills',
          ),
          _ScrollDot(
            isActive: currentSection == 4,
            onTap: () => onSectionTap(4),
            label: 'Proj',
          ),
          _ScrollDot(
            isActive: currentSection == 5,
            onTap: () => onSectionTap(5),
            label: 'Cont',
          ),
        ],
      ),
    );
  }
}

class _ScrollDot extends StatelessWidget {
  final bool isActive;
  final VoidCallback onTap;
  final String label;

  const _ScrollDot({
    required this.isActive,
    required this.onTap,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        child: Column(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: isActive ? 12 : 8,
              height: isActive ? 12 : 8,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isActive
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.onSurface.withOpacity(0.3),
              ),
            ),
            if (isActive) ...[
              const SizedBox(height: 4),
              Text(
                label,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _MobileNavItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isActive;
  final VoidCallback onTap;

  const _MobileNavItem({
    required this.title,
    required this.icon,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: isActive
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
          color: isActive
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.onSurface,
          fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
        ),
      ),
      trailing: isActive
          ? Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: Theme.of(context).colorScheme.primary,
            )
          : null,
      onTap: onTap,
      selected: isActive,
      selectedTileColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
    );
  }
}

class CustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
  };
}
