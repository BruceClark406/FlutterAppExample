import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:shortly_app/generated_assets/assets.gen.dart';

class CallToAction extends StatelessWidget {
  const CallToAction({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
        CallToActionBackground(),
        CallToActionText(),
      ],
    );
  }
}

class CallToActionText extends StatelessWidget {
  const CallToActionText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Positioned.fill(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Gap(14),
            Text(
              'Boost your links today',
              style: TextStyle(
                fontSize: 46,
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.onPrimary,
              ),
              textAlign: TextAlign.center,
            ),
            const Gap(32),
            ElevatedButton(
              onPressed: () {},
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Text('Get Started'),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CallToActionBackground extends StatelessWidget {
  const CallToActionBackground({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      color: theme.colorScheme.primaryContainer,
      height: 250,
      width: double.infinity,
      child: ScreenTypeLayout.builder(
        mobile: (context) =>
            Assets.svg.bgBoostMobile.svg(alignment: Alignment.topRight),
        desktop: (context) => Assets.svg.bgBoostDesktop.svg(fit: BoxFit.fill),
      ),
    );
  }
}
