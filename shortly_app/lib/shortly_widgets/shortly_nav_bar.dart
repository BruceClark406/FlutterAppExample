import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:shortly_app/generated_assets/assets.gen.dart';
import 'package:shortly_app/view/view.dart';

class ShortlyNavBar extends StatelessWidget {
  const ShortlyNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ScreenTypeLayout.builder(
      mobile: (context) => Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        // Could try to use drop down menu button
        child: ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
          childrenPadding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          iconColor: gray,
          leading: Assets.svg.logo.svg(
            width: 130,
          ),
          title: const Text(''),
          trailing: const IconButton(
            icon: FaIcon(
              FontAwesomeIcons.bars,
              size: 32,
            ),
            onPressed: null,
            iconSize: 36,
          ),
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: ColoredBox(
                color: theme.colorScheme.primaryContainer,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Gap(20),
                    const MobileNavButton(title: 'Features'),
                    const MobileNavButton(title: 'Pricing'),
                    const MobileNavButton(title: 'Pricing'),
                    const Gap(6),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Divider(
                        thickness: 0,
                        color: grayishViolet,
                      ),
                    ),
                    const Gap(6),
                    const MobileNavButton(title: 'Login'),
                    const MobileSignUpButton(),
                    const Gap(20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      desktop: (context) => ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1440),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 42, horizontal: 16),
          child: Row(
            children: [
              Assets.svg.logo.svg(
                width: 130,
              ),
              const Gap(30),
              const NavButton(title: 'Features'),
              const Gap(10),
              const NavButton(title: 'Pricing'),
              const Gap(10),
              const NavButton(title: 'Resources'),
              const Spacer(),
              const NavButton(title: 'Login'),
              const Gap(24),
              const SignUpButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class SignUpButton extends StatelessWidget {
  const SignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Text('Sign Up'),
      ),
      onPressed: () {},
    );
  }
}

class NavButton extends StatelessWidget {
  const NavButton({
    required this.title,
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(
          const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        foregroundColor: MaterialStateProperty.all(gray),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Text(title),
      ),
      onPressed: () {},
    );
  }
}

class MobileNavButton extends StatelessWidget {
  const MobileNavButton({
    required this.title,
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Text(title),
          ),
        ],
      ),
    );
  }
}

class MobileSignUpButton extends StatelessWidget {
  const MobileSignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ElevatedButton(
              child: const Padding(
                padding: EdgeInsets.all(16),
                child: Text('Sign Up'),
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
