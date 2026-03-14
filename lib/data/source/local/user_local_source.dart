import 'dart:convert';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/providers/shared_pref_provider.dart';
import '../../model/user_dto.dart';

part 'user_local_source.g.dart';

class UserLocalSource {
  final SharedPreferences _prefs;
  static const String _cacheKey = 'cached_users_list';

  UserLocalSource(this._prefs);

  Future<void> cacheUsers(List<UserDto> users) async {
    final Map<String, dynamic> cachePayload = {
      'timestamp': DateTime.now().millisecondsSinceEpoch,
      'data': users.map((e) => e.toJson()).toList(),
    };
    final jsonString = jsonEncode(cachePayload);
    await _prefs.setString(_cacheKey, jsonString);
  }

  Future<List<UserDto>> getCachedUsers() async {
    final cached = _prefs.getString(_cacheKey);
    if (cached == null) return [];
    
    try {
      final decoded = jsonDecode(cached) as Map<String, dynamic>;
      final timestamp = decoded['timestamp'] as int?;
      final data = decoded['data'] as List<dynamic>?;

      if (timestamp == null || data == null) return [];

      final cacheTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
      final difference = DateTime.now().difference(cacheTime);

      // Invalidate cache if older than 1 hour
      if (difference.inHours >= 1) {
        await _prefs.remove(_cacheKey);
        return [];
      }

      return data.map((json) => UserDto.fromJson(json)).toList();
    } catch (_) {
      // In case of parsing errors or old schema format
      await _prefs.remove(_cacheKey);
      return [];
    }
  }
}

@Riverpod(keepAlive: true)
UserLocalSource userLocalSource(UserLocalSourceRef ref) {
  final prefs = ref.watch(sharedPreferencesProvider);
  return UserLocalSource(prefs);
}
