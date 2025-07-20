import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/app_colors.dart';
import '../constants/app_text.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback onKnowMoreTap;

  const HeroSection({super.key, required this.onKnowMoreTap});

  Future<void> _launchUrl(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      decoration: BoxDecoration(gradient: AppColors.darkGradient),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Avatar/Foto
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primaryBlue.withOpacity(0.3),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/profile.jpg',
                    width: 120,
                    height: 120,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              const SizedBox(height: 32),

              // Nome
              Text(
                AppText.name,
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 16),

              // Tagline
              Text(
                AppText.tagline,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Colors.white.withOpacity(0.9),
                  fontWeight: FontWeight.normal,
                ),
                textAlign: TextAlign.center,
                maxLines: 3,
              ),

              const SizedBox(height: 48),

              // Botões de ação
              LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth < 768) {
                    // Layout vertical para telas pequenas
                    return Column(
                      children: [
                        // Botão WhatsApp
                        SizedBox(
                          width: 200,
                          child: ElevatedButton.icon(
                            onPressed: () => _launchUrl(AppText.whatsappUrl),
                            icon: const Icon(Icons.chat),
                            label: Text(AppText.contactWhatsApp),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF25D366),
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 16,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 16),

                        // Botão LinkedIn
                        SizedBox(
                          width: 200,
                          child: OutlinedButton.icon(
                            onPressed: () => _launchUrl(AppText.linkedinUrl),
                            icon: const Icon(Icons.work),
                            label: const Text('LinkedIn'),
                            style: OutlinedButton.styleFrom(
                              foregroundColor: Colors.white,
                              side: const BorderSide(color: Colors.white),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 16,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 16),

                        // Botão GitHub
                        SizedBox(
                          width: 200,
                          child: OutlinedButton.icon(
                            onPressed: () => _launchUrl(AppText.githubUrl),
                            icon: const Icon(Icons.code),
                            label: const Text('GitHub'),
                            style: OutlinedButton.styleFrom(
                              foregroundColor: Colors.white,
                              side: const BorderSide(color: Colors.white),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  } else {
                    // Layout horizontal para telas maiores
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Botão WhatsApp
                        ElevatedButton.icon(
                          onPressed: () => _launchUrl(AppText.whatsappUrl),
                          icon: const Icon(Icons.chat),
                          label: Text(AppText.contactWhatsApp),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF25D366),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 16,
                            ),
                          ),
                        ),

                        const SizedBox(width: 16),

                        // Botão LinkedIn
                        OutlinedButton.icon(
                          onPressed: () => _launchUrl(AppText.linkedinUrl),
                          icon: const Icon(Icons.work),
                          label: const Text('LinkedIn'),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.white,
                            side: const BorderSide(color: Colors.white),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 16,
                            ),
                          ),
                        ),

                        const SizedBox(width: 16),

                        // Botão GitHub
                        OutlinedButton.icon(
                          onPressed: () => _launchUrl(AppText.githubUrl),
                          icon: const Icon(Icons.code),
                          label: const Text('GitHub'),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.white,
                            side: const BorderSide(color: Colors.white),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 16,
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                },
              ),

              const SizedBox(height: 32),

              // Botão "Conheça meus projetos"
              TextButton(
                onPressed: onKnowMoreTap,
                child: Text(
                  AppText.knowMore,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.white.withOpacity(0.8),
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),

              const SizedBox(height: 48),

              // Scroll indicator
              const Icon(
                Icons.keyboard_arrow_down,
                color: Colors.white,
                size: 32,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
