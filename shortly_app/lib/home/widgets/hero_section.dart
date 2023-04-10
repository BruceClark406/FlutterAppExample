import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:shortly_app/generated_assets/assets.gen.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (context) => Column(
        children: const [
          HeroImage(),
          HeroText(
            centered: true,
          ),
        ],
      ),
      desktop: (context) => ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1440),
        child: Row(
          children: const [
            Expanded(flex: 3, child: HeroText()),
            Expanded(flex: 3, child: HeroImage()),
          ],
        ),
      ),
    );
  }
}

class HeroImage extends StatelessWidget {
  const HeroImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(80, 0),
      child: Assets.svg.illustrationWorking.svg(
        allowDrawingOutsideViewBox: true,
        alignment: Alignment.bottomLeft,
      ),
    );
  }
}

class HeroText extends StatelessWidget {
  const HeroText({
    this.centered = false,
    super.key,
  });

  final bool centered;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment:
            centered ? CrossAxisAlignment.center : CrossAxisAlignment.start,
        children: [
          Text(
            'More than just shorter links',
            style: theme.textTheme.displayMedium?.copyWith(
              color: theme.colorScheme.onSurface,
              fontWeight: FontWeight.bold,
              fontSize: 74,
            ),
            textAlign: centered ? TextAlign.center : null,
          ),
          Text(
            "Build your brand's recognition and get the detailed insights on "
            'how your links are performing.',
            style: theme.textTheme.headlineSmall,
            textAlign: centered ? TextAlign.center : null,
          ),
          const Gap(30),
          ElevatedButton(
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              child: Text(
                'Get Started',
              ),
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
