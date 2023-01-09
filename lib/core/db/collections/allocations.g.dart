// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'allocations.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetAllocationsCollection on Isar {
  IsarCollection<Allocations> get allocations => this.collection();
}

const AllocationsSchema = CollectionSchema(
  name: r'Allocations',
  id: 5136500791244424190,
  properties: {
    r'createdDate': PropertySchema(
      id: 0,
      name: r'createdDate',
      type: IsarType.dateTime,
    ),
    r'lastAllocationDate': PropertySchema(
      id: 1,
      name: r'lastAllocationDate',
      type: IsarType.dateTime,
    ),
    r'name': PropertySchema(
      id: 2,
      name: r'name',
      type: IsarType.string,
    ),
    r'total': PropertySchema(
      id: 3,
      name: r'total',
      type: IsarType.double,
    ),
    r'totalLastAllocation': PropertySchema(
      id: 4,
      name: r'totalLastAllocation',
      type: IsarType.double,
    )
  },
  estimateSize: _allocationsEstimateSize,
  serialize: _allocationsSerialize,
  deserialize: _allocationsDeserialize,
  deserializeProp: _allocationsDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _allocationsGetId,
  getLinks: _allocationsGetLinks,
  attach: _allocationsAttach,
  version: '3.0.5',
);

int _allocationsEstimateSize(
  Allocations object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.name;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _allocationsSerialize(
  Allocations object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.createdDate);
  writer.writeDateTime(offsets[1], object.lastAllocationDate);
  writer.writeString(offsets[2], object.name);
  writer.writeDouble(offsets[3], object.total);
  writer.writeDouble(offsets[4], object.totalLastAllocation);
}

Allocations _allocationsDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Allocations();
  object.createdDate = reader.readDateTimeOrNull(offsets[0]);
  object.id = id;
  object.lastAllocationDate = reader.readDateTimeOrNull(offsets[1]);
  object.name = reader.readStringOrNull(offsets[2]);
  object.total = reader.readDoubleOrNull(offsets[3]);
  object.totalLastAllocation = reader.readDoubleOrNull(offsets[4]);
  return object;
}

P _allocationsDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 1:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readDoubleOrNull(offset)) as P;
    case 4:
      return (reader.readDoubleOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _allocationsGetId(Allocations object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _allocationsGetLinks(Allocations object) {
  return [];
}

void _allocationsAttach(
    IsarCollection<dynamic> col, Id id, Allocations object) {
  object.id = id;
}

extension AllocationsQueryWhereSort
    on QueryBuilder<Allocations, Allocations, QWhere> {
  QueryBuilder<Allocations, Allocations, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension AllocationsQueryWhere
    on QueryBuilder<Allocations, Allocations, QWhereClause> {
  QueryBuilder<Allocations, Allocations, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Allocations, Allocations, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Allocations, Allocations, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Allocations, Allocations, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Allocations, Allocations, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension AllocationsQueryFilter
    on QueryBuilder<Allocations, Allocations, QFilterCondition> {
  QueryBuilder<Allocations, Allocations, QAfterFilterCondition>
      createdDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createdDate',
      ));
    });
  }

  QueryBuilder<Allocations, Allocations, QAfterFilterCondition>
      createdDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'createdDate',
      ));
    });
  }

  QueryBuilder<Allocations, Allocations, QAfterFilterCondition>
      createdDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Allocations, Allocations, QAfterFilterCondition>
      createdDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Allocations, Allocations, QAfterFilterCondition>
      createdDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Allocations, Allocations, QAfterFilterCondition>
      createdDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Allocations, Allocations, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Allocations, Allocations, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Allocations, Allocations, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Allocations, Allocations, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Allocations, Allocations, QAfterFilterCondition>
      lastAllocationDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastAllocationDate',
      ));
    });
  }

  QueryBuilder<Allocations, Allocations, QAfterFilterCondition>
      lastAllocationDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastAllocationDate',
      ));
    });
  }

  QueryBuilder<Allocations, Allocations, QAfterFilterCondition>
      lastAllocationDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastAllocationDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Allocations, Allocations, QAfterFilterCondition>
      lastAllocationDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastAllocationDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Allocations, Allocations, QAfterFilterCondition>
      lastAllocationDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastAllocationDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Allocations, Allocations, QAfterFilterCondition>
      lastAllocationDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastAllocationDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Allocations, Allocations, QAfterFilterCondition> nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<Allocations, Allocations, QAfterFilterCondition>
      nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<Allocations, Allocations, QAfterFilterCondition> nameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Allocations, Allocations, QAfterFilterCondition> nameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Allocations, Allocations, QAfterFilterCondition> nameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Allocations, Allocations, QAfterFilterCondition> nameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Allocations, Allocations, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Allocations, Allocations, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Allocations, Allocations, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Allocations, Allocations, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Allocations, Allocations, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Allocations, Allocations, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Allocations, Allocations, QAfterFilterCondition> totalIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'total',
      ));
    });
  }

  QueryBuilder<Allocations, Allocations, QAfterFilterCondition>
      totalIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'total',
      ));
    });
  }

  QueryBuilder<Allocations, Allocations, QAfterFilterCondition> totalEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'total',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Allocations, Allocations, QAfterFilterCondition>
      totalGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'total',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Allocations, Allocations, QAfterFilterCondition> totalLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'total',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Allocations, Allocations, QAfterFilterCondition> totalBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'total',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Allocations, Allocations, QAfterFilterCondition>
      totalLastAllocationIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'totalLastAllocation',
      ));
    });
  }

  QueryBuilder<Allocations, Allocations, QAfterFilterCondition>
      totalLastAllocationIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'totalLastAllocation',
      ));
    });
  }

  QueryBuilder<Allocations, Allocations, QAfterFilterCondition>
      totalLastAllocationEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalLastAllocation',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Allocations, Allocations, QAfterFilterCondition>
      totalLastAllocationGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalLastAllocation',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Allocations, Allocations, QAfterFilterCondition>
      totalLastAllocationLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalLastAllocation',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Allocations, Allocations, QAfterFilterCondition>
      totalLastAllocationBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalLastAllocation',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension AllocationsQueryObject
    on QueryBuilder<Allocations, Allocations, QFilterCondition> {}

