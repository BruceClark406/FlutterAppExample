import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:short_code_api_package/short_code_api_repository.dart';
import 'package:shortly_app/forms/forms.dart';
import 'package:shortly_app/home/home.dart';

import '../../../../view/app_test.dart';

class MockShortCodeApiRepository extends Mock
    implements ShortCodeApiRepository {}

void main() {
  group('CreateOrLinkAccountCubit', () {
    late ShortCodeApiRepository shortCodeApiRepository;
    late Storage storage;

    setUp(() {
      shortCodeApiRepository = MockShortCodeApiRepository();

      storage = MockStorage();
      when(
        () => storage.write(any(), any<dynamic>()),
      ).thenAnswer((_) async {});
      HydratedBloc.storage = storage;
    });

    group('ShortenedLinkCubit', () {
      blocTest<ShortenedLinkCubit, ShortenedLinkState>(
        'shortenLink emits correct state',
        build: () {
          when(
            () => shortCodeApiRepository.getShortCode(
              'https://www.google.com',
            ),
          ).thenAnswer(
            (_) async => const GetShortCodeResponse(
              code: '123456',
              originalLink: 'https://www.google.com',
              shortLink: 'https://www.g.gle.com',
            ),
          );

          return ShortenedLinkCubit(
            shortCodeApiRepository: shortCodeApiRepository,
          );
        },
        seed: () => const ShortenedLinkState(
          url: Url.dirty('https://www.google.com'),
        ),
        act: (cubit) => cubit.shortenLink(),
        expect: () => [
          const ShortenedLinkState(
            url: Url.dirty('https://www.google.com'),
            shortenLinkStatus: ShortenLinkStatus.loading,
          ),
          const ShortenedLinkState(
            url: Url.dirty('https://www.google.com'),
            shortenLinkStatus: ShortenLinkStatus.success,
            shortCodeResponses: [
              GetShortCodeResponse(
                code: '123456',
                originalLink: 'https://www.google.com',
                shortLink: 'https://www.g.gle.com',
              )
            ],
          )
        ],
      );
    });
  });
}
