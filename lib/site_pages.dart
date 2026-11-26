import 'package:flutter/material.dart';

import 'site_content.dart';
import 'site_widgets.dart';

const _sectionGap = SizedBox(height: 48);
const _smallGap = SizedBox(height: 22);

Widget _pageBody(List<Widget> sections) => SingleChildScrollView(
      child: Column(
        children: [
          ContentWidth(
            child: Padding(
              padding: const EdgeInsets.only(top: 22, bottom: 42),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: sections,
              ),
            ),
          ),
          const PageFooter(),
        ],
      ),
    );

void _openWhatsApp(BuildContext context, [String? message]) {
  launchExternal(context, whatsAppUri(message));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => _pageBody([
        HeroPanel(
          eyebrow: 'GLOBAL TRADE · E-COMMERCE · LOGISTICS',
          title: 'Your Business. Beyond Borders.',
          description:
              'From e-commerce and international sourcing to import, export and warehousing — we help connect your business to new opportunities across global markets.',
          primaryLabel: 'Explore Our Services',
          primaryAction: () => Navigator.of(context).pushNamed('/services'),
          secondaryLabel: "Let's Talk",
          secondaryAction: () => _openWhatsApp(context),
        ),
        _smallGap,
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: const [
            _BenefitChip(label: 'Business-focused solutions'),
            _BenefitChip(label: 'Global trade support'),
            _BenefitChip(label: 'Multiple services, one partner'),
          ],
        ),
        _sectionGap,
        Card(
          clipBehavior: Clip.antiAlias,
          child: LayoutBuilder(
            builder: (context, constraints) {
              final wide = constraints.maxWidth > 650;
              final art = ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: AspectRatio(
                  aspectRatio: wide ? 1.65 : 1.9,
                  child: const AssetPhoto(
                    path: 'assets/images/partnership/pakistan-china.png',
                  ),
                ),
              );
              final text = const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'INTERNATIONAL PARTNERSHIP',
                    style: TextStyle(
                      color: BrandColors.blue,
                      letterSpacing: 1.1,
                      fontSize: 10,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(height: 9),
                  Text(
                    'Pakistan × China',
                    style: TextStyle(
                      color: BrandColors.navy,
                      fontWeight: FontWeight.w900,
                      fontSize: 23,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'Connecting Markets. Creating Opportunities.',
                    style: TextStyle(color: BrandColors.muted),
                  ),
                ],
              );
              return Padding(
                padding: const EdgeInsets.all(16),
                child: wide
                    ? Row(
                        children: [
                          Expanded(child: text),
                          const SizedBox(width: 20),
                          Expanded(child: art),
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [text, const SizedBox(height: 16), art],
                      ),
              );
            },
          ),
        ),
        _sectionGap,
        SectionHeading(
          eyebrow: 'Our Services',
          title: 'Solutions built for your next stage of growth.',
          description:
              'From online marketplaces to international trade, explore business solutions designed around your goals.',
        ),
        _smallGap,
        ResponsiveGrid(
          children: services.map((service) => ServiceCard(service: service)).toList(),
        ),
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: OutlinedButton.icon(
              onPressed: () => Navigator.of(context).pushNamed('/services'),
              icon: const Icon(Icons.arrow_forward_rounded),
              label: const Text('View All Services'),
            ),
          ),
        ),
        _sectionGap,
        SectionHeading(
          eyebrow: 'Our Official Registrations',
          title: 'Registrations & Affiliations.',
        ),
        _smallGap,
        ResponsiveGrid(
          children: List.generate(
            registrationNames.length,
            (index) => _RegistrationCard(
              title: registrationNames[index],
              image: registrationImages[index],
            ),
          ),
        ),
        _sectionGap,
        SectionHeading(
          eyebrow: 'Why Hunters Group',
          title: "Business is complex. Your support shouldn't be.",
          description:
              'We bring related services together, so you can spend less time coordinating separate moving parts and more time focusing on your business.',
        ),
        _smallGap,
        const ResponsiveGrid(
          children: [
            InfoCard(
              icon: Icons.public_rounded,
              title: 'Global Perspective',
              description: 'Solutions designed for businesses working across borders.',
            ),
            InfoCard(
              icon: Icons.handshake_outlined,
              title: 'Dependable Support',
              description: 'A professional approach to every stage of the process.',
            ),
            InfoCard(
              icon: Icons.hub_outlined,
              title: 'Connected Services',
              description: 'Trade, sourcing and warehousing under one roof.',
            ),
            InfoCard(
              icon: Icons.support_agent_rounded,
              title: 'Personal Assistance',
              description: 'Clear communication and support when you need it.',
            ),
          ],
        ),
        _sectionGap,
        const SectionHeading(
          eyebrow: 'A Clear Way Forward',
          title: 'Simple steps. Real progress.',
          description:
              'A straightforward process designed around your requirements and the services you need.',
        ),
        _smallGap,
        const ProcessSteps(
          steps: [
            Offering('Tell Us Your Needs', 'Share your product, sourcing, shipping or business requirements.'),
            Offering('Plan the Solution', 'Discuss suitable options, requirements and the next steps.'),
            Offering('Move Forward', 'Coordinate the agreed services with clear communication.'),
            Offering('Grow Your Business', 'Build stronger operations and explore new opportunities.'),
          ],
        ),
        _sectionGap,
        CalloutPanel(
          title: 'Have a business goal in mind?',
          description:
              "Tell us what you need. Let's explore the right solution for your business together.",
          buttonLabel: 'Discuss Your Project',
          onPressed: () => _openWhatsApp(
            context,
            'Hello Hunters Group, I would like to discuss your services.',
          ),
        ),
        _sectionGap,
        _SecondaryLinks(onOpen: (route) => Navigator.of(context).pushNamed(route)),
      ]);
}

