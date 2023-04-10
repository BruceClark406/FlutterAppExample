import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shortly_app/view/app.dart';

class AdvancedStatisticsText extends StatelessWidget {
  const AdvancedStatisticsText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      constraints: const BoxConstraints(maxWidth: 520),
      child: Column(
        children: [
          Text(
            'Advanced Statistics',
            style: theme.textTheme.headlineMedium?.copyWith(
              color: theme.colorScheme.onSurface,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Gap(20),
          Text(
            'Track how your links are performing across the web with our '
            'advanced statistics dashboard.',
            style: theme.textTheme.bodyLarge?.copyWith(
              color: gray,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
