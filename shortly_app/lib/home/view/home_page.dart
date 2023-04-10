import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shortly_app/home/home.dart';
import 'package:shortly_app/shortly_widgets/shortly_widgets.dart';
import 'package:shortly_app/view/app.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeView();
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ShortlyScaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ShortlyNavBar(),
            const HeroSection(),
            const Gap(20),
            Stack(
              children: [
                Positioned.fill(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 100),
                    child: ColoredBox(
                      color: grayishViolet,
                    ),
                  ),
                ),
                Column(
                  children: const [
                    ShortenTextBox(),
                    Gap(70),
                    AdvancedStatisticsText(),
                    Gap(70),
                    MarketingCards(),
                    Gap(100),
                    CallToAction(),
                    ShortlyBottomNavBar(),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
