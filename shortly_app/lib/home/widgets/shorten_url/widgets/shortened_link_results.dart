import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:short_code_api_package/short_code_api_repository.dart';
import 'package:shortly_app/home/home.dart';

class ShortenedLinkResult extends StatelessWidget {
  const ShortenedLinkResult({
    required this.shortCodeResponse,
    super.key,
  });

  final GetShortCodeResponse shortCodeResponse;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final containerDecorations = BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: theme.colorScheme.surface,
      boxShadow: [
        BoxShadow(
          color: theme.colorScheme.onSurface.withOpacity(0.1),
          blurRadius: 12,
          offset: const Offset(0, 4),
        ),
      ],
    );
    return ScreenTypeLayout.builder(
      mobile: (context) => Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: containerDecorations,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                shortCodeResponse.originalLink!,
                style: theme.textTheme.bodyLarge?.copyWith(fontSize: 16),
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    shortCodeResponse.shortLink!,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: theme.colorScheme.primary,
                      fontSize: 16,
                    ),
                  ),
                  const Gap(16),
                  CopyButton(
                    mobile: true,
                    shortCodeResponse: shortCodeResponse,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      desktop: (context) => Container(
        constraints: const BoxConstraints(maxWidth: 1440),
        padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 26),
        decoration: containerDecorations,
        child: Row(
          children: [
            Text(
              shortCodeResponse.originalLink!,
              style: theme.textTheme.bodyLarge?.copyWith(fontSize: 20),
            ),
            const Spacer(),
            Text(
              shortCodeResponse.shortLink!,
              style: theme.textTheme.bodyLarge
                  ?.copyWith(color: theme.colorScheme.primary, fontSize: 20),
            ),
            const Gap(30),
            CopyButton(shortCodeResponse: shortCodeResponse),
          ],
        ),
      ),
    );
  }
}

class CopyButton extends StatelessWidget {
  const CopyButton({
    required this.shortCodeResponse,
    this.mobile = false,
    super.key,
  });

  final GetShortCodeResponse shortCodeResponse;
  final bool mobile;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<ShortenedLinkCubit, ShortenedLinkState>(
      builder: (context, state) {
        final isCopied = state.copied == shortCodeResponse;

        return ElevatedButton(
          style: theme.elevatedButtonTheme.style?.copyWith(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            backgroundColor: MaterialStateProperty.all(
              isCopied
                  ? theme.colorScheme.primaryContainer
                  : theme.colorScheme.primary,
            ),
          ),
          onPressed: () async {
            await context
                .read<ShortenedLinkCubit>()
                .setCopied(shortCodeResponse: shortCodeResponse);
          },
          child: SizedBox(
            width: mobile ? double.infinity : 100,
            height: 50,
            child: Center(child: Text(isCopied ? 'Copied!' : 'Copy')),
          ),
        );
      },
    );
  }
}