extension AllocationsQueryLinks
    on QueryBuilder<Allocations, Allocations, QFilterCondition> {}

extension AllocationsQuerySortBy
    on QueryBuilder<Allocations, Allocations, QSortBy> {
  QueryBuilder<Allocations, Allocations, QAfterSortBy> sortByCreatedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdDate', Sort.asc);
    });
  }

  QueryBuilder<Allocations, Allocations, QAfterSortBy> sortByCreatedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdDate', Sort.desc);
    });
  }

  QueryBuilder<Allocations, Allocations, QAfterSortBy>
      sortByLastAllocationDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastAllocationDate', Sort.asc);
    });
  }

  QueryBuilder<Allocations, Allocations, QAfterSortBy>
      sortByLastAllocationDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastAllocationDate', Sort.desc);
    });
  }

  QueryBuilder<Allocations, Allocations, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Allocations, Allocations, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Allocations, Allocations, QAfterSortBy> sortByTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'total', Sort.asc);
    });
  }

  QueryBuilder<Allocations, Allocations, QAfterSortBy> sortByTotalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'total', Sort.desc);
    });
  }

  QueryBuilder<Allocations, Allocations, QAfterSortBy>
      sortByTotalLastAllocation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalLastAllocation', Sort.asc);
    });
  }

  QueryBuilder<Allocations, Allocations, QAfterSortBy>
      sortByTotalLastAllocationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalLastAllocation', Sort.desc);
    });
  }
}

extension AllocationsQuerySortThenBy
    on QueryBuilder<Allocations, Allocations, QSortThenBy> {
  QueryBuilder<Allocations, Allocations, QAfterSortBy> thenByCreatedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdDate', Sort.asc);
    });
  }

  QueryBuilder<Allocations, Allocations, QAfterSortBy> thenByCreatedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdDate', Sort.desc);
    });
  }

  QueryBuilder<Allocations, Allocations, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Allocations, Allocations, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Allocations, Allocations, QAfterSortBy>
      thenByLastAllocationDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastAllocationDate', Sort.asc);
    });
  }

  QueryBuilder<Allocations, Allocations, QAfterSortBy>
      thenByLastAllocationDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastAllocationDate', Sort.desc);
    });
  }

  QueryBuilder<Allocations, Allocations, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Allocations, Allocations, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Allocations, Allocations, QAfterSortBy> thenByTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'total', Sort.asc);
    });
  }

  QueryBuilder<Allocations, Allocations, QAfterSortBy> thenByTotalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'total', Sort.desc);
    });
  }

  QueryBuilder<Allocations, Allocations, QAfterSortBy>
      thenByTotalLastAllocation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalLastAllocation', Sort.asc);
    });
  }

  QueryBuilder<Allocations, Allocations, QAfterSortBy>
      thenByTotalLastAllocationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalLastAllocation', Sort.desc);
    });
  }
}

extension AllocationsQueryWhereDistinct
    on QueryBuilder<Allocations, Allocations, QDistinct> {
  QueryBuilder<Allocations, Allocations, QDistinct> distinctByCreatedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdDate');
    });
  }

  QueryBuilder<Allocations, Allocations, QDistinct>
      distinctByLastAllocationDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastAllocationDate');
    });
  }

  QueryBuilder<Allocations, Allocations, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Allocations, Allocations, QDistinct> distinctByTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'total');
    });
  }

  QueryBuilder<Allocations, Allocations, QDistinct>
      distinctByTotalLastAllocation() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalLastAllocation');
    });
  }
}

extension AllocationsQueryProperty
    on QueryBuilder<Allocations, Allocations, QQueryProperty> {
  QueryBuilder<Allocations, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Allocations, DateTime?, QQueryOperations> createdDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdDate');
    });
  }

  QueryBuilder<Allocations, DateTime?, QQueryOperations>
      lastAllocationDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastAllocationDate');
    });
  }

  QueryBuilder<Allocations, String?, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<Allocations, double?, QQueryOperations> totalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'total');
    });
  }

  QueryBuilder<Allocations, double?, QQueryOperations>
      totalLastAllocationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalLastAllocation');
    });
  }
}
