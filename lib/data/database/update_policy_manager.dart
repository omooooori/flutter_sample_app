import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final updatePolicyManagerInitProvider = FutureProvider<UpdatePolicyManager>((
  ref,
) async {
  final prefs = await SharedPreferences.getInstance();
  return UpdatePolicyManager(prefs);
});

class UpdatePolicyManager {
  static const _lastUpdatedKey = 'last_updated_at';

  final SharedPreferences prefs;

  UpdatePolicyManager(this.prefs);

  /// 最終更新が「今日中」なら true（＝更新済み）
  Future<bool> isUpdatedToday() async {
    final lastUpdatedMillis = prefs.getInt(_lastUpdatedKey);
    if (lastUpdatedMillis == null) return false;

    final lastUpdated = DateTime.fromMillisecondsSinceEpoch(lastUpdatedMillis);
    final now = DateTime.now();

    return lastUpdated.year == now.year &&
        lastUpdated.month == now.month &&
        lastUpdated.day == now.day;
  }

  Future<void> markAsUpdatedNow() async {
    await prefs.setInt(_lastUpdatedKey, DateTime.now().millisecondsSinceEpoch);
  }
}