class _BenefitChip extends StatelessWidget {
  const _BenefitChip({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: BrandColors.lightBlue,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          label,
          style: const TextStyle(
            color: BrandColors.navy,
            fontSize: 12,
            fontWeight: FontWeight.w700,
          ),
        ),
      );
}

class _RegistrationCard extends StatelessWidget {
  const _RegistrationCard({required this.title, required this.image});

  final String title;
  final String image;

  @override
  Widget build(BuildContext context) => Card(
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            children: [
              SizedBox(height: 86, child: AssetPhoto(path: image, fit: BoxFit.contain)),
              const SizedBox(height: 12),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: BrandColors.navy,
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      );
}

class _SecondaryLinks extends StatelessWidget {
  const _SecondaryLinks({required this.onOpen});

  final ValueChanged<String> onOpen;

  @override
  Widget build(BuildContext context) => Wrap(
        spacing: 10,
        runSpacing: 10,
        children: [
          for (final item in const [
            ('About Hunters Group', '/about'),
            ('Why Hunters', '/why-hunters'),
            ('Our Process', '/process'),
            ('Results & Achievements', '/results'),
            ('Events', '/events'),
            ('Our Brands', '/brands'),
            ('Contact', '/contact'),
          ])
            OutlinedButton(
              onPressed: () => onOpen(item.$2),
              child: Text(item.$1),
            ),
        ],
      );
}

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  final _storyKey = GlobalKey();

  @override
  Widget build(BuildContext context) => _pageBody([
        HeroPanel(
          eyebrow: 'GET TO KNOW HUNTERS GROUP',
          title: 'Building Businesses. Connecting the World.',
          description:
              'Empowering businesses through innovation, technology, e-commerce solutions, digital services and global trade.',
          primaryLabel: "Let's Work Together",
          primaryAction: () => Navigator.of(context).pushNamed('/contact'),
          secondaryLabel: 'Discover Our Story',
          secondaryAction: () {
            final target = _storyKey.currentContext;
            if (target != null) {
              Scrollable.ensureVisible(target, duration: const Duration(milliseconds: 350));
            }
          },
          image: 'assets/images/hunters-logo.png',
        ),
        _sectionGap,
        KeyedSubtree(
          key: _storyKey,
          child: const SectionHeading(
            eyebrow: 'Who We Are',
            title: 'About Hunters Group',
            description:
                'Hunters Group is a multi-service business and digital solutions company established in 2021, with a vision to empower businesses through innovation, technology and global trade.',
          ),
        ),
        _smallGap,
        const Text(
          'We specialize in Amazon, eBay, Etsy, Shopify, digital marketing, website development, and import and export services. Our mission is to help businesses grow locally and internationally through innovative e-commerce solutions, digital services and global business opportunities.',
          style: TextStyle(color: BrandColors.ink, height: 1.7),
        ),
        _smallGap,
        Card(
          color: BrandColors.lightBlue,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                const Expanded(
                  child: Text(
                    'Hunters Group — Building Businesses, Creating Opportunities, Connecting the World.',
                    style: TextStyle(
                      color: BrandColors.navy,
                      fontWeight: FontWeight.w800,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Image.asset('assets/images/hunters-logo.png', width: 58, height: 58),
              ],
            ),
          ),
        ),
        _sectionGap,
        const ResponsiveGrid(
          children: [
            InfoCard(
              icon: Icons.flag_outlined,
              title: 'Our Mission · Helping Businesses Grow',
              description:
                  'Help businesses grow locally and internationally through innovative e-commerce solutions, digital services and global business opportunities.',
            ),
            InfoCard(
              icon: Icons.public_outlined,
              title: 'Our Vision · Connecting the World',
              description:
                  'Build lasting partnerships, develop talent and connect businesses with opportunities across international markets.',
            ),
          ],
        ),
        _sectionGap,
        const SectionHeading(
          eyebrow: 'Leadership & Department Heads',
          title: 'Meet our team members.',
          description:
              "The people guiding Hunters Group's vision, management, business direction, trade operations and technology.",
        ),
        _smallGap,
        ResponsiveGrid(
          children: teamMembers
              .map((person) => _TeamCard(person: person))
              .toList(),
        ),
        _sectionGap,
        const SectionHeading(
          eyebrow: 'What Guides Us',
          title: 'The values behind our work.',
        ),
        _smallGap,
        const ResponsiveGrid(
          children: [
            InfoCard(
              icon: Icons.handshake_outlined,
              title: 'Long-Term Partnerships',
              description:
                  'We value lasting business relationships built on communication, trust and mutual understanding.',
            ),
            InfoCard(
              icon: Icons.verified_outlined,
              title: 'Professional Integrity',
              description:
                  'We approach our work with responsibility, transparency and respect for our business partners.',
            ),
            InfoCard(
              icon: Icons.trending_up_rounded,
              title: 'Business Growth',
              description:
                  'We help businesses explore opportunities, strengthen their digital presence and reach new markets.',
            ),
          ],
        ),
        _sectionGap,
        CalloutPanel(
          title: "Let's build new opportunities.",
          description:
              'Have a business requirement or want to explore a partnership? Start a conversation with Hunters Group.',
          buttonLabel: 'Contact Hunters Group',
          onPressed: () => Navigator.of(context).pushNamed('/contact'),
        ),
      ]);
}

