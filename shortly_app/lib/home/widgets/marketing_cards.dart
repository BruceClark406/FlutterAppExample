import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:shortly_app/generated_assets/assets.gen.dart';
import 'package:shortly_app/view/app.dart';

class MarketingCards extends StatelessWidget {
  const MarketingCards({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ScreenTypeLayout.builder(
      mobile: (_) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Stack(
          children: [
            Positioned.fill(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 100),
                  child: VerticalDivider(
                    color: theme.colorScheme.primary,
                    thickness: 8,
                  ),
                ),
              ),
            ),
            Column(
              children: const [
                BrandRecognitionMarketingCard(mobile: true),
                Gap(32),
                DetailedRecordsMarketingCard(mobile: true),
                Gap(32),
                FullyCustomizableMarketingCard(mobile: true),
              ],
            ),
          ],
        ),
      ),
      desktop: (_) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        constraints: const BoxConstraints(maxWidth: 1440),
        child: Stack(
          children: [
            Positioned.fill(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Gap(60),
                  Divider(
                    color: theme.colorScheme.primary,
                    thickness: 8,
                  ),
                ],
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Flexible(child: BrandRecognitionMarketingCard()),
                Gap(32),
                Flexible(child: DetailedRecordsMarketingCard(topPadding: 60)),
                Gap(32),
                Flexible(
                  child: FullyCustomizableMarketingCard(topPadding: 120),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class FullyCustomizableMarketingCard extends StatelessWidget {
  const FullyCustomizableMarketingCard({
    this.topPadding = 0,
    this.mobile = false,
    super.key,
  });

  final double topPadding;
  final bool mobile;

  @override
  Widget build(BuildContext context) {
    return MarketingCard(
      title: 'Fully Customizable',
      description: 'Improve brand awareness and content discoverability '
          'through customizable links, supercharging audience '
          'engagement.',
      icon: Assets.svg.iconFullyCustomizable.svg(),
      topPadding: topPadding,
      mobile: mobile,
    );
  }
}

class DetailedRecordsMarketingCard extends StatelessWidget {
  const DetailedRecordsMarketingCard({
    this.topPadding = 0,
    this.mobile = false,
    super.key,
  });

  final double topPadding;
  final bool mobile;

  @override
  Widget build(BuildContext context) {
    return MarketingCard(
      title: 'Detailed Records',
      description: 'Gain insights into who is clicking your links. Knowing '
          'when and where people engage with your content helps '
          'inform better decisions.',
      icon: Assets.svg.iconDetailedRecords.svg(),
      topPadding: topPadding,
      mobile: mobile,
    );
  }
}

class BrandRecognitionMarketingCard extends StatelessWidget {
  const BrandRecognitionMarketingCard({
    this.topPadding = 0,
    this.mobile = false,
    super.key,
  });

  final double topPadding;
  final bool mobile;

  @override
  Widget build(BuildContext context) {
    return MarketingCard(
      title: 'Brand Recognition',
      description: 'Boost your brand recognition with each click. Generic '
          "links don't mean a thing. Branded links help instil "
          'confidence in your content.',
      icon: Assets.svg.iconBrandRecognition.svg(),
      topPadding: topPadding,
      mobile: mobile,
    );
  }
}

class MarketingCard extends StatelessWidget {
  const MarketingCard({
    required this.title,
    required this.description,
    required this.icon,
    this.mobile = false,
    this.topPadding = 0,
    super.key,
  });

  final double topPadding;
  final String title;
  final String description;
  final SvgPicture icon;
  final bool mobile;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Gap(topPadding),
        Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(46),
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surface,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 4,
                        blurRadius: 4,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Gap(90),
                        Text(
                          title,
                          style: theme.textTheme.headlineSmall?.copyWith(
                            color: theme.colorScheme.onSurface,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Gap(16),
                        Text(
                          description,
                          style: theme.textTheme.bodyLarge?.copyWith(
                            color: gray,
                            fontSize: 16,
                          ),
                        ),
                        const Gap(40),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              left: mobile ? null : 50,
              child: Row(
                mainAxisAlignment:
                    mobile ? MainAxisAlignment.center : MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 46,
                    backgroundColor: theme.colorScheme.primaryContainer,
                    child: icon,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
