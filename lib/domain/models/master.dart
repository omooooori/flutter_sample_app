import 'master_type.dart';

class Master {
  final String id;
  final String name;
  final String kana;
  final MasterType type;
  final int score;
  final DateTime? lastUsedAt;
  final int useCount;

  const Master({
    required this.id,
    required this.name,
    required this.kana,
    required this.type,
    required this.score,
    this.lastUsedAt,
    this.useCount = 0,
  });

  Master copyWith({
    String? id,
    String? name,
    String? kana,
    MasterType? type,
    int? score,
    DateTime? lastUsedAt,
    int? useCount,
    bool? isFavorite,
  }) {
    return Master(
      id: id ?? this.id,
      name: name ?? this.name,
      kana: kana ?? this.kana,
      type: type ?? this.type,
      score: score ?? this.score,
      lastUsedAt: lastUsedAt ?? this.lastUsedAt,
      useCount: useCount ?? this.useCount,
    );
  }
}
