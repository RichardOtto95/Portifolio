import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/app_colors.dart';
import '../constants/app_text.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  Future<void> _launchUrl(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
      decoration: BoxDecoration(gradient: AppColors.darkGradient),
      child: Column(
        children: [
          // Links sociais
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _SocialLink(
                icon: Icons.chat,
                label: 'WhatsApp',
                onTap: () => _launchUrl(AppText.whatsappUrl),
                color: const Color(0xFF25D366),
              ),
              const SizedBox(width: 24),
              _SocialLink(
                icon: Icons.link,
                label: 'LinkedIn',
                onTap: () => _launchUrl(AppText.linkedinUrl),
                color: const Color(0xFF0077B5),
              ),
              const SizedBox(width: 24),
              _SocialLink(
                icon: Icons.code,
                label: 'GitHub',
                onTap: () => _launchUrl(AppText.githubUrl),
                color: Colors.white,
              ),
            ],
          ),

          const SizedBox(height: 32),

          // Linha divisória
          Container(height: 1, color: Colors.white.withOpacity(0.2)),

          const SizedBox(height: 32),

          // Copyright
          Text(
            AppText.footerText,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.white.withOpacity(0.7),
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 16),

          // Informações adicionais
          Text(
            'Desenvolvido com Flutter e muito ❤️ | 44 repositórios no GitHub',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Colors.white.withOpacity(0.5),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _SocialLink extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final Color color;

  const _SocialLink({
    required this.icon,
    required this.label,
    required this.onTap,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white.withOpacity(0.2)),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color, size: 20),
            const SizedBox(width: 8),
            Text(
              label,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
