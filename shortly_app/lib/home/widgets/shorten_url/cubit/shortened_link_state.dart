part of 'shortened_link_cubit.dart';

enum ShortenLinkStatus { initial, loading, success, failure }

class ShortenedLinkState extends Equatable {
  const ShortenedLinkState({
    this.url = const Url.pure(),
    this.shortenLinkStatus = ShortenLinkStatus.initial,
    this.shortCodeResponses = const [],
    this.copied,
  });

  final List<GetShortCodeResponse> shortCodeResponses;
  final ShortenLinkStatus shortenLinkStatus;
  final Url url;
  final GetShortCodeResponse? copied;

  @override
  List<Object?> get props => [
        shortCodeResponses,
        shortenLinkStatus,
        url,
        copied,
      ];

  ShortenedLinkState copyWith({
    List<GetShortCodeResponse>? shortCodeResponses,
    ShortenLinkStatus? shortenLinkStatus,
    Url? url,
    GetShortCodeResponse? copied,
  }) {
    return ShortenedLinkState(
      shortCodeResponses: shortCodeResponses ?? this.shortCodeResponses,
      shortenLinkStatus: shortenLinkStatus ?? this.shortenLinkStatus,
      url: url ?? this.url,
      copied: copied ?? this.copied,
    );
  }
}
