import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_text.dart';
import '../models/skill.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
      child: Column(
        children: [
          // Título da seção
          Text(
            AppText.skillsTitle,
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

          // Categorias de habilidades
          ...SkillData.getCategories().map(
            (category) => _SkillCategory(
              category: category,
              skills: SkillData.getSkillsByCategory(category),
            ),
          ),

          const SizedBox(height: 48),

          // Soft Skills
          _SoftSkillsSection(),
        ],
      ),
    );
  }
}

class _SkillCategory extends StatelessWidget {
  final String category;
  final List<Skill> skills;

  const _SkillCategory({required this.category, required this.skills});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width >= 570 ? double.infinity : null,
      margin: const EdgeInsets.only(bottom: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            category,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),

          const SizedBox(height: 24),

          // Grid de habilidades
          LayoutBuilder(
            builder: (context, constraints) {
              // int crossAxisCount = constraints.maxWidth > 1024
              //     ? 4
              //     : constraints.maxWidth > 768
              //     ? 3
              //     : 2;

              // return GridView.builder(
              //   shrinkWrap: true,
              //   physics: const NeverScrollableScrollPhysics(),
              //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //     crossAxisCount: crossAxisCount,
              //     crossAxisSpacing: 12,
              //     mainAxisSpacing: 12,
              //     childAspectRatio: constraints.maxWidth > 768 ? 5 : 4,
              //   ),
              //   itemCount: skills.length,
              //   itemBuilder: (context, index) {
              //     return _SkillCard(skill: skills[index]);
              //   },
              // );
              return Wrap(
                children: skills
                    .map((skill) => _SkillCard(skill: skill))
                    .toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _SkillCard extends StatelessWidget {
  final Skill skill;

  const _SkillCard({required this.skill});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Container(
        width: MediaQuery.of(context).size.width > 768 ? 250 : double.infinity,
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    skill.name,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  '${skill.level}/5',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w600,
                    fontSize: 11,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 6),

            // Barra de progresso
            SizedBox(
              height: 4,
              child: LinearProgressIndicator(
                value: skill.level / 5,
                backgroundColor: Theme.of(context).colorScheme.surface,
                valueColor: AlwaysStoppedAnimation<Color>(
                  Theme.of(context).colorScheme.primary,
                ),
                minHeight: 4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SoftSkillsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppText.softSkillsTitle,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),

        const SizedBox(height: 24),

        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: SkillData.softSkills
              .map(
                (skill) => Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(
                      context,
                    ).colorScheme.primary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Theme.of(
                        context,
                      ).colorScheme.primary.withValues(alpha: 0.3),
                    ),
                  ),
                  child: Text(
                    skill,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
