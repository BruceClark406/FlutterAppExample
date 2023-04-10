import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:shortly_app/generated_assets/assets.gen.dart';
import 'package:shortly_app/view/app.dart';

class ShortlyBottomNavBar extends StatelessWidget {
  const ShortlyBottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: veryDarkViolet,
      child: ScreenTypeLayout.builder(
        mobile: (_) => Column(
          children: const [
            Gap(40),
            Logo(),
            Gap(40),
            FeaturesBottomNavColumn(mobile: true),
            Gap(40),
            ResourcesBottomNavColumn(mobile: true),
            Gap(40),
            CompanyBottomNavColumn(mobile: true),
            Gap(40),
            SocialMediaBottomNavRow(),
            Gap(40),
          ],
        ),
        desktop: (_) => Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 1440),
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 80,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Logo(),
                Spacer(),
                FeaturesBottomNavColumn(),
                Gap(60),
                ResourcesBottomNavColumn(),
                Gap(60),
                CompanyBottomNavColumn(),
                Gap(60),
                SocialMediaBottomNavRow(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SocialMediaBottomNavRow extends StatelessWidget {
  const SocialMediaBottomNavRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(onPressed: () {}, icon: Assets.svg.iconFacebook.svg()),
        const Gap(16),
        IconButton(onPressed: () {}, icon: Assets.svg.iconTwitter.svg()),
        const Gap(16),
        IconButton(onPressed: () {}, icon: Assets.svg.iconPinterest.svg()),
        const Gap(16),
        IconButton(onPressed: () {}, icon: Assets.svg.iconInstagram.svg()),
      ],
    );
  }
}

class BottomNavColumn extends StatelessWidget {
  const BottomNavColumn({
    this.children = const [],
    this.mobile = false,
    super.key,
  });

  final List<Widget> children;
  final bool mobile;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          mobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: children,
    );
  }
}

class FeaturesBottomNavColumn extends StatelessWidget {
  const FeaturesBottomNavColumn({
    this.mobile = false,
    super.key,
  });

  final bool mobile;

  @override
  Widget build(BuildContext context) {
    return BottomNavColumn(
      mobile: mobile,
      children: [
        const BottomNavSectionTitle(title: 'Features'),
        const Gap(16),
        BottomNavTextLink(title: 'Link Shortening', mobile: mobile),
        const Gap(8),
        BottomNavTextLink(title: 'Branded Links', mobile: mobile),
        const Gap(8),
        BottomNavTextLink(title: 'Analytics', mobile: mobile),
      ],
    );
  }
}

class ResourcesBottomNavColumn extends StatelessWidget {
  const ResourcesBottomNavColumn({
    this.mobile = false,
    super.key,
  });

  final bool mobile;

  @override
  Widget build(BuildContext context) {
    return BottomNavColumn(
      mobile: mobile,
      children: [
        const BottomNavSectionTitle(title: 'Resources'),
        const Gap(16),
        BottomNavTextLink(title: 'Blog', mobile: mobile),
        const Gap(8),
        BottomNavTextLink(title: 'Developers', mobile: mobile),
        const Gap(8),
        BottomNavTextLink(title: 'Support', mobile: mobile),
      ],
    );
  }
}

class CompanyBottomNavColumn extends StatelessWidget {
  const CompanyBottomNavColumn({
    this.mobile = false,
    super.key,
  });

  final bool mobile;

  @override
  Widget build(BuildContext context) {
    return BottomNavColumn(
      mobile: mobile,
      children: [
        const BottomNavSectionTitle(title: 'Company'),
        const Gap(16),
        BottomNavTextLink(title: 'About', mobile: mobile),
        const Gap(8),
        BottomNavTextLink(title: 'Our Team', mobile: mobile),
        const Gap(8),
        BottomNavTextLink(title: 'Careers', mobile: mobile),
        const Gap(8),
        BottomNavTextLink(title: 'Contact', mobile: mobile),
      ],
    );
  }
}

class BottomNavSectionTitle extends StatelessWidget {
  const BottomNavSectionTitle({
    required this.title,
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class BottomNavTextLink extends StatelessWidget {
  const BottomNavTextLink({
    required this.title,
    this.mobile = false,
    super.key,
  });

  final String title;
  final bool mobile;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          vertical: 14,
        ),
        textStyle: TextStyle(
          color: gray,
          fontSize: 16,
        ),
        minimumSize: Size.zero,
      ),
      child: SizedBox(
        width: 150,
        child: Text(
          title,
          textAlign: mobile ? TextAlign.center : TextAlign.left,
        ),
      ),
      onPressed: () {},
    );
  }
}

class Logo extends StatelessWidget {
  const Logo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Assets.svg.logo.svg(
        colorFilter: ColorFilter.mode(
          theme.colorScheme.onPrimary,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
