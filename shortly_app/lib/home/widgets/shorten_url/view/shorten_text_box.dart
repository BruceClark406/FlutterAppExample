import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:short_code_api_package/short_code_api_repository.dart';
import 'package:shortly_app/generated_assets/assets.gen.dart';
import 'package:shortly_app/home/home.dart';

class ShortenTextBox extends StatelessWidget {
  const ShortenTextBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ShortenedLinkCubit(
        shortCodeApiRepository: context.read<ShortCodeApiRepository>(),
      ),
      child: const ShortenTextBoxView(),
    );
  }
}

class ShortenTextBoxView extends StatelessWidget {
  const ShortenTextBoxView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Stack(
            children: const [
              BackgroundPicture(),
              ShortenTextRow(),
            ],
          ),
          const Gap(30),
          BlocBuilder<ShortenedLinkCubit, ShortenedLinkState>(
            builder: (context, state) {
              return Column(
                children: [
                  for (final shortenedLinkResult in state.shortCodeResponses)
                    if (shortenedLinkResult.shortLink != null &&
                        shortenedLinkResult.originalLink != null) ...[
                      ShortenedLinkResult(
                        shortCodeResponse: shortenedLinkResult,
                      ),
                      const Gap(16),
                    ],
                  if (state.shortCodeResponses.isNotEmpty) ...[
                    const Gap(30),
                    TextButton(
                      child: Text(
                        'Clear All',
                        style: TextStyle(
                          color: theme.colorScheme.primary,
                          fontSize: 16,
                        ),
                      ),
                      onPressed: () => context
                          .read<ShortenedLinkCubit>()
                          .clearShortenedLinks(),
                    ),
                  ]
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class ShortenTextRow extends StatelessWidget {
  const ShortenTextRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Align(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60),
          child: ScreenTypeLayout.builder(
            mobile: (_) => Column(
              children: const [
                Gap(14),
                ShortenTextField(),
                Gap(14),
                ShortenTextButton(shouldExpand: true),
              ],
            ),
            desktop: (context) {
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Gap(16),
                  ShortenTextField(),
                  Gap(20),
                  ShortenTextButton()
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class ShortenTextButton extends StatelessWidget {
  const ShortenTextButton({
    super.key,
    this.shouldExpand = false,
  });

  final bool shouldExpand;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ElevatedButton(
      style: theme.elevatedButtonTheme.style?.copyWith(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      onPressed: () {
        context.read<ShortenedLinkCubit>().shortenLink();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 22),
        child: BlocConsumer<ShortenedLinkCubit, ShortenedLinkState>(
          listenWhen: (previous, current) =>
              previous.shortenLinkStatus != current.shortenLinkStatus &&
              current.shortenLinkStatus == ShortenLinkStatus.failure,
          listener: (context, state) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Failed to shorten that link 😢'),
              ),
            );
          },
          builder: (context, state) {
            return SizedBox(
              width: shouldExpand ? double.infinity : 100,
              height: 24,
              child: Center(
                child: state.shortenLinkStatus == ShortenLinkStatus.loading
                    ? SizedBox(
                        width: 24,
                        child: CircularProgressIndicator(
                          color: theme.colorScheme.onPrimary,
                        ),
                      )
                    : const Text('Shorten It!'),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ShortenTextField extends StatelessWidget {
  const ShortenTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Flexible(
      child: BlocBuilder<ShortenedLinkCubit, ShortenedLinkState>(
        builder: (context, state) {
          return Padding(
            padding: state.url.isValid || state.url.isPure
                ? EdgeInsets.zero
                : const EdgeInsets.only(top: 24),
            child: TextField(
              keyboardType: TextInputType.url,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                errorText: state.url.isValid || state.url.isPure
                    ? null
                    : 'Invalid URL',
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 26,
                  horizontal: 32,
                ),
                hintText: 'Shorten a link here...',
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                filled: true,
                fillColor: theme.colorScheme.onPrimary,
              ),
              onChanged: (value) =>
                  context.read<ShortenedLinkCubit>().urlChanged(value),
              onSubmitted: (value) {},
            ),
          );
        },
      ),
    );
  }
}

class BackgroundPicture extends StatelessWidget {
  const BackgroundPicture({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        color: theme.colorScheme.primaryContainer,
        constraints: const BoxConstraints(maxWidth: 1440),
        height: 175,
        width: double.infinity,
        child: ScreenTypeLayout.builder(
          mobile: (context) =>
              Assets.svg.bgShortenMobile.svg(alignment: Alignment.topRight),
          desktop: (context) =>
              Assets.svg.bgShortenDesktop.svg(fit: BoxFit.cover),
        ),
      ),
    );
  }
}
