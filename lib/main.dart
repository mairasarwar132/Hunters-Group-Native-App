import 'package:flutter/material.dart';

import 'site_content.dart';
import 'site_pages.dart';
import 'site_widgets.dart';

void main() {
  runApp(const HuntersGroupApp());
}

class HuntersGroupApp extends StatelessWidget {
  const HuntersGroupApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Hunters Group',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: BrandColors.blue,
            primary: BrandColors.blue,
            surface: BrandColors.surface,
          ),
          scaffoldBackgroundColor: BrandColors.surface,
          appBarTheme: const AppBarTheme(
            foregroundColor: BrandColors.navy,
            elevation: 0,
            centerTitle: false,
          ),
          navigationBarTheme: NavigationBarThemeData(
            backgroundColor: Colors.white,
            indicatorColor: BrandColors.lightBlue,
            labelTextStyle: WidgetStateProperty.resolveWith(
              (states) => TextStyle(
                color: states.contains(WidgetState.selected)
                    ? BrandColors.blue
                    : BrandColors.muted,
                fontSize: 11,
                fontWeight: states.contains(WidgetState.selected)
                    ? FontWeight.w700
                    : FontWeight.w500,
              ),
            ),
          ),
          cardTheme: CardThemeData(
            color: Colors.white,
            elevation: 0,
            margin: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
              side: const BorderSide(color: BrandColors.border),
            ),
          ),
          filledButtonTheme: FilledButtonThemeData(
            style: FilledButton.styleFrom(
              backgroundColor: BrandColors.blue,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              textStyle: const TextStyle(fontWeight: FontWeight.w700),
            ),
          ),
          outlinedButtonTheme: OutlinedButtonThemeData(
            style: OutlinedButton.styleFrom(
              foregroundColor: BrandColors.navy,
              side: const BorderSide(color: Color(0xFFD4DCE8)),
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
          ),
          textTheme: const TextTheme(
            bodyMedium: TextStyle(color: BrandColors.ink, height: 1.5),
          ),
        ),
        initialRoute: '/',
        onGenerateRoute: (settings) {
          final route = settings.name ?? '/';
          final Widget page;
          if (route == '/') {
            page = const HomePage();
          } else if (route == '/about') {
            page = const AboutPage();
          } else if (route == '/services') {
            page = const ServicesPage();
          } else if (route == '/contact') {
            page = const ContactPage();
          } else if (route == '/results') {
            page = const ResultsPage();
          } else if (route == '/events') {
            page = const EventsPage();
          } else if (route == '/brands') {
            page = const BrandsPage();
          } else if (route == '/why-hunters') {
            page = const WhyHuntersPage();
          } else if (route == '/process') {
            page = const ProcessPage();
          } else if (route == '/services/ecommerce') {
            page = const EcommercePage();
          } else if (route.startsWith('/services/ecommerce/')) {
            final slug = route.substring('/services/ecommerce/'.length);
            final marketplace = marketplaces.where((item) => item.slug == slug);
            page = marketplace.isEmpty
                ? const NotFoundPage()
                : MarketplacePage(marketplace: marketplace.first);
          } else if (route.startsWith('/services/')) {
            final slug = route.substring('/services/'.length);
            final service = services.where((item) => item.slug == slug);
            page = service.isEmpty
                ? const NotFoundPage()
                : ServicePage(service: service.first);
          } else {
            page = const NotFoundPage();
          }
          return MaterialPageRoute<void>(
            settings: settings,
            builder: (context) => PageFrame(currentRoute: route, child: page),
          );
        },
      );
}
