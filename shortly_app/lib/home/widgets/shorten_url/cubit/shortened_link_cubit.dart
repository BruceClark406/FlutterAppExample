import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:short_code_api_package/short_code_api_repository.dart';
import 'package:shortly_app/forms/models/models.dart';

part 'shortened_link_state.dart';

class ShortenedLinkCubit extends HydratedCubit<ShortenedLinkState> {
  ShortenedLinkCubit({
    required ShortCodeApiRepository shortCodeApiRepository,
  })  : _shortCodeApiRepository = shortCodeApiRepository,
        super(
          const ShortenedLinkState(),
        );

  final ShortCodeApiRepository _shortCodeApiRepository;

  void urlChanged(String value) => emit(state.copyWith(url: Url.dirty(value)));

  void clearShortenedLinks() => emit(state.copyWith(shortCodeResponses: []));

  Future<void> setCopied({
    required GetShortCodeResponse shortCodeResponse,
  }) async {
    await Clipboard.setData(ClipboardData(text: shortCodeResponse.shortLink));
    emit(state.copyWith(copied: shortCodeResponse));
  }

  Future<void> shortenLink() async {
    if (!state.url.isValid) {
      emit(
        state.copyWith(
          url: Url.dirty(state.url.value),
        ),
      );
      return;
    }

    emit(
      state.copyWith(
        shortenLinkStatus: ShortenLinkStatus.loading,
      ),
    );

    final shortenedLinkResponse =
        await _shortCodeApiRepository.getShortCode(state.url.value);

    emit(
      state.copyWith(
        shortenLinkStatus: ShortenLinkStatus.success,
        shortCodeResponses: [
          shortenedLinkResponse,
          ...state.shortCodeResponses,
        ],
      ),
    );
  }

  @override
  ShortenedLinkState fromJson(Map<String, dynamic> json) => ShortenedLinkState(
        shortCodeResponses: [
          for (final shortCodeResponse
              in json['shortCodeResponses'] as List<dynamic>)
            GetShortCodeResponse.fromJson(
              shortCodeResponse as Map<String, dynamic>,
            )
        ],
      );

  @override
  Map<String, dynamic> toJson(ShortenedLinkState state) => {
        'shortCodeResponses': [
          for (final shortCodeResponse in state.shortCodeResponses)
            shortCodeResponse.toJson()
        ]
      };
}
