import 'package:json_annotation/json_annotation.dart';

part 'feed.g.dart';

@JsonSerializable()
class CategoryFeed {
  String? version;
  String? encoding;
  Feed? feed;

  CategoryFeed({
    this.version,
    this.encoding,
    this.feed,
  });

  factory CategoryFeed.fromJson(Map<String, dynamic> json) =>
      _$CategoryFeedFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryFeedToJson(this);
}

@JsonSerializable()
class Feed {
  @JsonKey(name: 'xml:lang')
  String? xmlLang;

  String? xmlns;

  @JsonKey(name: r'xmlns$dcterms')
  String? xmlnsDcterms;

  @JsonKey(name: r'xmlns$thr')
  String? xmlnsThr;

  @JsonKey(name: r'xmlns$app')
  String? xmlnsApp;

  @JsonKey(name: r'xmlns$opensearch')
  String? xmlnsOpensearch;

  @JsonKey(name: r'xmlns$opds')
  String? xmlnsOpds;

  @JsonKey(name: r'xmlns$xsi')
  String? xmlnsXsi;

  @JsonKey(name: r'xmlns$odl')
  String? xmlnsOdl;

  @JsonKey(name: r'xmlns$schema')
  String? xmlnsSchema;
  Id? id;
  Id? title;
  Id? updated;
  Id? icon;
  Author? author;
  List<Link>? link;

  @JsonKey(name: r'opensearch$totalResults')
  Id? opensearchTotalResults;

  @JsonKey(name: r'opensearch$itemsPerPage')
  Id? opensearchItemsPerPage;

  @JsonKey(name: r'opensearch$startIndex')
  Id? opensearchStartIndex;
  List<Entry>? entry;

  Feed({
    this.xmlLang,
    this.xmlns,
    this.xmlnsDcterms,
    this.xmlnsThr,
    this.xmlnsApp,
    this.xmlnsOpensearch,
    this.xmlnsOpds,
    this.xmlnsXsi,
    this.xmlnsOdl,
    this.xmlnsSchema,
    this.id,
    this.title,
    this.updated,
    this.icon,
    this.author,
    this.link,
    this.opensearchTotalResults,
    this.opensearchItemsPerPage,
    this.opensearchStartIndex,
    this.entry,
  });

  factory Feed.fromJson(Map<String, dynamic> json) => _$FeedFromJson(json);
  Map<String, dynamic> toJson() => _$FeedToJson(this);
}

@JsonSerializable()
class Id {
  @JsonKey(name: r'$t')
  String? t;

  Id({
    this.t,
  });

  factory Id.fromJson(Map<String, dynamic> json) => _$IdFromJson(json);
  Map<String, dynamic> toJson() => _$IdToJson(this);
}

@JsonSerializable()
class Author {
  Id? name;
  Id? uri;
  Id? email;

  Author({
    this.name,
    this.uri,
    this.email,
  });

  factory Author.fromJson(Map<String, dynamic> json) => _$AuthorFromJson(json);
  Map<String, dynamic> toJson() => _$AuthorToJson(this);
}

@JsonSerializable()
class Link {
  String? rel;
  String? type;
  String? href;
  String? title;

  @JsonKey(name: 'opds:activeFacet')
  String? opdsActiveFacet;

  @JsonKey(name: 'opds:facetGroup')
  String? opdsFacetGroup;

  @JsonKey(name: 'thr:count')
  String? thrCount;

  Link({
    this.rel,
    this.type,
    this.href,
    this.title,
    this.opdsActiveFacet,
    this.opdsFacetGroup,
    this.thrCount,
  });

  factory Link.fromJson(Map<String, dynamic> json) => _$LinkFromJson(json);
  Map<String, dynamic> toJson() => _$LinkToJson(this);
}

@JsonSerializable()
class Entry {
  Id? title;
  Id? id;
  Author? author;
  Id? published;
  Id? updated;

  @JsonKey(name: r'dcterms$language')
  Id? dctermsLanguage;

  @JsonKey(name: r'dcterms$publisher')
  Id? dctermsPublisher;

  @JsonKey(name: r'dcterms$issued')
  Id? dctermsIssued;
  Id? summary;

  @JsonKey(fromJson: _categoryFromJson, toJson: _categoryToJson)
  List<Category>? category;

  List<Link>? link;

  @JsonKey(name: r'schema$Series')
  SchemaSeries? schemaSeries;

  String? get cover {
    return link?.elementAt(1).href;
  }

  String? get downloadUrl {
    return link?.elementAt(3).href;
  }

  Entry({
    this.title,
    this.id,
    this.author,
    this.published,
    this.updated,
    this.dctermsLanguage,
    this.dctermsPublisher,
    this.dctermsIssued,
    this.summary,
    this.category,
    this.link,
    this.schemaSeries,
  });

  factory Entry.fromJson(Map<String, dynamic> json) => _$EntryFromJson(json);
  Map<String, dynamic> toJson() => _$EntryToJson(this);
}

@JsonSerializable()
class Category {
  String? label;
  String? term;
  String? scheme;

  Category({
    this.label,
    this.term,
    this.scheme,
  });

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}

List<Category>? _categoryFromJson(dynamic json) {
  final String t = json.runtimeType.toString();
  if (t.toLowerCase().contains('list')) {
    List d = json;
    return d.map((e) => Category.fromJson(e)).toList();
  } else {
    return [Category.fromJson(json)];
  }
}

dynamic _categoryToJson(List<Category>? object) {
  return object?.map((e) => e.toJson()).toList();
}

@JsonSerializable()
class SchemaSeries {
  @JsonKey(name: 'schema:position')
  String? schemaPosition;

  @JsonKey(name: 'schema:name')
  String? schemaName;

  @JsonKey(name: 'schema:url')
  String? schemaUrl;

  SchemaSeries({
    this.schemaPosition,
    this.schemaName,
    this.schemaUrl,
  });

  factory SchemaSeries.fromJson(Map<String, dynamic> json) =>
      _$SchemaSeriesFromJson(json);
  Map<String, dynamic> toJson() => _$SchemaSeriesToJson(this);
}
