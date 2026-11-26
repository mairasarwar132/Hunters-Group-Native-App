import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'site_content.dart';

abstract final class BrandColors {
  static const navy = Color(0xFF111827);
  static const blue = Color(0xFF2157E7);
  static const lightBlue = Color(0xFFF1F6FF);
  static const ink = Color(0xFF182235);
  static const muted = Color(0xFF667085);
  static const border = Color(0xFFE5EAF1);
  static const surface = Colors.white;
}

Uri whatsAppUri([String? message]) => Uri.https(
      'wa.me',
      '/923238874539',
      message == null ? null : {'text': message},
    );

Future<void> launchExternal(BuildContext context, Uri uri) async {
  final launched = await launchUrl(uri, mode: LaunchMode.externalApplication);
  if (!launched && context.mounted) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Could not open that link on this device.')),
    );
  }
}

class PageFrame extends StatelessWidget {
  const PageFrame({
    required this.currentRoute,
    required this.child,
    super.key,
  });

  final String currentRoute;
  final Widget child;

  int get _selectedIndex {
    if (currentRoute == '/about') return 1;
    if (currentRoute.startsWith('/services')) return 2;
    if (currentRoute == '/contact') return 3;
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BrandColors.surface,
      appBar: AppBar(
        backgroundColor: BrandColors.surface,
        surfaceTintColor: Colors.transparent,
        toolbarHeight: 72,
        titleSpacing: 18,
        title: InkWell(
          onTap: () => Navigator.of(context).pushNamedAndRemoveUntil('/', (_) => false),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerLeft,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/hunters-logo.png',
                  width: 42,
                  height: 42,
                  fit: BoxFit.contain,
                ),
                const SizedBox(width: 8),
                const Text.rich(
                  TextSpan(
                    style: TextStyle(
                      color: BrandColors.navy,
                      fontSize: 15,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 0.4,
                    ),
                    children: [
                      TextSpan(text: 'HUNTERS '),
                      TextSpan(
                        text: 'GROUP',
                        style: TextStyle(color: BrandColors.blue),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: [
          if (MediaQuery.sizeOf(context).width >= 380)
            TextButton.icon(
              onPressed: () => launchExternal(
                context,
                whatsAppUri('Hello Hunters Group, I would like to discuss your services.'),
              ),
              icon: const Icon(Icons.north_east, size: 16),
              label: const Text('Get a Quote'),
            )
          else
            IconButton(
              tooltip: 'Get a quote on WhatsApp',
              onPressed: () => launchExternal(context, whatsAppUri()),
              icon: const Icon(Icons.north_east),
            ),
          IconButton(
            tooltip: 'Open navigation menu',
            onPressed: () => _showMenu(context),
            icon: const Icon(Icons.menu_rounded),
          ),
          const SizedBox(width: 4),
        ],
      ),
      body: child,
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (currentRoute != '/assistant') ...[
            FloatingActionButton(
              heroTag: 'hunters-assistant',
              mini: true,
              tooltip: 'Open Hunters AI Assistant',
              backgroundColor: BrandColors.navy,
              foregroundColor: Colors.white,
              onPressed: () => Navigator.of(context).pushNamed('/assistant'),
              child: const Icon(Icons.chat_bubble_outline_rounded),
            ),
            const SizedBox(height: 10),
          ],
          FloatingActionButton(
            heroTag: 'hunters-whatsapp',
            mini: true,
            tooltip: 'Chat with Hunters Group on WhatsApp',
            backgroundColor: const Color(0xFF18B86A),
            foregroundColor: Colors.white,
            onPressed: () => launchExternal(context, whatsAppUri()),
            child: const Icon(Icons.chat_rounded),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        onDestinationSelected: (index) {
          const routes = ['/', '/about', '/services', '/contact'];
          final route = routes[index];
          if (route != currentRoute) {
            Navigator.of(context).pushNamedAndRemoveUntil(route, (_) => false);
          }
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.groups_outlined), label: 'About'),
          NavigationDestination(icon: Icon(Icons.grid_view_rounded), label: 'Services'),
          NavigationDestination(icon: Icon(Icons.chat_bubble_outline), label: 'Contact'),
        ],
      ),
    );
  }

  void _showMenu(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      backgroundColor: BrandColors.surface,
      builder: (sheetContext) => SafeArea(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.sizeOf(sheetContext).height * 0.82,
          ),
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.fromLTRB(20, 4, 20, 24),
            children: [
              const Text(
                'Explore Hunters Group',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 12),
              ...[
                ('Home', '/', Icons.home_outlined),
                ('About Us', '/about', Icons.groups_outlined),
                ('Why Hunters', '/why-hunters', Icons.stars_outlined),
                ('All Services', '/services', Icons.grid_view_rounded),
                ('Our Process', '/process', Icons.route_outlined),
                ('Results & Achievements', '/results', Icons.emoji_events_outlined),
                ('Events', '/events', Icons.event_outlined),
                ('Brands', '/brands', Icons.storefront_outlined),
                ('Hunters AI Assistant', '/assistant', Icons.chat_bubble_outline_rounded),
                ('Contact', '/contact', Icons.chat_bubble_outline),
              ].map((item) => ListTile(
                    leading: Icon(item.$3, color: BrandColors.blue),
                    title: Text(item.$1),
                    onTap: () {
                      Navigator.pop(sheetContext);
                      Navigator.of(context).pushNamed(item.$2);
                    },
                  )),
              const Divider(height: 20),
              const Padding(
                padding: EdgeInsets.fromLTRB(16, 8, 16, 4),
                child: Text(
                  'OUR SERVICES',
                  style: TextStyle(
                    color: BrandColors.muted,
                    fontSize: 11,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
              ...services.map((service) => ListTile(
                    dense: true,
                    title: Text(service.title),
                    trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 14),
                    onTap: () {
                      Navigator.pop(sheetContext);
                      Navigator.of(context).pushNamed(service.route);
                    },
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class ContentWidth extends StatelessWidget {
  const ContentWidth({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) => Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1120),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: child,
          ),
        ),
      );
}

class SectionHeading extends StatelessWidget {
  const SectionHeading({
    required this.title,
    this.eyebrow,
    this.description,
    this.center = false,
    super.key,
  });

  final String title;
  final String? eyebrow;
  final String? description;
  final bool center;

  @override
  Widget build(BuildContext context) {
    final alignment = center ? CrossAxisAlignment.center : CrossAxisAlignment.start;
    return Column(
      crossAxisAlignment: alignment,
      children: [
        if (eyebrow != null) ...[
          Text(
            eyebrow!.toUpperCase(),
            textAlign: center ? TextAlign.center : TextAlign.start,
            style: const TextStyle(
              color: BrandColors.blue,
              fontSize: 11,
              fontWeight: FontWeight.w800,
              letterSpacing: 1.35,
            ),
          ),
          const SizedBox(height: 10),
        ],
        Text(
          title,
          textAlign: center ? TextAlign.center : TextAlign.start,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: BrandColors.navy,
                fontWeight: FontWeight.w800,
                height: 1.18,
              ),
        ),
        if (description != null) ...[
          const SizedBox(height: 10),
          Text(
            description!,
            textAlign: center ? TextAlign.center : TextAlign.start,
            style: const TextStyle(
              color: BrandColors.muted,
              fontSize: 15,
              height: 1.6,
            ),
          ),
        ],
      ],
    );
  }
}

class HeroPanel extends StatelessWidget {
  const HeroPanel({
    required this.eyebrow,
    required this.title,
    required this.description,
    required this.primaryLabel,
    required this.primaryAction,
    this.secondaryLabel,
    this.secondaryAction,
    this.image,
    super.key,
  });

  final String eyebrow;
  final String title;
  final String description;
  final String primaryLabel;
  final VoidCallback primaryAction;
  final String? secondaryLabel;
  final VoidCallback? secondaryAction;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: BrandColors.lightBlue,
        borderRadius: BorderRadius.circular(26),
      ),
      padding: const EdgeInsets.all(24),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final wide = constraints.maxWidth > 680 && image != null;
          final copy = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: BrandColors.border),
                ),
                child: Text(
                  eyebrow.toUpperCase(),
                  style: const TextStyle(
                    color: BrandColors.blue,
                    fontSize: 10,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.8,
                  ),
                ),
              ),
              const SizedBox(height: 18),
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: BrandColors.navy,
                      fontSize: constraints.maxWidth < 420 ? 30 : 38,
                      fontWeight: FontWeight.w900,
                      height: 1.1,
                      letterSpacing: -0.7,
                    ),
              ),
              const SizedBox(height: 14),
              Text(
                description,
                style: const TextStyle(
                  color: BrandColors.ink,
                  fontSize: 15,
                  height: 1.65,
                ),
              ),
              const SizedBox(height: 22),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  FilledButton.icon(
                    onPressed: primaryAction,
                    icon: const Icon(Icons.arrow_forward_rounded, size: 18),
                    label: Text(primaryLabel),
                  ),
                  if (secondaryLabel != null && secondaryAction != null)
                    OutlinedButton(
                      onPressed: secondaryAction,
                      child: Text(secondaryLabel!),
                    ),
                ],
              ),
            ],
          );
          if (!wide) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                copy,
                if (image != null) ...[
                  const SizedBox(height: 22),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    child: AspectRatio(
                      aspectRatio: 1.55,
                      child: AssetPhoto(
                        path: image!,
                        fit: image!.endsWith('hunters-logo.png') ? BoxFit.contain : BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ],
            );
          }
          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(flex: 6, child: copy),
              const SizedBox(width: 24),
              Expanded(
                flex: 5,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: AspectRatio(
                    aspectRatio: 0.96,
                    child: AssetPhoto(
                      path: image!,
                      fit: image!.endsWith('hunters-logo.png') ? BoxFit.contain : BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class ResponsiveGrid extends StatelessWidget {
  const ResponsiveGrid({required this.children, super.key});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final count = constraints.maxWidth >= 900
            ? 3
            : constraints.maxWidth >= 560
                ? 2
                : 1;
        const gap = 16.0;
        final width = (constraints.maxWidth - gap * (count - 1)) / count;
        return Wrap(
          spacing: gap,
          runSpacing: gap,
          children: children
              .map((child) => SizedBox(width: width, child: child))
              .toList(),
        );
      },
    );
  }
}

