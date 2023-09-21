// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryFeed _$CategoryFeedFromJson(Map<String, dynamic> json) => CategoryFeed(
      version: json['version'] as String?,
      encoding: json['encoding'] as String?,
      feed: json['feed'] == null
          ? null
          : Feed.fromJson(json['feed'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CategoryFeedToJson(CategoryFeed instance) =>
    <String, dynamic>{
      'version': instance.version,
      'encoding': instance.encoding,
      'feed': instance.feed,
    };

Feed _$FeedFromJson(Map<String, dynamic> json) => Feed(
      xmlLang: json['xml:lang'] as String?,
      xmlns: json['xmlns'] as String?,
      xmlnsDcterms: json[r'xmlns$dcterms'] as String?,
      xmlnsThr: json[r'xmlns$thr'] as String?,
      xmlnsApp: json[r'xmlns$app'] as String?,
      xmlnsOpensearch: json[r'xmlns$opensearch'] as String?,
      xmlnsOpds: json[r'xmlns$opds'] as String?,
      xmlnsXsi: json[r'xmlns$xsi'] as String?,
      xmlnsOdl: json[r'xmlns$odl'] as String?,
      xmlnsSchema: json[r'xmlns$schema'] as String?,
      id: json['id'] == null
          ? null
          : Id.fromJson(json['id'] as Map<String, dynamic>),
      title: json['title'] == null
          ? null
          : Id.fromJson(json['title'] as Map<String, dynamic>),
      updated: json['updated'] == null
          ? null
          : Id.fromJson(json['updated'] as Map<String, dynamic>),
      icon: json['icon'] == null
          ? null
          : Id.fromJson(json['icon'] as Map<String, dynamic>),
      author: json['author'] == null
          ? null
          : Author.fromJson(json['author'] as Map<String, dynamic>),
      link: (json['link'] as List<dynamic>?)
          ?.map((e) => Link.fromJson(e as Map<String, dynamic>))
          .toList(),
      opensearchTotalResults: json[r'opensearch$totalResults'] == null
          ? null
          : Id.fromJson(
              json[r'opensearch$totalResults'] as Map<String, dynamic>),
      opensearchItemsPerPage: json[r'opensearch$itemsPerPage'] == null
          ? null
          : Id.fromJson(
              json[r'opensearch$itemsPerPage'] as Map<String, dynamic>),
      opensearchStartIndex: json[r'opensearch$startIndex'] == null
          ? null
          : Id.fromJson(json[r'opensearch$startIndex'] as Map<String, dynamic>),
      entry: (json['entry'] as List<dynamic>?)
          ?.map((e) => Entry.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FeedToJson(Feed instance) => <String, dynamic>{
      'xml:lang': instance.xmlLang,
      'xmlns': instance.xmlns,
      r'xmlns$dcterms': instance.xmlnsDcterms,
      r'xmlns$thr': instance.xmlnsThr,
      r'xmlns$app': instance.xmlnsApp,
      r'xmlns$opensearch': instance.xmlnsOpensearch,
      r'xmlns$opds': instance.xmlnsOpds,
      r'xmlns$xsi': instance.xmlnsXsi,
      r'xmlns$odl': instance.xmlnsOdl,
      r'xmlns$schema': instance.xmlnsSchema,
      'id': instance.id,
      'title': instance.title,
      'updated': instance.updated,
      'icon': instance.icon,
      'author': instance.author,
      'link': instance.link,
      r'opensearch$totalResults': instance.opensearchTotalResults,
      r'opensearch$itemsPerPage': instance.opensearchItemsPerPage,
      r'opensearch$startIndex': instance.opensearchStartIndex,
      'entry': instance.entry,
    };

Id _$IdFromJson(Map<String, dynamic> json) => Id(
      t: json[r'$t'] as String?,
    );

Map<String, dynamic> _$IdToJson(Id instance) => <String, dynamic>{
      r'$t': instance.t,
    };

Author _$AuthorFromJson(Map<String, dynamic> json) => Author(
      name: json['name'] == null
          ? null
          : Id.fromJson(json['name'] as Map<String, dynamic>),
      uri: json['uri'] == null
          ? null
          : Id.fromJson(json['uri'] as Map<String, dynamic>),
      email: json['email'] == null
          ? null
          : Id.fromJson(json['email'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AuthorToJson(Author instance) => <String, dynamic>{
      'name': instance.name,
      'uri': instance.uri,
      'email': instance.email,
    };

Link _$LinkFromJson(Map<String, dynamic> json) => Link(
      rel: json['rel'] as String?,
      type: json['type'] as String?,
      href: json['href'] as String?,
      title: json['title'] as String?,
      opdsActiveFacet: json['opds:activeFacet'] as String?,
      opdsFacetGroup: json['opds:facetGroup'] as String?,
      thrCount: json['thr:count'] as String?,
    );

Map<String, dynamic> _$LinkToJson(Link instance) => <String, dynamic>{
      'rel': instance.rel,
      'type': instance.type,
      'href': instance.href,
      'title': instance.title,
      'opds:activeFacet': instance.opdsActiveFacet,
      'opds:facetGroup': instance.opdsFacetGroup,
      'thr:count': instance.thrCount,
    };

Entry _$EntryFromJson(Map<String, dynamic> json) => Entry(
      title: json['title'] == null
          ? null
          : Id.fromJson(json['title'] as Map<String, dynamic>),
      id: json['id'] == null
          ? null
          : Id.fromJson(json['id'] as Map<String, dynamic>),
      author: json['author'] == null
          ? null
          : Author.fromJson(json['author'] as Map<String, dynamic>),
      published: json['published'] == null
          ? null
          : Id.fromJson(json['published'] as Map<String, dynamic>),
      updated: json['updated'] == null
          ? null
          : Id.fromJson(json['updated'] as Map<String, dynamic>),
      dctermsLanguage: json[r'dcterms$language'] == null
          ? null
          : Id.fromJson(json[r'dcterms$language'] as Map<String, dynamic>),
      dctermsPublisher: json[r'dcterms$publisher'] == null
          ? null
          : Id.fromJson(json[r'dcterms$publisher'] as Map<String, dynamic>),
      dctermsIssued: json[r'dcterms$issued'] == null
          ? null
          : Id.fromJson(json[r'dcterms$issued'] as Map<String, dynamic>),
      summary: json['summary'] == null
          ? null
          : Id.fromJson(json['summary'] as Map<String, dynamic>),
      category: _categoryFromJson(json['category']),
      link: (json['link'] as List<dynamic>?)
          ?.map((e) => Link.fromJson(e as Map<String, dynamic>))
          .toList(),
      schemaSeries: json[r'schema$Series'] == null
          ? null
          : SchemaSeries.fromJson(
              json[r'schema$Series'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EntryToJson(Entry instance) => <String, dynamic>{
      'title': instance.title,
      'id': instance.id,
      'author': instance.author,
      'published': instance.published,
      'updated': instance.updated,
      r'dcterms$language': instance.dctermsLanguage,
      r'dcterms$publisher': instance.dctermsPublisher,
      r'dcterms$issued': instance.dctermsIssued,
      'summary': instance.summary,
      'category': _categoryToJson(instance.category),
      'link': instance.link,
      r'schema$Series': instance.schemaSeries,
    };

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      label: json['label'] as String?,
      term: json['term'] as String?,
      scheme: json['scheme'] as String?,
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'label': instance.label,
      'term': instance.term,
      'scheme': instance.scheme,
    };

SchemaSeries _$SchemaSeriesFromJson(Map<String, dynamic> json) => SchemaSeries(
      schemaPosition: json['schema:position'] as String?,
      schemaName: json['schema:name'] as String?,
      schemaUrl: json['schema:url'] as String?,
    );

Map<String, dynamic> _$SchemaSeriesToJson(SchemaSeries instance) =>
    <String, dynamic>{
      'schema:position': instance.schemaPosition,
      'schema:name': instance.schemaName,
      'schema:url': instance.schemaUrl,
    };