class _TeamCard extends StatelessWidget {
  const _TeamCard({required this.person});

  final ({String name, String role, String detail, String image}) person;

  @override
  Widget build(BuildContext context) => Card(
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () => _showTeamProfile(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(aspectRatio: 1.25, child: AssetPhoto(path: person.image)),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      person.role.toUpperCase(),
                      style: const TextStyle(
                        color: BrandColors.blue,
                        fontWeight: FontWeight.w800,
                        fontSize: 10,
                        letterSpacing: 0.6,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      person.name,
                      style: const TextStyle(
                        color: BrandColors.navy,
                        fontWeight: FontWeight.w800,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 7),
                    Text(
                      person.detail,
                      style: const TextStyle(
                        color: BrandColors.muted,
                        fontSize: 13,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Row(
                      children: [
                        Text(
                          'View Profile',
                          style: TextStyle(
                            color: BrandColors.blue,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(width: 6),
                        Icon(Icons.arrow_forward_rounded, color: BrandColors.blue, size: 17),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );

  void _showTeamProfile(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      isScrollControlled: true,
      builder: (sheetContext) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(22, 8, 22, 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: SizedBox(
                      width: 82,
                      height: 82,
                      child: AssetPhoto(path: person.image),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          person.role,
                          style: const TextStyle(
                            color: BrandColors.blue,
                            fontWeight: FontWeight.w800,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          person.name,
                          style: const TextStyle(
                            color: BrandColors.navy,
                            fontWeight: FontWeight.w800,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    tooltip: 'Close profile',
                    onPressed: () => Navigator.pop(sheetContext),
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(person.detail, style: const TextStyle(height: 1.6)),
              const SizedBox(height: 18),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () {
                    Navigator.pop(sheetContext);
                    _openWhatsApp(context);
                  },
                  child: const Text('Contact Hunters Group'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) => _pageBody([
        const SectionHeading(
          eyebrow: 'Our Services',
          title: 'Business solutions for your next stage of growth.',
          description:
              'Explore all service categories from e-commerce and digital development to international trade and shipping.',
        ),
        _smallGap,
        ResponsiveGrid(
          children: services.map((service) => ServiceCard(service: service)).toList(),
        ),
        _sectionGap,
        const SectionHeading(
          eyebrow: 'E-Commerce Platforms',
          title: 'Marketplace support, all in one place.',
          description:
              'Choose a platform to explore the corresponding seller, shop or store services.',
        ),
        _smallGap,
        ResponsiveGrid(
          children: marketplaces
              .map((marketplace) => _MarketplaceCard(marketplace: marketplace))
              .toList(),
        ),
        _sectionGap,
        CalloutPanel(
          title: 'Not sure which service fits?',
          description:
              'Tell us about your business goals and our team can discuss suitable support options.',
          buttonLabel: 'Discuss Your Requirements',
          onPressed: () => _openWhatsApp(context),
        ),
      ]);
}

class WhyHuntersPage extends StatelessWidget {
  const WhyHuntersPage({super.key});

  @override
  Widget build(BuildContext context) => _pageBody([
        HeroPanel(
          eyebrow: 'Why Hunters Group',
          title: "Business is complex. Your support shouldn't be.",
          description:
              'We bring related services together, so you can spend less time coordinating separate moving parts and more time focusing on your business.',
          primaryLabel: "Let's Work Together",
          primaryAction: () => _openWhatsApp(context),
          secondaryLabel: 'Explore Services',
          secondaryAction: () => Navigator.of(context).pushNamed('/services'),
        ),
        _sectionGap,
        const ResponsiveGrid(
          children: [
            InfoCard(
              icon: Icons.public_rounded,
              title: 'Global Perspective',
              description: 'Solutions designed for businesses working across borders.',
            ),
            InfoCard(
              icon: Icons.handshake_outlined,
              title: 'Dependable Support',
              description: 'A professional approach to every stage of the process.',
            ),
            InfoCard(
              icon: Icons.hub_outlined,
              title: 'Connected Services',
              description: 'Trade, sourcing and warehousing under one roof.',
            ),
            InfoCard(
              icon: Icons.support_agent_rounded,
              title: 'Personal Assistance',
              description: 'Clear communication and support when you need it.',
            ),
          ],
        ),
        _sectionGap,
        CalloutPanel(
          title: 'Have a business goal in mind?',
          description: "Tell us what you need, and let's explore a solution together.",
          buttonLabel: 'Contact Hunters Group',
          onPressed: () => Navigator.of(context).pushNamed('/contact'),
        ),
      ]);
}

class ProcessPage extends StatelessWidget {
  const ProcessPage({super.key});

  @override
  Widget build(BuildContext context) => _pageBody([
        HeroPanel(
          eyebrow: 'A Clear Way Forward',
          title: 'Simple steps. Real progress.',
          description:
              'A straightforward process designed around your requirements and the services you need.',
          primaryLabel: 'Share Your Requirements',
          primaryAction: () => Navigator.of(context).pushNamed('/contact'),
        ),
        _sectionGap,
        const ProcessSteps(
          steps: [
            Offering('Tell Us Your Needs', 'Share your product, sourcing, shipping or business requirements.'),
            Offering('Plan the Solution', 'We discuss suitable options, requirements and the next steps.'),
            Offering('Move Forward', 'Coordinate the agreed services with clear communication.'),
            Offering('Grow Your Business', 'Build stronger operations and explore new opportunities.'),
          ],
        ),
        _sectionGap,
        CalloutPanel(
          title: 'Ready to get started?',
          description: 'Tell our team about your needs and discuss the next steps.',
          buttonLabel: 'Contact Hunters Group',
          onPressed: () => Navigator.of(context).pushNamed('/contact'),
        ),
      ]);
}

class ServicePage extends StatelessWidget {
  const ServicePage({required this.service, super.key});

  final ServiceInfo service;

  @override
  Widget build(BuildContext context) {
    final isEcommerce = service.slug == 'ecommerce';
    return _pageBody([
      HeroPanel(
        eyebrow: service.eyebrow,
        title: service.headline,
        description: service.description,
        image: service.image,
        primaryLabel: 'Discuss Your Requirements',
        primaryAction: () => _openWhatsApp(context, service.enquiry),
        secondaryLabel: 'Explore Services',
        secondaryAction: () => Navigator.of(context).pushNamed('/services'),
      ),
      _sectionGap,
      SectionHeading(
        eyebrow: 'What We Offer',
        title: isEcommerce
            ? 'E-commerce support for your business needs'
            : service.headline,
        description: isEcommerce
            ? 'Choose a platform to explore services tailored to your online business.'
            : 'Explore the areas where our team can discuss support for your business requirements.',
      ),
      _smallGap,
      if (isEcommerce)
        ResponsiveGrid(
          children: marketplaces
              .map((marketplace) => _MarketplaceCard(marketplace: marketplace))
              .toList(),
        )
      else
        OfferingsGrid(offerings: service.offerings),
      _sectionGap,
      SectionHeading(
        eyebrow: 'How We Work',
        title: 'A clear process, built around your requirements.',
        description: 'We start by understanding your needs, then discuss suitable options and next steps.',
      ),
      _smallGap,
      ProcessSteps(steps: service.process),
      if (service.faqs.isNotEmpty) ...[
        _sectionGap,
        SectionHeading(
          eyebrow: 'FAQs',
          title: 'Questions about ${service.title.toLowerCase()}?',
          description: 'Every business requirement is different. Contact our team to discuss your needs.',
        ),
        _smallGap,
        FaqList(faqs: service.faqs),
      ],
      _sectionGap,
      CalloutPanel(
        title: 'Ready to discuss ${service.title.toLowerCase()}?',
        description: 'Share your requirements with Hunters Group and discuss the options available.',
        buttonLabel: 'Contact Our Team',
        onPressed: () => _openWhatsApp(context, service.enquiry),
      ),
      _sectionGap,
      TextButton.icon(
        onPressed: () => Navigator.of(context).pushNamed('/services'),
        icon: const Icon(Icons.arrow_back_rounded),
        label: const Text('Explore other services'),
      ),
    ]);
  }
}

class EcommercePage extends StatelessWidget {
  const EcommercePage({super.key});

  @override
  Widget build(BuildContext context) => _pageBody([
        const SectionHeading(
          eyebrow: 'E-Commerce Solutions',
          title: 'Build a stronger online business.',
          description:
              'Practical e-commerce support for online stores, marketplace operations and better shopping experiences.',
        ),
        _smallGap,
        ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: const SizedBox(
            height: 240,
            width: double.infinity,
            child: AssetPhoto(
              path: 'assets/images/services/ecommerce.png',
            ),
          ),
        ),
        _sectionGap,
        const SectionHeading(
          eyebrow: 'What We Provide',
          title: 'E-commerce support for your business needs.',
          description:
              'Choose a marketplace to explore the specific support options and service relationships.',
        ),
        _smallGap,
        ResponsiveGrid(
          children: marketplaces
              .map((marketplace) => _MarketplaceCard(marketplace: marketplace))
              .toList(),
        ),
        _sectionGap,
        const SectionHeading(
          eyebrow: 'How We Work',
          title: 'A clear process, built around your requirements.',
        ),
        _smallGap,
        ProcessSteps(steps: services.first.process),
        _sectionGap,
        CalloutPanel(
          title: "Let's discuss your e-commerce requirements.",
          description:
              'Tell us about your business and store, and discuss the services that best match your goals.',
          buttonLabel: 'Contact Us on WhatsApp',
          onPressed: () => _openWhatsApp(
            context,
            'Hello Hunters Group, I would like to discuss E-Commerce Solutions.',
          ),
        ),
      ]);
}

class _MarketplaceCard extends StatelessWidget {
  const _MarketplaceCard({required this.marketplace});

  final MarketplaceInfo marketplace;

  @override
  Widget build(BuildContext context) {
    final image = marketplace.slug == 'walmart'
        ? const AssetPhoto(
            path: 'assets/images/marketplaces/walmart.png',
            fit: BoxFit.contain,
          )
        : null;
    return Card(
      child: InkWell(
        onTap: () => Navigator.of(context).pushNamed(marketplace.route),
        borderRadius: BorderRadius.circular(18),
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 46,
                width: 150,
                child: image ??
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        marketplace.name,
                        style: TextStyle(
                          color: marketplace.slug == 'ebay'
                              ? const Color(0xFF3665F3)
                              : marketplace.slug == 'etsy'
                                  ? const Color(0xFFF1641E)
                                  : BrandColors.navy,
                          fontSize: 22,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
              ),
              const SizedBox(height: 12),
              Text(
                '${marketplace.name} ${marketplace.kind}',
                style: const TextStyle(
                  color: BrandColors.navy,
                  fontWeight: FontWeight.w800,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 7),
              Text(
                marketplace.description,
                style: const TextStyle(color: BrandColors.muted, fontSize: 13, height: 1.5),
              ),
              const SizedBox(height: 14),
              const Row(
                children: [
                  Text(
                    'Explore platform',
                    style: TextStyle(color: BrandColors.blue, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(width: 6),
                  Icon(Icons.arrow_forward_rounded, color: BrandColors.blue, size: 18),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MarketplacePage extends StatelessWidget {
  const MarketplacePage({required this.marketplace, super.key});

  final MarketplaceInfo marketplace;

  @override
  Widget build(BuildContext context) {
    final message =
        'Hello Hunters Group, I am interested in ${marketplace.name} ${marketplace.kind}. Please share the available services and pricing.';
    return _pageBody([
      HeroPanel(
        eyebrow: '${marketplace.name} · ${marketplace.kind}',
        title: marketplace.headline,
        description: marketplace.description,
        image: 'assets/images/services/ecommerce.png',
        primaryLabel: 'Discuss Your Requirements',
        primaryAction: () => _openWhatsApp(context, message),
        secondaryLabel: 'All E-Commerce Services',
        secondaryAction: () => Navigator.of(context).pushNamed('/services/ecommerce'),
      ),
      _sectionGap,
      SectionHeading(
        eyebrow: 'What We Provide',
        title: '${marketplace.name} support for your business needs.',
        description:
            'Choose the areas where you need support. Our team can discuss the requirements and agree on a suitable scope.',
      ),
      _smallGap,
      ResponsiveGrid(
        children: [
          for (final offering in marketplace.services)
            InfoCard(
              icon: Icons.check_circle_outline_rounded,
              title: offering.title,
              description: offering.description,
            ),
        ],
      ),
      _sectionGap,
      const SectionHeading(
        eyebrow: 'How We Work',
        title: 'A clear process, built around your requirements.',
        description: 'We begin with your goals, identify priorities and agree on the next steps.',
      ),
      _smallGap,
      const ProcessSteps(
        steps: [
          Offering('Understand your business', 'Tell us about your products, store and business objectives.'),
          Offering('Review your requirements', 'Discuss the platform support and services relevant to your needs.'),
          Offering('Plan the next steps', 'Agree on scope, responsibilities and the proposed workflow.'),
        ],
      ),
      _sectionGap,
      CalloutPanel(
        title: "Let's discuss your ${marketplace.name} business.",
        description:
            'Tell us about your store and goals, and discuss the services that best match your requirements.',
        buttonLabel: 'Contact Us on WhatsApp',
        onPressed: () => _openWhatsApp(context, message),
      ),
      _sectionGap,
      TextButton.icon(
        onPressed: () => Navigator.of(context).pushNamed('/services/ecommerce'),
        icon: const Icon(Icons.arrow_back_rounded),
        label: const Text('Explore other e-commerce services'),
      ),
    ]);
  }
}

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final _formKey = GlobalKey<FormState>();
  final _formAnchorKey = GlobalKey();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _messageController = TextEditingController();
  String? _selectedService;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    final message = [
      'Hello Hunters Group, I would like to discuss a business enquiry.',
      'Name: ${_nameController.text.trim()}',
      'Email: ${_emailController.text.trim()}',
      'Phone: ${_phoneController.text.trim()}',
      'Service: $_selectedService',
      'Message: ${_messageController.text.trim()}',
    ].join('\n');
    _openWhatsApp(context, message);
  }

  @override
  Widget build(BuildContext context) => _pageBody([
        HeroPanel(
          eyebrow: 'Contact Hunters Group',
          title: "Let's build something great together.",
          description:
              'Have a business inquiry or looking for a partner for global trade, e-commerce or logistics? We are ready to hear from you.',
          primaryLabel: 'Send an Inquiry',
          primaryAction: () {
            final target = _formAnchorKey.currentContext;
            if (target != null) {
              Scrollable.ensureVisible(
                target,
                duration: const Duration(milliseconds: 350),
                alignment: 0.1,
              );
            }
          },
          secondaryLabel: 'Chat on WhatsApp',
          secondaryAction: () => _openWhatsApp(context),
        ),
        _sectionGap,
        const SectionHeading(
          eyebrow: 'Get in Touch',
          title: 'How can we help you?',
          description: "Tell us what you're looking for, and let's explore how we can work together.",
        ),
        _smallGap,
        const ResponsiveGrid(
          children: [
            _ContactAction(
              title: 'WhatsApp',
              value: '+92 323 8874539',
              icon: Icons.chat_rounded,
              uri: 'https://wa.me/923238874539',
            ),
            _ContactAction(
              title: 'Call Us',
              value: '+92 323 8874539',
              icon: Icons.call_outlined,
              uri: 'tel:+923238874539',
            ),
            _ContactAction(
              title: 'Instagram',
              value: '@hunters_group71',
              icon: Icons.camera_alt_outlined,
              uri: 'https://www.instagram.com/hunters_group71/',
            ),
            _ContactAction(
              title: 'Facebook',
              value: 'Hunters Group',
              icon: Icons.facebook,
              uri: 'https://www.facebook.com/Huntersgroup71/',
            ),
          ],
        ),
        _sectionGap,
        Card(
          key: _formAnchorKey,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SectionHeading(
                    eyebrow: 'Send an Inquiry',
                    title: 'Tell us about your project.',
                    description:
                        'Complete the form to prepare your inquiry. WhatsApp will open with your message ready to send.',
                  ),
                  _smallGap,
                  TextFormField(
                    controller: _nameController,
                    textCapitalization: TextCapitalization.words,
                    decoration: const InputDecoration(labelText: 'Full Name *'),
                    validator: (value) => value == null || value.trim().isEmpty
                        ? 'Please enter your name.'
                        : null,
                  ),
                  const SizedBox(height: 14),
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(labelText: 'Email Address *'),
                    validator: (value) {
                      final email = value?.trim() ?? '';
                      if (email.isEmpty || !email.contains('@') || !email.contains('.')) {
                        return 'Enter a valid email address.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 14),
                  TextFormField(
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(labelText: 'Phone Number *'),
                    validator: (value) => value == null || value.trim().isEmpty
                        ? 'Please enter your phone number.'
                        : null,
                  ),
                  const SizedBox(height: 14),
                  DropdownButtonFormField<String>(
                    initialValue: _selectedService,
                    isExpanded: true,
                    decoration: const InputDecoration(labelText: 'Service Interested In *'),
                    items: services
                        .map((service) => DropdownMenuItem(
                              value: service.title,
                              child: Text(service.title),
                            ))
                        .toList(),
                    onChanged: (value) => setState(() => _selectedService = value),
                    validator: (value) =>
                        value == null ? 'Please select a service.' : null,
                  ),
                  const SizedBox(height: 14),
                  TextFormField(
                    controller: _messageController,
                    minLines: 4,
                    maxLines: 7,
                    textCapitalization: TextCapitalization.sentences,
                    decoration: const InputDecoration(
                      alignLabelWithHint: true,
                      labelText: 'Your Message *',
                    ),
                    validator: (value) => value == null || value.trim().isEmpty
                        ? 'Please tell us about your requirements.'
                        : null,
                  ),
                  const SizedBox(height: 18),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton.icon(
                      onPressed: _submit,
                      icon: const Icon(Icons.send_rounded),
                      label: const Text('Continue to WhatsApp'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ]);
}

class _ContactAction extends StatelessWidget {
  const _ContactAction({
    required this.title,
    required this.value,
    required this.icon,
    required this.uri,
  });

  final String title;
  final String value;
  final IconData icon;
  final String uri;

  @override
  Widget build(BuildContext context) => Card(
        child: InkWell(
          onTap: () => launchExternal(context, Uri.parse(uri)),
          borderRadius: BorderRadius.circular(18),
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Row(
              children: [
                Icon(icon, color: BrandColors.blue, size: 25),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          color: BrandColors.navy,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(value, style: const TextStyle(color: BrandColors.muted)),
                    ],
                  ),
                ),
                const Icon(Icons.arrow_outward_rounded, size: 17, color: BrandColors.blue),
              ],
            ),
          ),
        ),
      );
}

class ResultsPage extends StatefulWidget {
  const ResultsPage({super.key});

  @override
  State<ResultsPage> createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  final _galleryKey = GlobalKey();

  @override
  Widget build(BuildContext context) => _pageBody([
        HeroPanel(
          eyebrow: 'Our Journey',
          title: 'Our results & achievements.',
          description:
              'Every milestone reflects our commitment to growth, innovation and creating opportunities. Explore the achievements that are part of the Hunters Group journey.',
          primaryLabel: 'Explore Achievements',
          primaryAction: () {
            final target = _galleryKey.currentContext;
            if (target != null) {
              Scrollable.ensureVisible(target, duration: const Duration(milliseconds: 350));
            }
          },
          secondaryLabel: 'Contact Hunters Group',
          secondaryAction: () => Navigator.of(context).pushNamed('/contact'),
          image: 'assets/images/hunters-logo.png',
        ),
        _sectionGap,
        const ResponsiveGrid(
          children: [
            InfoCard(
              icon: Icons.emoji_events_outlined,
              title: '04 Achievements',
              description: 'Explore the Hunters Group achievements gallery below.',
            ),
            InfoCard(
              icon: Icons.calendar_month_outlined,
              title: 'Our Journey Began in 2021',
              description: 'Building global opportunities since 2021.',
            ),
          ],
        ),
        _sectionGap,
        KeyedSubtree(
          key: _galleryKey,
          child: const SectionHeading(
            eyebrow: 'Our Milestones',
            title: 'Achievements gallery.',
            description: 'Select any achievement image to view it in a larger format.',
          ),
        ),
        _smallGap,
        ResponsiveGrid(
          children: List.generate(
            4,
            (index) {
              final image = 'assets/images/results/result-${index + 1}.png';
              return Card(
                clipBehavior: Clip.antiAlias,
                child: InkWell(
                  onTap: () => showPhoto(context, image),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AspectRatio(aspectRatio: 1.25, child: AssetPhoto(path: image)),
                      Padding(
                        padding: const EdgeInsets.all(14),
                        child: Text(
                          'Achievement ${(index + 1).toString().padLeft(2, '0')}',
                          style: const TextStyle(
                            color: BrandColors.navy,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        _sectionGap,
        CalloutPanel(
          title: "Let's create more success stories.",
          description:
              'Have a business goal or partnership in mind? Discuss how we can work together.',
          buttonLabel: 'Contact Hunters Group',
          onPressed: () => Navigator.of(context).pushNamed('/contact'),
        ),
      ]);
}

class EventsPage extends StatefulWidget {
  const EventsPage({super.key});

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  final _eventsKey = GlobalKey();

  @override
  Widget build(BuildContext context) => _pageBody([
        HeroPanel(
          eyebrow: 'Hunters Group',
          title: 'Our events & experiences.',
          description:
              'Discover the events, career expos and recruitment activities where our team connects with talent and builds opportunities.',
          primaryLabel: 'Explore Past Events',
          primaryAction: () {
            final target = _eventsKey.currentContext;
            if (target != null) {
              Scrollable.ensureVisible(target, duration: const Duration(milliseconds: 350));
            }
          },
        ),
        _sectionGap,
        KeyedSubtree(
          key: _eventsKey,
          child: const SectionHeading(
            eyebrow: 'Our Journey',
            title: 'Past events.',
            description:
                'A look back at events where our team connected with candidates, conducted recruitment activities and represented Hunters Group.',
          ),
        ),
        _smallGap,
        for (final event in companyEvents) ...[
          _EventCard(event: event),
          _smallGap,
        ],
        _sectionGap,
        CalloutPanel(
          title: 'Interested in working with us?',
          description:
              'Contact Hunters Group to discuss business opportunities, recruitment and partnerships.',
          buttonLabel: 'Get in Touch',
          onPressed: () => Navigator.of(context).pushNamed('/contact'),
        ),
      ]);
}

class _EventCard extends StatelessWidget {
  const _EventCard({required this.event});

  final CompanyEvent event;

  @override
  Widget build(BuildContext context) => Card(
        clipBehavior: Clip.antiAlias,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: GestureDetector(
                  onTap: () => showPhoto(context, event.images.first),
                  child: AspectRatio(
                    aspectRatio: 1.65,
                    child: AssetPhoto(path: event.images.first),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                event.category.toUpperCase(),
                style: const TextStyle(
                  color: BrandColors.blue,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.8,
                  fontSize: 10,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                event.title,
                style: const TextStyle(
                  color: BrandColors.navy,
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
              ),
              if (event.detail != null) ...[
                const SizedBox(height: 5),
                Text(event.detail!, style: const TextStyle(color: BrandColors.muted)),
              ],
              const SizedBox(height: 8),
              Text(event.description, style: const TextStyle(color: BrandColors.muted, height: 1.5)),
              const SizedBox(height: 14),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: event.images
                    .map(
                      (image) => SizedBox(
                        width: 90,
                        height: 72,
                        child: InkWell(
                          onTap: () => showPhoto(context, image),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: AssetPhoto(path: image),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      );
}

class BrandsPage extends StatefulWidget {
  const BrandsPage({super.key});

  @override
  State<BrandsPage> createState() => _BrandsPageState();
}

class _BrandsPageState extends State<BrandsPage> {
  final _brandsKey = GlobalKey();

  @override
  Widget build(BuildContext context) => _pageBody([
        HeroPanel(
          eyebrow: 'Our Brand Portfolio',
          title: 'Two brands. Distinct identities.',
          description:
              'Discover the brands behind our journey — from global business solutions to nature-inspired personal care. Each brand has its own purpose and identity.',
          primaryLabel: 'Explore Our Brands',
          primaryAction: () {
            final target = _brandsKey.currentContext;
            if (target != null) {
              Scrollable.ensureVisible(target, duration: const Duration(milliseconds: 350));
            }
          },
        ),
        _sectionGap,
        const ResponsiveGrid(
          children: [
            _BrandSummary(
              title: 'Hunters Group',
              subtitle: 'Business & Digital Solutions',
              image: 'assets/images/hunters-logo.png',
              year: 'Established 2021',
            ),
            _BrandSummary(
              title: 'Shifa Organic',
              subtitle: 'Herbal Wellness & Personal Care',
              image: 'assets/images/brands/shifa.jpg',
              year: 'Founded 2004',
            ),
          ],
        ),
        _sectionGap,
        KeyedSubtree(
          key: _brandsKey,
          child: const SectionHeading(
            eyebrow: 'Meet Our Brands',
            title: 'Our brands, our identity.',
            description:
                'Each brand has its own purpose, audience and identity, guided by a commitment to quality and trust.',
          ),
        ),
        _smallGap,
        const _BrandDetail(
          title: 'Hunters Group',
          category: 'BUSINESS & DIGITAL SOLUTIONS',
          image: 'assets/images/hunters-logo.png',
          year: 'Established 2021',
          description:
              'Hunters Group is a multi-service business and digital solutions company established in 2021, with a vision to empower businesses through innovation, technology and global trade.',
          mission:
              'Help businesses grow locally and internationally through innovative e-commerce solutions, digital services and global business opportunities.',
          motto: 'Building Businesses, Creating Opportunities, Connecting the World.',
        ),
        _smallGap,
        const _BrandDetail(
          title: 'Shifa Organic',
          category: 'HERBAL WELLNESS & PERSONAL CARE',
          image: 'assets/images/brands/shifa.jpg',
          year: 'Founded 2004',
          description:
              'Shifa Organic is a herbal wellness and personal care brand founded in 2004 by Hakeem and Dr. Muhammad Abdul Waheed Attari. The brand specializes in herbal products, nourishing hair oils and natural personal care solutions.',
          mission: 'Combine nature-inspired care with quality, trust and customer satisfaction.',
          motto: 'Embrace Nature, Elevate Your Care.',
        ),
        _sectionGap,
        const ResponsiveGrid(
          children: [
            InfoCard(
              icon: Icons.handshake_outlined,
              title: 'Long-Term Partnerships',
              description: 'Lasting relationships built on trust, communication and mutual understanding.',
            ),
            InfoCard(
              icon: Icons.verified_outlined,
              title: 'Quality & Trust',
              description: 'Professionalism, customer satisfaction and responsible business practices.',
            ),
            InfoCard(
              icon: Icons.auto_awesome_outlined,
              title: 'Distinct Brand Identities',
              description: 'Each brand has its own purpose, audience and identity.',
            ),
          ],
        ),
        _sectionGap,
        CalloutPanel(
          title: 'Interested in our brands?',
          description:
              'Get in touch with Hunters Group to discuss business opportunities, partnerships or brand-related enquiries.',
          buttonLabel: 'Contact Hunters Group',
          onPressed: () => Navigator.of(context).pushNamed('/contact'),
        ),
      ]);
}

class _BrandSummary extends StatelessWidget {
  const _BrandSummary({
    required this.title,
    required this.subtitle,
    required this.image,
    required this.year,
  });

  final String title;
  final String subtitle;
  final String image;
  final String year;

  @override
  Widget build(BuildContext context) => Card(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(height: 110, child: AssetPhoto(path: image, fit: BoxFit.contain)),
              const SizedBox(height: 12),
              Text(
                title,
                style: const TextStyle(
                  color: BrandColors.navy,
                  fontSize: 19,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 5),
              Text(subtitle, textAlign: TextAlign.center),
              const SizedBox(height: 5),
              Text(year, style: const TextStyle(color: BrandColors.muted, fontSize: 12)),
            ],
          ),
        ),
      );
}

class _BrandDetail extends StatelessWidget {
  const _BrandDetail({
    required this.title,
    required this.category,
    required this.image,
    required this.year,
    required this.description,
    required this.mission,
    required this.motto,
  });

  final String title;
  final String category;
  final String image;
  final String year;
  final String description;
  final String mission;
  final String motto;

  @override
  Widget build(BuildContext context) => Card(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 90, child: AssetPhoto(path: image, fit: BoxFit.contain)),
              const SizedBox(height: 14),
              Text(
                category,
                style: const TextStyle(
                  color: BrandColors.blue,
                  fontSize: 10,
                  letterSpacing: 0.8,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                title,
                style: const TextStyle(
                  color: BrandColors.navy,
                  fontWeight: FontWeight.w800,
                  fontSize: 22,
                ),
              ),
              Text(year, style: const TextStyle(color: BrandColors.muted, fontSize: 12)),
              const SizedBox(height: 12),
              Text(description, style: const TextStyle(height: 1.6)),
              const SizedBox(height: 14),
              const Text(
                'OUR MISSION',
                style: TextStyle(
                  color: BrandColors.blue,
                  fontSize: 10,
                  letterSpacing: 0.8,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 5),
              Text(mission, style: const TextStyle(height: 1.6)),
              const SizedBox(height: 12),
              Text(
                '“$motto”',
                style: const TextStyle(
                  color: BrandColors.navy,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(height: 16),
              OutlinedButton(
                onPressed: () => Navigator.of(context).pushNamed('/contact'),
                child: const Text('Connect With Us'),
              ),
            ],
          ),
        ),
      );
}

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) => _pageBody([
        const SizedBox(height: 80),
        const SectionHeading(
          eyebrow: 'Page Not Found',
          title: 'We could not find that page.',
          description: 'Choose a section from the navigation or return to the Hunters Group home page.',
          center: true,
        ),
        const SizedBox(height: 20),
        Center(
          child: FilledButton(
            onPressed: () => Navigator.of(context).pushNamedAndRemoveUntil('/', (_) => false),
            child: const Text('Back to Home'),
          ),
        ),
        const SizedBox(height: 90),
      ]);
}
