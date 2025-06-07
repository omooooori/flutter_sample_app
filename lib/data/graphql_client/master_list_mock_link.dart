import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:kana_kit/kana_kit.dart';

List<Map<String, dynamic>>? _cachedMockData;
const kanaKit = KanaKit();

Link get masterListMockLink => Link.function((request, [forward]) async* {
      yield Response(
        data: {'__typename': 'Query', 'master_list': generateMockData()},
        response: const {'statusCode': 200},
        errors: const [],
        context: const Context(),
      );
    });

List<Map<String, dynamic>> generateMockData() {
  if (_cachedMockData != null) return _cachedMockData!;

  final departments = [
    {"name": "営業本部", "kana": "えいぎょうほんぶ"},
    {"name": "マーケティング部", "kana": "まーけてぃんぐぶ"},
    {"name": "経理部", "kana": "けいりぶ"},
    {"name": "法務部", "kana": "ほうむぶ"},
    {"name": "人事部", "kana": "じんじぶ"},
    {"name": "総務部", "kana": "そうむぶ"},
    {"name": "IT推進室", "kana": "あいてぃーすいしんしつ"},
    {"name": "ITインフラ部", "kana": "あいてぃーいんふらぶ"},
    {"name": "IT戦略部", "kana": "あいてぃーせんりゃくぶ"},
    {"name": "プロダクト開発部", "kana": "ぷろだくとかいはつぶ"},
    {"name": "品質保証部", "kana": "ひんしつほしょうぶ"},
    {"name": "カスタマーサポート部", "kana": "かすたまーさぽーとぶ"},
  ];
  final items = [
    {"name": "交通費", "kana": "こうつうひ"},
    {"name": "交通費（国内）", "kana": "こうつうひこくない"},
    {"name": "交通費（海外）", "kana": "こうつうひかいがい"},
    {"name": "宿泊費", "kana": "しゅくはくひ"},
    {"name": "書籍購入", "kana": "しょせきこうにゅう"},
    {"name": "事務用品", "kana": "じむようひん"},
    {"name": "ソフトウェアライセンス", "kana": "そふとうぇあらいせんす"},
    {"name": "ソフト導入費", "kana": "そふとどうにゅうひ"},
    {"name": "ソフト開発支援費", "kana": "そふとかいはつしえんひ"},
    {"name": "外注費", "kana": "がいちゅうひ"},
    {"name": "備品購入", "kana": "びひんこうにゅう"},
    {"name": "会議費", "kana": "かいぎひ"},
    {"name": "通信費", "kana": "つうしんひ"},
    {"name": "接待交際費", "kana": "せったいこうさいひ"},
  ];
  final projects = [
    {"name": "新規サービス立ち上げ", "kana": "しんきさーびすたちあげ"},
    {"name": "社内DX推進", "kana": "しゃないでぃーえっくすすいしん"},
    {"name": "海外展開準備", "kana": "かいがいてんかいじゅんび"},
    {"name": "スマホアプリ刷新", "kana": "すまほあぷりさっしん"},
    {"name": "コスト削減施策", "kana": "こすとさくげんしさく"},
  ];
  final segments = [
    {"name": "法人向け事業", "kana": "ほうじんむけじぎょう"},
    {"name": "個人向け事業", "kana": "こじんむけじぎょう"},
    {"name": "地方自治体向け", "kana": "ちほうじちたいむけ"},
    {"name": "パートナー連携", "kana": "ぱーとなーれんけい"},
    {"name": "実証実験用", "kana": "じっしょうじっけんよう"},
  ];
  final testCases = [
    {"name": "ソフトウェア", "kana": "そふとうぇあ"},
    {"name": "ｿﾌﾄｳｪｱ", "kana": "そふとうぇあ"},
    {"name": "ソフトｳｪｱ", "kana": "そふとうぇあ"},
    {"name": "ｿﾌﾄウェア", "kana": "そふとうぇあ"},
    {"name": "ｿﾌﾄｳｴｱ", "kana": "そふとうえあ"},
    {"name": "SoftWare", "kana": "そふとうぇあ"},
    {"name": "soft-ware", "kana": "そふとうぇあ"},
    {"name": "ソフトウエア", "kana": "そふとうえあ"},
    {"name": "そふと", "kana": "そふと"},
    {"name": "そふと1", "kana": "そふといち"},
    {"name": "ソフト２", "kana": "そふとに"},
    {"name": "ソフト３", "kana": "そふとさん"},
    {"name": "ｿﾌﾄ４", "kana": "そふとよん"},
    {"name": "ソフト５！", "kana": "そふとご"},
    {"name": "ソ-フト", "kana": "そーふと"},
    {"name": "ソ―フト", "kana": "そーふと"},
    {"name": "ソ－フト", "kana": "そーふと"},
    {"name": "ソーﾌﾄ", "kana": "そーふと"},
    {"name": "SOＦＴ", "kana": "そふと"},
  ];

  int idCounter = 0;

  List<Map<String, dynamic>> makeEntries(
    List<Map<String, String>> list,
    String typeId,
  ) {
    return list.map((e) {
      final name = e['name']!;
      final kana = e['kana']!;
      return {
        'id': '${idCounter++}',
        'masterName': name,
        'masterNameKana': kana,
        'masterTypeId': typeId,
        '__typename': 'Master',
        'normalizedTokens': [
          normalize(name),
          normalize(kana),
          kanaKit.toRomaji(kana).toLowerCase(),
        ],
      };
    }).toList();
  }

  final bigData = List.generate(
    10000,
    (index) => {'name': 'ビッグデータ$index', 'kana': 'びっぐでーた$index'},
  );

  _cachedMockData = [
    ...makeEntries(departments, 'department'),
    ...makeEntries(items, 'item'),
    ...makeEntries(projects, 'project1'),
    ...makeEntries(segments, 'segment1'),
    ...makeEntries(testCases, 'test'),
    ...makeEntries(bigData, 'bigData'),
  ];

  return _cachedMockData!;
}

String normalize(String input) {
  return kanaKit
      .toHiragana(input)
      .toLowerCase()
      .replaceAll(RegExp(r'\s+'), '')
      .replaceAll(RegExp(r'[ー−－―─ｰ]'), 'ー')
      .replaceAllMapped(
        RegExp(r'[Ａ-Ｚａ-ｚ０-９]'),
        (m) => String.fromCharCode(m[0]!.codeUnitAt(0) - 65248),
      )
      .replaceAll(RegExp(r'[^ぁ-んーa-z0-9]'), '');
}
