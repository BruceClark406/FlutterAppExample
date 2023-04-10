// ignore_for_file: prefer_const_constructors
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:short_code_api_package/short_code_api_repository.dart';
import 'package:shortly_app/home/home.dart';

import '../view/app_test.dart';

class MockShortenedLinkCubit
    extends MockBloc<ShortenedLinkCubit, ShortenedLinkState>
    implements ShortenedLinkCubit {}

class MockShortCodeApiRepository extends Mock
    implements ShortCodeApiRepository {}

extension AppTester on WidgetTester {
  Future<void> pumpApp(
    Widget widgetUnderTest, {
    ShortenedLinkCubit? shortenedLinkCubit,
    ShortCodeApiRepository? shortCodeApiRepository,
  }) async {
    final storage = MockStorage();
    when(
      () => storage.write(any(), any<dynamic>()),
    ).thenAnswer((_) async {});
    HydratedBloc.storage = storage;

    final defaultShortenedLinkCubit = MockShortenedLinkCubit();
    when(() => defaultShortenedLinkCubit.state)
        .thenReturn(ShortenedLinkState());
    await pumpWidget(
      MultiRepositoryProvider(
        providers: [
          RepositoryProvider.value(
            value: shortCodeApiRepository ?? MockShortCodeApiRepository(),
          ),
        ],
        child: BlocProvider.value(
          value: shortenedLinkCubit ?? defaultShortenedLinkCubit,
          child: MaterialApp(
            title: 'Shortly',
            home: MediaQuery(
              data: const MediaQueryData(),
              child: Scaffold(body: widgetUnderTest),
            ),
          ),
        ),
      ),
    );
    await pump();
  }
}
