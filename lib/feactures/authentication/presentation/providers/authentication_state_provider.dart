import 'package:freezed_annotation/freezed_annotation.dart';
part 'authentication_state_provider.freezed.dart';

@freezed
class AuthenticationState with _$AuthenticationState {
  factory AuthenticationState({
    required String verificationId,
    required int? resendToken,
  }) = _AuthenticationState;
}
