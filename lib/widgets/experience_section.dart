import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
      child: Column(
        children: [
          // Título da seção
          Text(
            'Experiência Profissional & Formação',
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
                    Expanded(flex: 1, child: _buildExperienceContent(context)),
                    const SizedBox(width: 64),
                    Expanded(flex: 1, child: _buildEducationContent(context)),
                  ],
                );
              } else {
                // Layout mobile
                return Column(
                  children: [
                    _buildExperienceContent(context),
                    const SizedBox(height: 48),
                    _buildEducationContent(context),
                  ],
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildExperienceContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Experiência Profissional',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),

        const SizedBox(height: 32),

        // Experiência atual
        _ExperienceCard(
          title: 'Desenvolvedor Mobile',
          company: 'SAT Sistemas, Taguatinga',
          period: '08/2022 - Presente',
          description:
              'Colaboro em todos os processos de desenvolvimento de apps e websites, incluindo:\n'
              '• Prototipagem (Adobe XD)\n'
              '• Front-End (Flutter, HTML & CSS)\n'
              '• Back-End (Delphi)\n'
              '• Design (Adobe Illustrator e Photoshop)\n'
              '• Documentação (dicionário de dados, funcionalidades, requisitos, relatórios)\n'
              '• Modelagem de dados e integrações (Firebase, AdMob, Stripe, REST API)',
          isCurrent: true,
        ),

        const SizedBox(height: 24),

        // Experiência anterior
        _ExperienceCard(
          title: 'Desenvolvedor Mobile',
          company: 'Scorefy, Taguatinga',
          period: '01/2021 - 06/2022',
          description:
              'Colaborei em todos os processos de desenvolvimento de apps e websites, incluindo:\n'
              '• Prototipagem (Adobe XD)\n'
              '• Front-End (Flutter, HTML & CSS)\n'
              '• Back-End (Node.js)\n'
              '• Design (Adobe Illustrator e Photoshop)\n'
              '• Documentação (dicionário de dados, funcionalidades, requisitos, relatórios)\n'
              '• Modelagem de dados e integrações (Firebase, AdMob, Stripe, REST API)',
          isCurrent: false,
        ),
      ],
    );
  }

  Widget _buildEducationContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Formação Acadêmica',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),

        const SizedBox(height: 32),

        _EducationCard(
          title: 'Computação - Licenciatura',
          institution: 'Universidade de Brasília (UnB)',
          period: '03/2023 - Presente',
          description:
              'Formação em Computação com foco em desenvolvimento de software, '
              'arquitetura de sistemas e metodologias de ensino em tecnologia.',
        ),
      ],
    );
  }
}

class _ExperienceCard extends StatelessWidget {
  final String title;
  final String company;
  final String period;
  final String description;
  final bool isCurrent;

  const _ExperienceCard({
    required this.title,
    required this.company,
    required this.period,
    required this.description,
    required this.isCurrent,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isCurrent
                ? Theme.of(context).colorScheme.primary.withOpacity(0.3)
                : Colors.transparent,
            width: 2,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                if (isCurrent)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      'Atual',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                if (isCurrent) const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),

            Text(
              company,
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
            ),

            const SizedBox(height: 4),

            Text(
              period,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                fontWeight: FontWeight.w500,
              ),
            ),

            const SizedBox(height: 16),

            Text(
              description,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(height: 1.6),
            ),
          ],
        ),
      ),
    );
  }
}

class _EducationCard extends StatelessWidget {
  final String title;
  final String institution;
  final String period;
  final String description;

  const _EducationCard({
    required this.title,
    required this.institution,
    required this.period,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
            width: 2,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              institution,
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
            ),

            const SizedBox(height: 4),

            Text(
              period,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                fontWeight: FontWeight.w500,
              ),
            ),

            const SizedBox(height: 16),

            Text(
              description,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(height: 1.6),
            ),
          ],
        ),
      ),
    );
  }
}
