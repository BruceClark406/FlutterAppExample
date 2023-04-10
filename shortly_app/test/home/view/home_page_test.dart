import 'package:flutter_test/flutter_test.dart';
import 'package:shortly_app/home/home.dart';
import 'package:shortly_app/shortly_widgets/shortly_widgets.dart';

import '../../helpers/helpers.dart';

void main() {
  group('HomePage ', () {
    group('renders', () {
      testWidgets('ShortlyScaffold', (tester) async {
        await tester.pumpApp(const HomePage());

        expect(find.byType(ShortlyScaffold), findsOneWidget);
      });

      testWidgets('ShortlyNavBar', (tester) async {
        await tester.pumpApp(const HomePage());

        expect(find.byType(ShortlyNavBar), findsOneWidget);
      });

      testWidgets('HeroSection', (tester) async {
        await tester.pumpApp(const HomePage());

        expect(find.byType(HeroSection), findsOneWidget);
      });

      testWidgets('ShortenTextBox', (tester) async {
        await tester.pumpApp(const HomePage());

        expect(find.byType(ShortenTextBox), findsOneWidget);
      });

      testWidgets('AdvancedStatisticsText', (tester) async {
        await tester.pumpApp(const HomePage());

        expect(find.byType(AdvancedStatisticsText), findsOneWidget);
      });

      testWidgets('MarketingCards', (tester) async {
        await tester.pumpApp(const HomePage());

        expect(find.byType(MarketingCards), findsOneWidget);
      });

      testWidgets('CallToAction', (tester) async {
        await tester.pumpApp(const HomePage());

        expect(find.byType(CallToAction), findsOneWidget);
      });
      testWidgets('ShortlyBottomNavBar', (tester) async {
        await tester.pumpApp(const HomePage());

        expect(find.byType(ShortlyBottomNavBar), findsOneWidget);
      });
    });
  });
}
