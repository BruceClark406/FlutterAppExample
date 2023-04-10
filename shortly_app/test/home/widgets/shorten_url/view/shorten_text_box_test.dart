import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shortly_app/home/home.dart';

import '../../../../helpers/helpers.dart';

void main() {
  group('ShortenTextBox ', () {
    late ShortenedLinkCubit cubit;

    setUp(() {
      cubit = MockShortenedLinkCubit();

      when(() => cubit.state).thenReturn(
        const ShortenedLinkState(),
      );
    });

    group('renders', () {
      testWidgets('ShortenTextRow', (tester) async {
        await tester.pumpApp(const HomePage());

        expect(find.byType(ShortenTextRow), findsOneWidget);
      });
    });

    group('calls', () {
      testWidgets('shortenLink', (tester) async {
        when(() => cubit.shortenLink()).thenAnswer((_) async {});

        await tester.pumpApp(
          MultiBlocProvider(
            providers: [
              BlocProvider.value(value: cubit),
            ],
            child: const ShortenTextButton(shouldExpand: true),
          ),
        );

        await tester.tap(find.widgetWithText(ElevatedButton, 'Shorten It!'));

        await tester.pumpAndSettle();

        verify(() => cubit.shortenLink()).called(1);
      });
    });
  });
}
