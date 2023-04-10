// ignore_for_file: public_member_api_docs

import 'package:equatable/equatable.dart';

class GetShortCodeResponse extends Equatable {
  const GetShortCodeResponse({
    this.code,
    this.shortLink,
    this.fullShortLink,
    this.shortLink2,
    this.fullShortLink2,
    this.shareLink,
    this.fullShareLink,
    this.originalLink,
  });
  factory GetShortCodeResponse.fromJson(Map<String, dynamic> json) {
    return GetShortCodeResponse(
      code: json['code'] as String?,
      shortLink: json['short_link'] as String?,
      fullShortLink: json['full_short_link'] as String?,
      shortLink2: json['short_link2'] as String?,
      fullShortLink2: json['full_short_link2'] as String?,
      shareLink: json['share_link'] as String?,
      fullShareLink: json['full_share_link'] as String?,
      originalLink: json['original_link'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'short_link': shortLink,
      'full_short_link': fullShortLink,
      'short_link2': shortLink2,
      'full_short_link2': fullShortLink2,
      'share_link': shareLink,
      'full_share_link': fullShareLink,
      'original_link': originalLink,
    };
  }

  final String? code;
  final String? shortLink;
  final String? fullShortLink;
  final String? shortLink2;
  final String? fullShortLink2;
  final String? shareLink;
  final String? fullShareLink;
  final String? originalLink;

  @override
  List<Object?> get props => [
        code,
        shortLink,
        fullShortLink,
        shortLink2,
        fullShortLink2,
        shareLink,
        fullShareLink,
        originalLink,
      ];
}
