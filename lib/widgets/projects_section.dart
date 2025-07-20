import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/app_colors.dart';
import '../constants/app_text.dart';
import '../models/project.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  Future<void> _launchUrl(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
      child: Column(
        children: [
          // Título da seção
          Text(
            AppText.projectsTitle,
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

          // Grid de projetos
          LayoutBuilder(
            builder: (context, constraints) {
              // int crossAxisCount = constraints.maxWidth > 1024
              //     ? 3
              //     : constraints.maxWidth > 768
              //     ? 2
              //     : 1;

              return Wrap(
                children: ProjectData.projects
                    .map(
                      (project) => _ProjectCard(
                        project: project,
                        onLaunchUrl: _launchUrl,
                      ),
                    )
                    .toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _ProjectCard extends StatelessWidget {
  final Project project;
  final Function(String) onLaunchUrl;

  const _ProjectCard({required this.project, required this.onLaunchUrl});

  double _getCardWidth(BuildContext context) {
    return MediaQuery.of(context).size.width > 1024
        ? 500
        : MediaQuery.of(context).size.width > 768
        ? 400
        : MediaQuery.of(context).size.width - 48;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: SizedBox(
        width: _getCardWidth(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Carrossel de imagens do projeto
            _ProjectImageCarousel(imageUrls: project.imageUrls),

            const SizedBox(height: 16),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Conteúdo do projeto
                  Text(
                    project.title,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),

                  const SizedBox(height: 8),

                  // Descrição
                  Text(
                    project.description,
                    style: Theme.of(context).textTheme.bodyMedium,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),

                  const SizedBox(height: 12),

                  // Problema resolvido
                  Text(
                    'Problema:',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    project.problem,
                    style: Theme.of(context).textTheme.bodySmall,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),

                  const SizedBox(height: 12),

                  // Tecnologias
                  Text(
                    'Tecnologias:',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),

                  const SizedBox(height: 4),

                  Wrap(
                    spacing: 4,
                    runSpacing: 4,
                    children: project.technologies
                        .map(
                          (tech) => Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Theme.of(
                                context,
                              ).colorScheme.primary.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              tech,
                              style: Theme.of(context).textTheme.bodySmall
                                  ?.copyWith(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.primary,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                        )
                        .toList(),
                  ),

                  const SizedBox(height: 16),

                  // Botões de ação
                  Row(
                    children: [
                      if (project.demoUrl != null)
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () => onLaunchUrl(project.demoUrl!),
                            child: Text(AppText.viewProject),
                          ),
                        ),

                      if (project.demoUrl != null &&
                          project.repositoryUrl != null)
                        const SizedBox(width: 8),

                      if (project.repositoryUrl != null)
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () =>
                                onLaunchUrl(project.repositoryUrl!),
                            child: Text(AppText.viewCode),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProjectImageCarousel extends StatefulWidget {
  final List<String> imageUrls;

  const _ProjectImageCarousel({required this.imageUrls});

  @override
  State<_ProjectImageCarousel> createState() => _ProjectImageCarouselState();
}

class _ProjectImageCarouselState extends State<_ProjectImageCarousel> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
        child: widget.imageUrls.isNotEmpty
            ? Stack(
                children: [
                  PageView.builder(
                    onPageChanged: (index) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                    itemCount: widget.imageUrls.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.width > 768
                            ? 200
                            : 150,
                        decoration: BoxDecoration(
                          gradient: AppColors.primaryGradient,
                        ),
                        child: Stack(
                          children: [
                            // Imagem de fundo (placeholder por enquanto)
                            Container(
                              width: double.infinity,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                gradient: AppColors.primaryGradient,
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.image,
                                  size: 48,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            // Overlay com informações da imagem
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.transparent,
                                      Colors.black.withOpacity(0.7),
                                    ],
                                  ),
                                ),
                                child: Text(
                                  'Imagem ${index + 1} de ${widget.imageUrls.length}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  // Indicadores de página
                  Positioned(
                    bottom: 8,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: widget.imageUrls.asMap().entries.map((entry) {
                        return GestureDetector(
                          onTap: () {
                            // Aqui você pode adicionar navegação programática se necessário
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            width: _currentIndex == entry.key ? 24 : 8,
                            height: 8,
                            margin: const EdgeInsets.symmetric(horizontal: 2),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: _currentIndex == entry.key
                                  ? Colors.white
                                  : Colors.white.withOpacity(0.5),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              )
            : Container(
                decoration: BoxDecoration(gradient: AppColors.primaryGradient),
                child: const Center(
                  child: Icon(Icons.image, size: 48, color: Colors.white),
                ),
              ),
      ),
    );
  }
}
