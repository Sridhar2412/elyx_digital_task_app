import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/model/user.dart';

part 'user_dto.freezed.dart';
part 'user_dto.g.dart';

@freezed
class UserDto with _$UserDto {
  const factory UserDto({
    required int id,
    String? email,
    @JsonKey(name: 'first_name') String? firstName,
    @JsonKey(name: 'last_name') String? lastName,
    String? avatar,
    String? login,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
  }) = _UserDto;

  const UserDto._();

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);

  User toDomain() {
    return User(
      id: id,
      email: email ?? '',
      firstName: firstName ?? login ?? 'Unknown',
      lastName: lastName ?? '',
      avatar: avatar ?? avatarUrl ?? '',
    );
  }

  factory UserDto.fromDomain(User user) {
    return UserDto(
      id: user.id,
      email: user.email,
      firstName: user.firstName,
      lastName: user.lastName,
      avatar: user.avatar,
      login: user.firstName,
      avatarUrl: user.avatar,
    );
  }
}
