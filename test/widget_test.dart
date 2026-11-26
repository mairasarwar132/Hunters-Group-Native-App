import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hunters_group_native_app/main.dart';

void main() {
  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
  });

  testWidgets('main navigation reaches service and marketplace details', (tester) async {
    tester.view.physicalSize = const Size(900, 1600);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const HuntersGroupApp());
    await tester.pumpAndSettle();
    expect(find.text('Your Business. Beyond Borders.'), findsOneWidget);

    await tester.tap(find.byTooltip('Open navigation menu'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('About Us').last);
    await tester.pumpAndSettle();
    expect(find.text('About Hunters Group'), findsOneWidget);
    final profileLink = find.text('View Profile').first;
    await tester.ensureVisible(profileLink);
    await tester.tap(profileLink);
    await tester.pumpAndSettle();
    expect(find.byTooltip('Close profile'), findsOneWidget);
    await tester.tap(find.byTooltip('Close profile'));
    await tester.pumpAndSettle();

    await tester.tap(find.byIcon(Icons.grid_view_rounded).last);
    await tester.pumpAndSettle();
    expect(find.text('Business solutions for your next stage of growth.'), findsOneWidget);

    await tester.ensureVisible(find.text('E-Commerce Solutions').first);
    await tester.tap(find.text('E-Commerce Solutions').first);
    await tester.pumpAndSettle();
    expect(find.text('E-commerce support for your business needs.'), findsOneWidget);

    final amazonCard = find.text('Amazon Seller Services');
    await tester.ensureVisible(amazonCard);
    await tester.tap(amazonCard);
    await tester.pumpAndSettle();
    expect(find.text('Build and grow your Amazon business.'), findsOneWidget);
    expect(find.text('Seller Account Support'), findsOneWidget);

    await tester.binding.handlePopRoute();
    await tester.pumpAndSettle();
    expect(find.text('E-commerce support for your business needs.'), findsOneWidget);
  });

  testWidgets('contact inquiry requires the website form fields', (tester) async {
    tester.view.physicalSize = const Size(900, 1600);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const HuntersGroupApp());
    await tester.pumpAndSettle();
    await tester.tap(find.byTooltip('Open navigation menu'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Contact').last);
    await tester.pumpAndSettle();

    final submit = find.text('Continue to WhatsApp');
    await tester.ensureVisible(submit);
    await tester.tap(submit);
    await tester.pumpAndSettle();
    expect(find.text('Please enter your name.'), findsOneWidget);
    expect(find.text('Enter a valid email address.'), findsOneWidget);
    expect(find.text('Please select a service.'), findsOneWidget);
  });

  testWidgets('secondary pages and the assistant are reachable from navigation', (tester) async {
    tester.view.physicalSize = const Size(900, 1600);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const HuntersGroupApp());
    await tester.pumpAndSettle();

    await _openMenuOption(tester, 'Results & Achievements');
    expect(find.text('Achievements gallery.'), findsOneWidget);

    await _openMenuOption(tester, 'Events');
    expect(find.text('Our events & experiences.'), findsOneWidget);

    await _openMenuOption(tester, 'Brands');
    expect(find.text('Two brands. Distinct identities.'), findsOneWidget);

    await _openMenuOption(tester, 'Why Hunters');
    expect(find.text("Business is complex. Your support shouldn't be."), findsOneWidget);

    await _openMenuOption(tester, 'Our Process');
    expect(find.text('Simple steps. Real progress.'), findsOneWidget);

    await _openMenuOption(tester, 'Hunters AI Assistant');
    await tester.tap(find.text('What services do you offer?'));
    await tester.pumpAndSettle();
    expect(find.textContaining('Hunters Group offers E-Commerce Solutions'), findsOneWidget);
    expect(find.text('View all services'), findsOneWidget);
  });

  testWidgets('all page routes render at a compact phone width', (tester) async {
    tester.view.physicalSize = const Size(360, 800);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const HuntersGroupApp());
    await tester.pumpAndSettle();
    final homeError = tester.takeException();
    expect(homeError, isNull, reason: 'Home page render error: $homeError');

    final navigator = tester.state<NavigatorState>(find.byType(Navigator).first);
    const routes = [
      '/about',
      '/services',
      '/services/ecommerce',
      '/services/import',
      '/services/export',
      '/services/logistics',
      '/services/buyer-sourcing',
      '/services/web-development',
      '/services/ecommerce/amazon',
      '/services/ecommerce/ebay',
      '/services/ecommerce/etsy',
      '/services/ecommerce/shopify',
      '/services/ecommerce/walmart',
      '/services/ecommerce/tiktok-shop',
      '/contact',
      '/results',
      '/events',
      '/brands',
      '/why-hunters',
      '/process',
      '/assistant',
    ];

    for (final route in routes) {
      unawaited(navigator.pushNamed<void>(route));
      await tester.pumpAndSettle();
      final routeError = tester.takeException();
      expect(routeError, isNull, reason: 'Route $route render error: $routeError');
      await tester.binding.handlePopRoute();
      await tester.pumpAndSettle();
    }
  });
}

Future<void> _openMenuOption(WidgetTester tester, String label) async {
  await tester.tap(find.byTooltip('Open navigation menu'));
  await tester.pumpAndSettle();
  final option = find.text(label).last;
  await tester.ensureVisible(option);
  await tester.tap(option);
  await tester.pumpAndSettle();
}
