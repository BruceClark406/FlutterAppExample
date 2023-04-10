import 'package:formz/formz.dart';

enum UrlValidationError { invalid }

class Url extends FormzInput<String, UrlValidationError> {
  const Url.pure() : super.pure('');
  const Url.dirty([super.value = '']) : super.dirty();

  static final RegExp _urlRegExp = RegExp(
    r'^(http(s):\/\/.)[-a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,10}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*)$',
  );

  @override
  UrlValidationError? validator(String? value) {
    if (value == null) {
      return UrlValidationError.invalid;
    }
    if (!_urlRegExp.hasMatch(value)) {
      return UrlValidationError.invalid;
    }
    // return null is valid
    return null;
  }
}
