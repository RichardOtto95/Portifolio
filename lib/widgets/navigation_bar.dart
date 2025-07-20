import 'package:flutter/material.dart';
import '../constants/app_text.dart';

class PortfolioNavigationBar extends StatelessWidget {
  final bool isDarkMode;
  final VoidCallback onThemeToggle;
  final Function(int) onSectionTap;
  final int currentSection;

  const PortfolioNavigationBar({
    super.key,
    required this.isDarkMode,
    required this.onThemeToggle,
    required this.onSectionTap,
    required this.currentSection,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          SizedBox(width: 30),

          // Logo/Nome
          Text(
            AppText.name,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),

          const Spacer(),

          // Menu de navegação (desktop)
          if (MediaQuery.of(context).size.width > 1020)
            Row(
              children: [
                _NavItem(
                  title: AppText.homeNav,
                  isActive: currentSection == 0,
                  onTap: () => onSectionTap(0),
                ),
                _NavItem(
                  title: AppText.aboutNav,
                  isActive: currentSection == 1,
                  onTap: () => onSectionTap(1),
                ),
                _NavItem(
                  title: 'Experiência',
                  isActive: currentSection == 2,
                  onTap: () => onSectionTap(2),
                ),
                _NavItem(
                  title: AppText.skillsNav,
                  isActive: currentSection == 3,
                  onTap: () => onSectionTap(3),
                ),
                _NavItem(
                  title: AppText.projectsNav,
                  isActive: currentSection == 4,
                  onTap: () => onSectionTap(4),
                ),
                _NavItem(
                  title: AppText.contactNav,
                  isActive: currentSection == 5,
                  onTap: () => onSectionTap(5),
                ),
              ],
            ),

          const SizedBox(width: 16),

          // Botão de tema
          IconButton(
            onPressed: onThemeToggle,
            icon: Icon(
              isDarkMode ? Icons.light_mode : Icons.dark_mode,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),

          // Menu hambúrguer (mobile)
          // if (MediaQuery.of(context).size.width <= 1020)
          //   IconButton(
          //     onPressed: () {
          //       Scaffold.of(context).openDrawer();
          //     },
          //     icon: Icon(
          //       Icons.menu,
          //       color: Theme.of(context).colorScheme.onSurface,
          //     ),
          //   ),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final String title;
  final bool isActive;
  final VoidCallback onTap;

  const _NavItem({
    required this.title,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: isActive
                ? Theme.of(context).colorScheme.primary.withOpacity(0.1)
                : Colors.transparent,
          ),
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: isActive
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.onSurface,
              fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