class AssetPhoto extends StatelessWidget {
  const AssetPhoto({
    required this.path,
    this.fit = BoxFit.cover,
    this.alignment = Alignment.center,
    super.key,
  });

  final String path;
  final BoxFit fit;
  final Alignment alignment;

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;
          final cacheWidth = width.isFinite && width > 0
              ? (width * MediaQuery.devicePixelRatioOf(context)).round().clamp(1, 4096).toInt()
              : null;
          return Image.asset(
            path,
            fit: fit,
            alignment: alignment,
            cacheWidth: cacheWidth,
            errorBuilder: (context, error, stackTrace) => Container(
              color: BrandColors.lightBlue,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.image_not_supported_outlined, color: BrandColors.muted),
                  SizedBox(height: 4),
                  Text(
                    'Image unavailable',
                    style: TextStyle(color: BrandColors.muted, fontSize: 11),
                  ),
                ],
              ),
            ),
          );
        },
      );
}

class ServiceCard extends StatelessWidget {
  const ServiceCard({required this.service, super.key});

  final ServiceInfo service;

  @override
  Widget build(BuildContext context) => Card(
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () => Navigator.of(context).pushNamed(service.route),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1.8,
                child: AssetPhoto(path: service.image),
              ),
              Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      service.title,
                      style: const TextStyle(
                        color: BrandColors.navy,
                        fontSize: 17,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      service.description,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: BrandColors.muted,
                        height: 1.5,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 14),
                    const Row(
                      children: [
                        Text(
                          'Explore service',
                          style: TextStyle(
                            color: BrandColors.blue,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(width: 7),
                        Icon(Icons.arrow_forward_rounded, color: BrandColors.blue, size: 18),
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

class InfoCard extends StatelessWidget {
  const InfoCard({
    required this.title,
    required this.description,
    this.icon = Icons.check_circle_outline_rounded,
    this.onTap,
    super.key,
  });

  final String title;
  final String description;
  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => Card(
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(18),
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(icon, color: BrandColors.blue, size: 24),
                const SizedBox(height: 14),
                Text(
                  title,
                  style: const TextStyle(
                    color: BrandColors.navy,
                    fontWeight: FontWeight.w800,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: const TextStyle(
                    color: BrandColors.muted,
                    fontSize: 13,
                    height: 1.55,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}

class PageFooter extends StatelessWidget {
  const PageFooter({super.key});

  @override
  Widget build(BuildContext context) => Container(
        width: double.infinity,
        padding: const EdgeInsets.fromLTRB(20, 26, 20, 30),
        decoration: const BoxDecoration(
          color: Color(0xFFF7F9FC),
          border: Border(top: BorderSide(color: BrandColors.border)),
        ),
        child: ContentWidth(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset('assets/images/hunters-logo.png', width: 42, height: 42),
                  const SizedBox(width: 10),
                  const Text(
                    'HUNTERS GROUP',
                    style: TextStyle(
                      color: BrandColors.navy,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 0.6,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              const Text(
                'Connecting businesses with practical trade, sourcing and logistics solutions across global markets.',
                style: TextStyle(color: BrandColors.muted, height: 1.55),
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 8,
                children: [
                  TextButton(
                    onPressed: () => launchExternal(context, Uri.parse('tel:+923238874539')),
                    child: const Text('+92 323 8874539'),
                  ),
                  TextButton(
                    onPressed: () => launchExternal(
                      context,
                      Uri.parse('https://www.instagram.com/hunters_group71/'),
                    ),
                    child: const Text('Instagram'),
                  ),
                  TextButton(
                    onPressed: () => launchExternal(
                      context,
                      Uri.parse('https://www.facebook.com/Huntersgroup71/'),
                    ),
                    child: const Text('Facebook'),
                  ),
                  TextButton(
                    onPressed: () => launchExternal(context, whatsAppUri()),
                    child: const Text('WhatsApp'),
                  ),
                ],
              ),
              Wrap(
                spacing: 4,
                runSpacing: 4,
                children: [
                  for (final item in const [
                    ('Home', '/'),
                    ('About Us', '/about'),
                    ('Why Hunters', '/why-hunters'),
                    ('Our Process', '/process'),
                    ('Services', '/services'),
                    ('Results', '/results'),
                    ('Events', '/events'),
                    ('Brands', '/brands'),
                    ('Contact', '/contact'),
                  ])
                    TextButton(
                      onPressed: () => Navigator.of(context).pushNamed(item.$2),
                      child: Text(item.$1),
                    ),
                ],
              ),
              const Divider(height: 24),
              Text(
                '© ${DateTime.now().year} Hunters Group. All rights reserved.',
                style: const TextStyle(color: BrandColors.muted, fontSize: 12),
              ),
            ],
          ),
        ),
      );
}

class ProcessSteps extends StatelessWidget {
  const ProcessSteps({required this.steps, super.key});

  final List<Offering> steps;

  @override
  Widget build(BuildContext context) => ResponsiveGrid(
        children: [
          for (var index = 0; index < steps.length; index++)
            InfoCard(
              icon: Icons.route_outlined,
              title: '${(index + 1).toString().padLeft(2, '0')}  ${steps[index].title}',
              description: steps[index].description,
            ),
        ],
      );
}

class OfferingsGrid extends StatelessWidget {
  const OfferingsGrid({required this.offerings, super.key});

  final List<Offering> offerings;

  @override
  Widget build(BuildContext context) => ResponsiveGrid(
        children: [
          for (var index = 0; index < offerings.length; index++)
            InfoCard(
              icon: Icons.arrow_outward_rounded,
              title: offerings[index].title,
              description: offerings[index].description,
            ),
        ],
      );
}

class FaqList extends StatelessWidget {
  const FaqList({required this.faqs, super.key});

  final List<Offering> faqs;

  @override
  Widget build(BuildContext context) => Column(
        children: [
          for (final faq in faqs)
            Card(
              child: ExpansionTile(
                title: Text(
                  faq.title,
                  style: const TextStyle(
                    color: BrandColors.navy,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      faq.description,
                      style: const TextStyle(color: BrandColors.muted, height: 1.5),
                    ),
                  ),
                ],
              ),
            ),
        ],
      );
}

class CalloutPanel extends StatelessWidget {
  const CalloutPanel({
    required this.title,
    required this.description,
    required this.buttonLabel,
    required this.onPressed,
    super.key,
  });

  final String title;
  final String description;
  final String buttonLabel;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) => Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: BrandColors.navy,
          borderRadius: BorderRadius.circular(22),
        ),
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                  ),
            ),
            const SizedBox(height: 10),
            Text(
              description,
              style: const TextStyle(color: Color(0xFFD8E1F2), height: 1.55),
            ),
            const SizedBox(height: 18),
            FilledButton.icon(
              onPressed: onPressed,
              icon: const Icon(Icons.arrow_forward_rounded),
              label: Text(buttonLabel),
              style: FilledButton.styleFrom(
                backgroundColor: BrandColors.blue,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      );
}

void showPhoto(BuildContext context, String imagePath) {
  showDialog<void>(
    context: context,
    builder: (context) => Dialog(
      insetPadding: const EdgeInsets.all(18),
      child: Stack(
        children: [
          InteractiveViewer(
            child: AssetPhoto(path: imagePath, fit: BoxFit.contain),
          ),
          Positioned(
            right: 4,
            top: 4,
            child: IconButton(
              onPressed: () => Navigator.pop(context),
              tooltip: 'Close image',
              icon: const Icon(Icons.close),
            ),
          ),
        ],
      ),
    ),
  );
}
