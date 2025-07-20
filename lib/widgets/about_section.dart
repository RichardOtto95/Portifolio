import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_text.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
      child: Column(
        children: [
          // Título da seção
          Text(
            AppText.aboutTitle,
            style: Theme.of(
              context,
            ).textTheme.displayMedium?.copyWith(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 16),

          // Linha decorativa
          Container(
            width: 60,
            height: 4,
            decoration: BoxDecoration(
              gradient: AppColors.primaryGradient,
              borderRadius: BorderRadius.circular(2),
            ),
          ),

          const SizedBox(height: 64),

          // Conteúdo da seção
          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 768) {
                // Layout desktop
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 1, child: _buildAboutContent(context)),
                    const SizedBox(width: 64),
                    Expanded(flex: 1, child: _buildHobbiesContent(context)),
                  ],
                );
              } else {
                // Layout mobile
                return Column(
                  children: [
                    _buildAboutContent(context),
                    const SizedBox(height: 48),
                    _buildHobbiesContent(context),
                  ],
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildAboutContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quem sou eu',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),

        const SizedBox(height: 24),

        Text(
          AppText.aboutDescription,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(height: 1.6),
        ),

        const SizedBox(height: 24),

        // Informações pessoais
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Informações Pessoais',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(height: 16),
              _PersonalInfoItem(
                icon: Icons.cake,
                label: 'Data de Nascimento',
                value: AppText.birthDate,
              ),
              const SizedBox(height: 8),
              _PersonalInfoItem(
                icon: Icons.location_on,
                label: 'Localização',
                value: AppText.location,
              ),
              const SizedBox(height: 8),
              _PersonalInfoItem(
                icon: Icons.phone,
                label: 'Telefone',
                value: AppText.phone,
              ),
              const SizedBox(height: 8),
              _PersonalInfoItem(
                icon: Icons.email,
                label: 'Email',
                value: AppText.email,
              ),
            ],
          ),
        ),

        const SizedBox(height: 24),

        // Soft Skills
        Text(
          'Soft Skills:',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),

        const SizedBox(height: 12),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _SoftSkillItem(
              title: 'Comunicação',
              description: AppText.communicationSkill,
              icon: Icons.chat,
            ),
            const SizedBox(height: 16),
            _SoftSkillItem(
              title: 'Adaptabilidade',
              description: AppText.adaptabilitySkill,
              icon: Icons.psychology,
            ),
            const SizedBox(height: 16),
            _SoftSkillItem(
              title: 'Trabalho em Equipe',
              description: AppText.teamworkSkill,
              icon: Icons.group,
            ),
            const SizedBox(height: 16),
            _SoftSkillItem(
              title: 'Liderança',
              description: AppText.leadershipSkill,
              icon: Icons.leaderboard,
            ),
            const SizedBox(height: 16),
            _SoftSkillItem(
              title: 'Resolução de Problemas',
              description: AppText.problemSolvingSkill,
              icon: Icons.lightbulb,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildHobbiesContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hobbies & Interesses',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),

        const SizedBox(height: 24),

        Text(
          AppText.aboutHobbies,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(height: 1.6),
        ),

        const SizedBox(height: 24),

        // Ícones dos hobbies
        Wrap(
          spacing: 16,
          runSpacing: 16,
          alignment: WrapAlignment.center,
          children: [
            _HobbyIcon(icon: Icons.science, label: 'Ciência'),
            _HobbyIcon(icon: Icons.architecture, label: 'Arquitetura'),
            _HobbyIcon(icon: Icons.sports_volleyball, label: 'Vôlei'),
            _HobbyIcon(icon: Icons.directions_run, label: 'Corrida'),
            _HobbyIcon(
              icon: Icons.sports_martial_arts,
              label: 'Artes Marciais',
            ),
            _HobbyIcon(icon: Icons.games, label: 'Games'),
            _HobbyIcon(icon: Icons.movie, label: 'Filmes'),
            _HobbyIcon(icon: Icons.tv, label: 'Séries'),
            _HobbyIcon(icon: Icons.book, label: 'Livros'),
            _HobbyIcon(icon: Icons.chat, label: 'Conversa'),
          ],
        ),
      ],
    );
  }
}

class _PersonalInfoItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _PersonalInfoItem({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Theme.of(context).colorScheme.primary),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(
                    context,
                  ).colorScheme.onSurface.withOpacity(0.7),
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                value,
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _SoftSkillItem extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;

  const _SoftSkillItem({
    required this.title,
    required this.description,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              color: Theme.of(context).colorScheme.primary,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(height: 1.4),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _HobbyIcon extends StatelessWidget {
  final IconData icon;
  final String label;

  const _HobbyIcon({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            icon,
            color: Theme.of(context).colorScheme.primary,
            size: 28,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
