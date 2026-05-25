// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $UserProfileCachesTable extends UserProfileCaches
    with TableInfo<$UserProfileCachesTable, UserProfileCache> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserProfileCachesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _firebaseIdMeta = const VerificationMeta(
    'firebaseId',
  );
  @override
  late final GeneratedColumn<String> firebaseId = GeneratedColumn<String>(
    'firebase_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ownerUserIdMeta = const VerificationMeta(
    'ownerUserId',
  );
  @override
  late final GeneratedColumn<String> ownerUserId = GeneratedColumn<String>(
    'owner_user_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
    'sync_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('local'),
  );
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _displayNameMeta = const VerificationMeta(
    'displayName',
  );
  @override
  late final GeneratedColumn<String> displayName = GeneratedColumn<String>(
    'display_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _preferredLanguageMeta = const VerificationMeta(
    'preferredLanguage',
  );
  @override
  late final GeneratedColumn<String> preferredLanguage =
      GeneratedColumn<String>(
        'preferred_language',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: const Constant('ar'),
      );
  @override
  List<GeneratedColumn> get $columns => [
    createdAt,
    updatedAt,
    deletedAt,
    firebaseId,
    ownerUserId,
    syncStatus,
    id,
    displayName,
    email,
    preferredLanguage,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_profile_caches';
  @override
  VerificationContext validateIntegrity(
    Insertable<UserProfileCache> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('firebase_id')) {
      context.handle(
        _firebaseIdMeta,
        firebaseId.isAcceptableOrUnknown(data['firebase_id']!, _firebaseIdMeta),
      );
    }
    if (data.containsKey('owner_user_id')) {
      context.handle(
        _ownerUserIdMeta,
        ownerUserId.isAcceptableOrUnknown(
          data['owner_user_id']!,
          _ownerUserIdMeta,
        ),
      );
    }
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('display_name')) {
      context.handle(
        _displayNameMeta,
        displayName.isAcceptableOrUnknown(
          data['display_name']!,
          _displayNameMeta,
        ),
      );
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    }
    if (data.containsKey('preferred_language')) {
      context.handle(
        _preferredLanguageMeta,
        preferredLanguage.isAcceptableOrUnknown(
          data['preferred_language']!,
          _preferredLanguageMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserProfileCache map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserProfileCache(
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      firebaseId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}firebase_id'],
      ),
      ownerUserId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}owner_user_id'],
      ),
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_status'],
      )!,
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      displayName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}display_name'],
      ),
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      ),
      preferredLanguage: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}preferred_language'],
      )!,
    );
  }

  @override
  $UserProfileCachesTable createAlias(String alias) {
    return $UserProfileCachesTable(attachedDatabase, alias);
  }
}

class UserProfileCache extends DataClass
    implements Insertable<UserProfileCache> {
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final String? firebaseId;
  final String? ownerUserId;
  final String syncStatus;
  final int id;
  final String? displayName;
  final String? email;
  final String preferredLanguage;
  const UserProfileCache({
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    this.firebaseId,
    this.ownerUserId,
    required this.syncStatus,
    required this.id,
    this.displayName,
    this.email,
    required this.preferredLanguage,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    if (!nullToAbsent || firebaseId != null) {
      map['firebase_id'] = Variable<String>(firebaseId);
    }
    if (!nullToAbsent || ownerUserId != null) {
      map['owner_user_id'] = Variable<String>(ownerUserId);
    }
    map['sync_status'] = Variable<String>(syncStatus);
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || displayName != null) {
      map['display_name'] = Variable<String>(displayName);
    }
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    map['preferred_language'] = Variable<String>(preferredLanguage);
    return map;
  }

  UserProfileCachesCompanion toCompanion(bool nullToAbsent) {
    return UserProfileCachesCompanion(
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      firebaseId: firebaseId == null && nullToAbsent
          ? const Value.absent()
          : Value(firebaseId),
      ownerUserId: ownerUserId == null && nullToAbsent
          ? const Value.absent()
          : Value(ownerUserId),
      syncStatus: Value(syncStatus),
      id: Value(id),
      displayName: displayName == null && nullToAbsent
          ? const Value.absent()
          : Value(displayName),
      email: email == null && nullToAbsent
          ? const Value.absent()
          : Value(email),
      preferredLanguage: Value(preferredLanguage),
    );
  }

  factory UserProfileCache.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserProfileCache(
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      firebaseId: serializer.fromJson<String?>(json['firebaseId']),
      ownerUserId: serializer.fromJson<String?>(json['ownerUserId']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
      id: serializer.fromJson<int>(json['id']),
      displayName: serializer.fromJson<String?>(json['displayName']),
      email: serializer.fromJson<String?>(json['email']),
      preferredLanguage: serializer.fromJson<String>(json['preferredLanguage']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'firebaseId': serializer.toJson<String?>(firebaseId),
      'ownerUserId': serializer.toJson<String?>(ownerUserId),
      'syncStatus': serializer.toJson<String>(syncStatus),
      'id': serializer.toJson<int>(id),
      'displayName': serializer.toJson<String?>(displayName),
      'email': serializer.toJson<String?>(email),
      'preferredLanguage': serializer.toJson<String>(preferredLanguage),
    };
  }

  UserProfileCache copyWith({
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    Value<String?> firebaseId = const Value.absent(),
    Value<String?> ownerUserId = const Value.absent(),
    String? syncStatus,
    int? id,
    Value<String?> displayName = const Value.absent(),
    Value<String?> email = const Value.absent(),
    String? preferredLanguage,
  }) => UserProfileCache(
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    firebaseId: firebaseId.present ? firebaseId.value : this.firebaseId,
    ownerUserId: ownerUserId.present ? ownerUserId.value : this.ownerUserId,
    syncStatus: syncStatus ?? this.syncStatus,
    id: id ?? this.id,
    displayName: displayName.present ? displayName.value : this.displayName,
    email: email.present ? email.value : this.email,
    preferredLanguage: preferredLanguage ?? this.preferredLanguage,
  );
  UserProfileCache copyWithCompanion(UserProfileCachesCompanion data) {
    return UserProfileCache(
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      firebaseId: data.firebaseId.present
          ? data.firebaseId.value
          : this.firebaseId,
      ownerUserId: data.ownerUserId.present
          ? data.ownerUserId.value
          : this.ownerUserId,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
      id: data.id.present ? data.id.value : this.id,
      displayName: data.displayName.present
          ? data.displayName.value
          : this.displayName,
      email: data.email.present ? data.email.value : this.email,
      preferredLanguage: data.preferredLanguage.present
          ? data.preferredLanguage.value
          : this.preferredLanguage,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserProfileCache(')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('firebaseId: $firebaseId, ')
          ..write('ownerUserId: $ownerUserId, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('id: $id, ')
          ..write('displayName: $displayName, ')
          ..write('email: $email, ')
          ..write('preferredLanguage: $preferredLanguage')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    createdAt,
    updatedAt,
    deletedAt,
    firebaseId,
    ownerUserId,
    syncStatus,
    id,
    displayName,
    email,
    preferredLanguage,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserProfileCache &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.firebaseId == this.firebaseId &&
          other.ownerUserId == this.ownerUserId &&
          other.syncStatus == this.syncStatus &&
          other.id == this.id &&
          other.displayName == this.displayName &&
          other.email == this.email &&
          other.preferredLanguage == this.preferredLanguage);
}

class UserProfileCachesCompanion extends UpdateCompanion<UserProfileCache> {
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<String?> firebaseId;
  final Value<String?> ownerUserId;
  final Value<String> syncStatus;
  final Value<int> id;
  final Value<String?> displayName;
  final Value<String?> email;
  final Value<String> preferredLanguage;
  const UserProfileCachesCompanion({
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.firebaseId = const Value.absent(),
    this.ownerUserId = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.id = const Value.absent(),
    this.displayName = const Value.absent(),
    this.email = const Value.absent(),
    this.preferredLanguage = const Value.absent(),
  });
  UserProfileCachesCompanion.insert({
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.firebaseId = const Value.absent(),
    this.ownerUserId = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.id = const Value.absent(),
    this.displayName = const Value.absent(),
    this.email = const Value.absent(),
    this.preferredLanguage = const Value.absent(),
  }) : createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<UserProfileCache> custom({
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<String>? firebaseId,
    Expression<String>? ownerUserId,
    Expression<String>? syncStatus,
    Expression<int>? id,
    Expression<String>? displayName,
    Expression<String>? email,
    Expression<String>? preferredLanguage,
  }) {
    return RawValuesInsertable({
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (firebaseId != null) 'firebase_id': firebaseId,
      if (ownerUserId != null) 'owner_user_id': ownerUserId,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (id != null) 'id': id,
      if (displayName != null) 'display_name': displayName,
      if (email != null) 'email': email,
      if (preferredLanguage != null) 'preferred_language': preferredLanguage,
    });
  }

  UserProfileCachesCompanion copyWith({
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<String?>? firebaseId,
    Value<String?>? ownerUserId,
    Value<String>? syncStatus,
    Value<int>? id,
    Value<String?>? displayName,
    Value<String?>? email,
    Value<String>? preferredLanguage,
  }) {
    return UserProfileCachesCompanion(
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      firebaseId: firebaseId ?? this.firebaseId,
      ownerUserId: ownerUserId ?? this.ownerUserId,
      syncStatus: syncStatus ?? this.syncStatus,
      id: id ?? this.id,
      displayName: displayName ?? this.displayName,
      email: email ?? this.email,
      preferredLanguage: preferredLanguage ?? this.preferredLanguage,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (firebaseId.present) {
      map['firebase_id'] = Variable<String>(firebaseId.value);
    }
    if (ownerUserId.present) {
      map['owner_user_id'] = Variable<String>(ownerUserId.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (displayName.present) {
      map['display_name'] = Variable<String>(displayName.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (preferredLanguage.present) {
      map['preferred_language'] = Variable<String>(preferredLanguage.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserProfileCachesCompanion(')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('firebaseId: $firebaseId, ')
          ..write('ownerUserId: $ownerUserId, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('id: $id, ')
          ..write('displayName: $displayName, ')
          ..write('email: $email, ')
          ..write('preferredLanguage: $preferredLanguage')
          ..write(')'))
        .toString();
  }
}

class $QuranChaptersCacheTable extends QuranChaptersCache
    with TableInfo<$QuranChaptersCacheTable, QuranChaptersCacheData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $QuranChaptersCacheTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _chapterNumberMeta = const VerificationMeta(
    'chapterNumber',
  );
  @override
  late final GeneratedColumn<int> chapterNumber = GeneratedColumn<int>(
    'chapter_number',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _nameArabicMeta = const VerificationMeta(
    'nameArabic',
  );
  @override
  late final GeneratedColumn<String> nameArabic = GeneratedColumn<String>(
    'name_arabic',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameEnglishMeta = const VerificationMeta(
    'nameEnglish',
  );
  @override
  late final GeneratedColumn<String> nameEnglish = GeneratedColumn<String>(
    'name_english',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _versesCountMeta = const VerificationMeta(
    'versesCount',
  );
  @override
  late final GeneratedColumn<int> versesCount = GeneratedColumn<int>(
    'verses_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sourceMeta = const VerificationMeta('source');
  @override
  late final GeneratedColumn<String> source = GeneratedColumn<String>(
    'source',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    createdAt,
    updatedAt,
    id,
    chapterNumber,
    nameArabic,
    nameEnglish,
    versesCount,
    source,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'quran_chapters_cache';
  @override
  VerificationContext validateIntegrity(
    Insertable<QuranChaptersCacheData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('chapter_number')) {
      context.handle(
        _chapterNumberMeta,
        chapterNumber.isAcceptableOrUnknown(
          data['chapter_number']!,
          _chapterNumberMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_chapterNumberMeta);
    }
    if (data.containsKey('name_arabic')) {
      context.handle(
        _nameArabicMeta,
        nameArabic.isAcceptableOrUnknown(data['name_arabic']!, _nameArabicMeta),
      );
    } else if (isInserting) {
      context.missing(_nameArabicMeta);
    }
    if (data.containsKey('name_english')) {
      context.handle(
        _nameEnglishMeta,
        nameEnglish.isAcceptableOrUnknown(
          data['name_english']!,
          _nameEnglishMeta,
        ),
      );
    }
    if (data.containsKey('verses_count')) {
      context.handle(
        _versesCountMeta,
        versesCount.isAcceptableOrUnknown(
          data['verses_count']!,
          _versesCountMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_versesCountMeta);
    }
    if (data.containsKey('source')) {
      context.handle(
        _sourceMeta,
        source.isAcceptableOrUnknown(data['source']!, _sourceMeta),
      );
    } else if (isInserting) {
      context.missing(_sourceMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  QuranChaptersCacheData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return QuranChaptersCacheData(
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      chapterNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}chapter_number'],
      )!,
      nameArabic: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name_arabic'],
      )!,
      nameEnglish: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name_english'],
      ),
      versesCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}verses_count'],
      )!,
      source: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source'],
      )!,
    );
  }

  @override
  $QuranChaptersCacheTable createAlias(String alias) {
    return $QuranChaptersCacheTable(attachedDatabase, alias);
  }
}

class QuranChaptersCacheData extends DataClass
    implements Insertable<QuranChaptersCacheData> {
  final DateTime createdAt;
  final DateTime updatedAt;
  final int id;
  final int chapterNumber;
  final String nameArabic;
  final String? nameEnglish;
  final int versesCount;
  final String source;
  const QuranChaptersCacheData({
    required this.createdAt,
    required this.updatedAt,
    required this.id,
    required this.chapterNumber,
    required this.nameArabic,
    this.nameEnglish,
    required this.versesCount,
    required this.source,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['id'] = Variable<int>(id);
    map['chapter_number'] = Variable<int>(chapterNumber);
    map['name_arabic'] = Variable<String>(nameArabic);
    if (!nullToAbsent || nameEnglish != null) {
      map['name_english'] = Variable<String>(nameEnglish);
    }
    map['verses_count'] = Variable<int>(versesCount);
    map['source'] = Variable<String>(source);
    return map;
  }

  QuranChaptersCacheCompanion toCompanion(bool nullToAbsent) {
    return QuranChaptersCacheCompanion(
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      id: Value(id),
      chapterNumber: Value(chapterNumber),
      nameArabic: Value(nameArabic),
      nameEnglish: nameEnglish == null && nullToAbsent
          ? const Value.absent()
          : Value(nameEnglish),
      versesCount: Value(versesCount),
      source: Value(source),
    );
  }

  factory QuranChaptersCacheData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return QuranChaptersCacheData(
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      id: serializer.fromJson<int>(json['id']),
      chapterNumber: serializer.fromJson<int>(json['chapterNumber']),
      nameArabic: serializer.fromJson<String>(json['nameArabic']),
      nameEnglish: serializer.fromJson<String?>(json['nameEnglish']),
      versesCount: serializer.fromJson<int>(json['versesCount']),
      source: serializer.fromJson<String>(json['source']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'id': serializer.toJson<int>(id),
      'chapterNumber': serializer.toJson<int>(chapterNumber),
      'nameArabic': serializer.toJson<String>(nameArabic),
      'nameEnglish': serializer.toJson<String?>(nameEnglish),
      'versesCount': serializer.toJson<int>(versesCount),
      'source': serializer.toJson<String>(source),
    };
  }

  QuranChaptersCacheData copyWith({
    DateTime? createdAt,
    DateTime? updatedAt,
    int? id,
    int? chapterNumber,
    String? nameArabic,
    Value<String?> nameEnglish = const Value.absent(),
    int? versesCount,
    String? source,
  }) => QuranChaptersCacheData(
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    id: id ?? this.id,
    chapterNumber: chapterNumber ?? this.chapterNumber,
    nameArabic: nameArabic ?? this.nameArabic,
    nameEnglish: nameEnglish.present ? nameEnglish.value : this.nameEnglish,
    versesCount: versesCount ?? this.versesCount,
    source: source ?? this.source,
  );
  QuranChaptersCacheData copyWithCompanion(QuranChaptersCacheCompanion data) {
    return QuranChaptersCacheData(
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      id: data.id.present ? data.id.value : this.id,
      chapterNumber: data.chapterNumber.present
          ? data.chapterNumber.value
          : this.chapterNumber,
      nameArabic: data.nameArabic.present
          ? data.nameArabic.value
          : this.nameArabic,
      nameEnglish: data.nameEnglish.present
          ? data.nameEnglish.value
          : this.nameEnglish,
      versesCount: data.versesCount.present
          ? data.versesCount.value
          : this.versesCount,
      source: data.source.present ? data.source.value : this.source,
    );
  }

  @override
  String toString() {
    return (StringBuffer('QuranChaptersCacheData(')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('id: $id, ')
          ..write('chapterNumber: $chapterNumber, ')
          ..write('nameArabic: $nameArabic, ')
          ..write('nameEnglish: $nameEnglish, ')
          ..write('versesCount: $versesCount, ')
          ..write('source: $source')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    createdAt,
    updatedAt,
    id,
    chapterNumber,
    nameArabic,
    nameEnglish,
    versesCount,
    source,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is QuranChaptersCacheData &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.id == this.id &&
          other.chapterNumber == this.chapterNumber &&
          other.nameArabic == this.nameArabic &&
          other.nameEnglish == this.nameEnglish &&
          other.versesCount == this.versesCount &&
          other.source == this.source);
}

class QuranChaptersCacheCompanion
    extends UpdateCompanion<QuranChaptersCacheData> {
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> id;
  final Value<int> chapterNumber;
  final Value<String> nameArabic;
  final Value<String?> nameEnglish;
  final Value<int> versesCount;
  final Value<String> source;
  const QuranChaptersCacheCompanion({
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.id = const Value.absent(),
    this.chapterNumber = const Value.absent(),
    this.nameArabic = const Value.absent(),
    this.nameEnglish = const Value.absent(),
    this.versesCount = const Value.absent(),
    this.source = const Value.absent(),
  });
  QuranChaptersCacheCompanion.insert({
    required DateTime createdAt,
    required DateTime updatedAt,
    this.id = const Value.absent(),
    required int chapterNumber,
    required String nameArabic,
    this.nameEnglish = const Value.absent(),
    required int versesCount,
    required String source,
  }) : createdAt = Value(createdAt),
       updatedAt = Value(updatedAt),
       chapterNumber = Value(chapterNumber),
       nameArabic = Value(nameArabic),
       versesCount = Value(versesCount),
       source = Value(source);
  static Insertable<QuranChaptersCacheData> custom({
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? id,
    Expression<int>? chapterNumber,
    Expression<String>? nameArabic,
    Expression<String>? nameEnglish,
    Expression<int>? versesCount,
    Expression<String>? source,
  }) {
    return RawValuesInsertable({
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (id != null) 'id': id,
      if (chapterNumber != null) 'chapter_number': chapterNumber,
      if (nameArabic != null) 'name_arabic': nameArabic,
      if (nameEnglish != null) 'name_english': nameEnglish,
      if (versesCount != null) 'verses_count': versesCount,
      if (source != null) 'source': source,
    });
  }

  QuranChaptersCacheCompanion copyWith({
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? id,
    Value<int>? chapterNumber,
    Value<String>? nameArabic,
    Value<String?>? nameEnglish,
    Value<int>? versesCount,
    Value<String>? source,
  }) {
    return QuranChaptersCacheCompanion(
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      id: id ?? this.id,
      chapterNumber: chapterNumber ?? this.chapterNumber,
      nameArabic: nameArabic ?? this.nameArabic,
      nameEnglish: nameEnglish ?? this.nameEnglish,
      versesCount: versesCount ?? this.versesCount,
      source: source ?? this.source,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (chapterNumber.present) {
      map['chapter_number'] = Variable<int>(chapterNumber.value);
    }
    if (nameArabic.present) {
      map['name_arabic'] = Variable<String>(nameArabic.value);
    }
    if (nameEnglish.present) {
      map['name_english'] = Variable<String>(nameEnglish.value);
    }
    if (versesCount.present) {
      map['verses_count'] = Variable<int>(versesCount.value);
    }
    if (source.present) {
      map['source'] = Variable<String>(source.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('QuranChaptersCacheCompanion(')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('id: $id, ')
          ..write('chapterNumber: $chapterNumber, ')
          ..write('nameArabic: $nameArabic, ')
          ..write('nameEnglish: $nameEnglish, ')
          ..write('versesCount: $versesCount, ')
          ..write('source: $source')
          ..write(')'))
        .toString();
  }
}

class $QuranVersesCacheTable extends QuranVersesCache
    with TableInfo<$QuranVersesCacheTable, QuranVersesCacheData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $QuranVersesCacheTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _chapterNumberMeta = const VerificationMeta(
    'chapterNumber',
  );
  @override
  late final GeneratedColumn<int> chapterNumber = GeneratedColumn<int>(
    'chapter_number',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _verseNumberMeta = const VerificationMeta(
    'verseNumber',
  );
  @override
  late final GeneratedColumn<int> verseNumber = GeneratedColumn<int>(
    'verse_number',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _verseKeyMeta = const VerificationMeta(
    'verseKey',
  );
  @override
  late final GeneratedColumn<String> verseKey = GeneratedColumn<String>(
    'verse_key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _textArabicMeta = const VerificationMeta(
    'textArabic',
  );
  @override
  late final GeneratedColumn<String> textArabic = GeneratedColumn<String>(
    'text_arabic',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _translationTextMeta = const VerificationMeta(
    'translationText',
  );
  @override
  late final GeneratedColumn<String> translationText = GeneratedColumn<String>(
    'translation_text',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _translationSourceMeta = const VerificationMeta(
    'translationSource',
  );
  @override
  late final GeneratedColumn<String> translationSource =
      GeneratedColumn<String>(
        'translation_source',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _sourceMeta = const VerificationMeta('source');
  @override
  late final GeneratedColumn<String> source = GeneratedColumn<String>(
    'source',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    createdAt,
    updatedAt,
    id,
    chapterNumber,
    verseNumber,
    verseKey,
    textArabic,
    translationText,
    translationSource,
    source,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'quran_verses_cache';
  @override
  VerificationContext validateIntegrity(
    Insertable<QuranVersesCacheData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('chapter_number')) {
      context.handle(
        _chapterNumberMeta,
        chapterNumber.isAcceptableOrUnknown(
          data['chapter_number']!,
          _chapterNumberMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_chapterNumberMeta);
    }
    if (data.containsKey('verse_number')) {
      context.handle(
        _verseNumberMeta,
        verseNumber.isAcceptableOrUnknown(
          data['verse_number']!,
          _verseNumberMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_verseNumberMeta);
    }
    if (data.containsKey('verse_key')) {
      context.handle(
        _verseKeyMeta,
        verseKey.isAcceptableOrUnknown(data['verse_key']!, _verseKeyMeta),
      );
    } else if (isInserting) {
      context.missing(_verseKeyMeta);
    }
    if (data.containsKey('text_arabic')) {
      context.handle(
        _textArabicMeta,
        textArabic.isAcceptableOrUnknown(data['text_arabic']!, _textArabicMeta),
      );
    } else if (isInserting) {
      context.missing(_textArabicMeta);
    }
    if (data.containsKey('translation_text')) {
      context.handle(
        _translationTextMeta,
        translationText.isAcceptableOrUnknown(
          data['translation_text']!,
          _translationTextMeta,
        ),
      );
    }
    if (data.containsKey('translation_source')) {
      context.handle(
        _translationSourceMeta,
        translationSource.isAcceptableOrUnknown(
          data['translation_source']!,
          _translationSourceMeta,
        ),
      );
    }
    if (data.containsKey('source')) {
      context.handle(
        _sourceMeta,
        source.isAcceptableOrUnknown(data['source']!, _sourceMeta),
      );
    } else if (isInserting) {
      context.missing(_sourceMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  QuranVersesCacheData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return QuranVersesCacheData(
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      chapterNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}chapter_number'],
      )!,
      verseNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}verse_number'],
      )!,
      verseKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}verse_key'],
      )!,
      textArabic: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}text_arabic'],
      )!,
      translationText: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}translation_text'],
      ),
      translationSource: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}translation_source'],
      ),
      source: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source'],
      )!,
    );
  }

  @override
  $QuranVersesCacheTable createAlias(String alias) {
    return $QuranVersesCacheTable(attachedDatabase, alias);
  }
}

class QuranVersesCacheData extends DataClass
    implements Insertable<QuranVersesCacheData> {
  final DateTime createdAt;
  final DateTime updatedAt;
  final int id;
  final int chapterNumber;
  final int verseNumber;
  final String verseKey;
  final String textArabic;
  final String? translationText;
  final String? translationSource;
  final String source;
  const QuranVersesCacheData({
    required this.createdAt,
    required this.updatedAt,
    required this.id,
    required this.chapterNumber,
    required this.verseNumber,
    required this.verseKey,
    required this.textArabic,
    this.translationText,
    this.translationSource,
    required this.source,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['id'] = Variable<int>(id);
    map['chapter_number'] = Variable<int>(chapterNumber);
    map['verse_number'] = Variable<int>(verseNumber);
    map['verse_key'] = Variable<String>(verseKey);
    map['text_arabic'] = Variable<String>(textArabic);
    if (!nullToAbsent || translationText != null) {
      map['translation_text'] = Variable<String>(translationText);
    }
    if (!nullToAbsent || translationSource != null) {
      map['translation_source'] = Variable<String>(translationSource);
    }
    map['source'] = Variable<String>(source);
    return map;
  }

  QuranVersesCacheCompanion toCompanion(bool nullToAbsent) {
    return QuranVersesCacheCompanion(
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      id: Value(id),
      chapterNumber: Value(chapterNumber),
      verseNumber: Value(verseNumber),
      verseKey: Value(verseKey),
      textArabic: Value(textArabic),
      translationText: translationText == null && nullToAbsent
          ? const Value.absent()
          : Value(translationText),
      translationSource: translationSource == null && nullToAbsent
          ? const Value.absent()
          : Value(translationSource),
      source: Value(source),
    );
  }

  factory QuranVersesCacheData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return QuranVersesCacheData(
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      id: serializer.fromJson<int>(json['id']),
      chapterNumber: serializer.fromJson<int>(json['chapterNumber']),
      verseNumber: serializer.fromJson<int>(json['verseNumber']),
      verseKey: serializer.fromJson<String>(json['verseKey']),
      textArabic: serializer.fromJson<String>(json['textArabic']),
      translationText: serializer.fromJson<String?>(json['translationText']),
      translationSource: serializer.fromJson<String?>(
        json['translationSource'],
      ),
      source: serializer.fromJson<String>(json['source']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'id': serializer.toJson<int>(id),
      'chapterNumber': serializer.toJson<int>(chapterNumber),
      'verseNumber': serializer.toJson<int>(verseNumber),
      'verseKey': serializer.toJson<String>(verseKey),
      'textArabic': serializer.toJson<String>(textArabic),
      'translationText': serializer.toJson<String?>(translationText),
      'translationSource': serializer.toJson<String?>(translationSource),
      'source': serializer.toJson<String>(source),
    };
  }

  QuranVersesCacheData copyWith({
    DateTime? createdAt,
    DateTime? updatedAt,
    int? id,
    int? chapterNumber,
    int? verseNumber,
    String? verseKey,
    String? textArabic,
    Value<String?> translationText = const Value.absent(),
    Value<String?> translationSource = const Value.absent(),
    String? source,
  }) => QuranVersesCacheData(
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    id: id ?? this.id,
    chapterNumber: chapterNumber ?? this.chapterNumber,
    verseNumber: verseNumber ?? this.verseNumber,
    verseKey: verseKey ?? this.verseKey,
    textArabic: textArabic ?? this.textArabic,
    translationText: translationText.present
        ? translationText.value
        : this.translationText,
    translationSource: translationSource.present
        ? translationSource.value
        : this.translationSource,
    source: source ?? this.source,
  );
  QuranVersesCacheData copyWithCompanion(QuranVersesCacheCompanion data) {
    return QuranVersesCacheData(
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      id: data.id.present ? data.id.value : this.id,
      chapterNumber: data.chapterNumber.present
          ? data.chapterNumber.value
          : this.chapterNumber,
      verseNumber: data.verseNumber.present
          ? data.verseNumber.value
          : this.verseNumber,
      verseKey: data.verseKey.present ? data.verseKey.value : this.verseKey,
      textArabic: data.textArabic.present
          ? data.textArabic.value
          : this.textArabic,
      translationText: data.translationText.present
          ? data.translationText.value
          : this.translationText,
      translationSource: data.translationSource.present
          ? data.translationSource.value
          : this.translationSource,
      source: data.source.present ? data.source.value : this.source,
    );
  }

  @override
  String toString() {
    return (StringBuffer('QuranVersesCacheData(')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('id: $id, ')
          ..write('chapterNumber: $chapterNumber, ')
          ..write('verseNumber: $verseNumber, ')
          ..write('verseKey: $verseKey, ')
          ..write('textArabic: $textArabic, ')
          ..write('translationText: $translationText, ')
          ..write('translationSource: $translationSource, ')
          ..write('source: $source')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    createdAt,
    updatedAt,
    id,
    chapterNumber,
    verseNumber,
    verseKey,
    textArabic,
    translationText,
    translationSource,
    source,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is QuranVersesCacheData &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.id == this.id &&
          other.chapterNumber == this.chapterNumber &&
          other.verseNumber == this.verseNumber &&
          other.verseKey == this.verseKey &&
          other.textArabic == this.textArabic &&
          other.translationText == this.translationText &&
          other.translationSource == this.translationSource &&
          other.source == this.source);
}

class QuranVersesCacheCompanion extends UpdateCompanion<QuranVersesCacheData> {
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> id;
  final Value<int> chapterNumber;
  final Value<int> verseNumber;
  final Value<String> verseKey;
  final Value<String> textArabic;
  final Value<String?> translationText;
  final Value<String?> translationSource;
  final Value<String> source;
  const QuranVersesCacheCompanion({
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.id = const Value.absent(),
    this.chapterNumber = const Value.absent(),
    this.verseNumber = const Value.absent(),
    this.verseKey = const Value.absent(),
    this.textArabic = const Value.absent(),
    this.translationText = const Value.absent(),
    this.translationSource = const Value.absent(),
    this.source = const Value.absent(),
  });
  QuranVersesCacheCompanion.insert({
    required DateTime createdAt,
    required DateTime updatedAt,
    this.id = const Value.absent(),
    required int chapterNumber,
    required int verseNumber,
    required String verseKey,
    required String textArabic,
    this.translationText = const Value.absent(),
    this.translationSource = const Value.absent(),
    required String source,
  }) : createdAt = Value(createdAt),
       updatedAt = Value(updatedAt),
       chapterNumber = Value(chapterNumber),
       verseNumber = Value(verseNumber),
       verseKey = Value(verseKey),
       textArabic = Value(textArabic),
       source = Value(source);
  static Insertable<QuranVersesCacheData> custom({
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? id,
    Expression<int>? chapterNumber,
    Expression<int>? verseNumber,
    Expression<String>? verseKey,
    Expression<String>? textArabic,
    Expression<String>? translationText,
    Expression<String>? translationSource,
    Expression<String>? source,
  }) {
    return RawValuesInsertable({
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (id != null) 'id': id,
      if (chapterNumber != null) 'chapter_number': chapterNumber,
      if (verseNumber != null) 'verse_number': verseNumber,
      if (verseKey != null) 'verse_key': verseKey,
      if (textArabic != null) 'text_arabic': textArabic,
      if (translationText != null) 'translation_text': translationText,
      if (translationSource != null) 'translation_source': translationSource,
      if (source != null) 'source': source,
    });
  }

  QuranVersesCacheCompanion copyWith({
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? id,
    Value<int>? chapterNumber,
    Value<int>? verseNumber,
    Value<String>? verseKey,
    Value<String>? textArabic,
    Value<String?>? translationText,
    Value<String?>? translationSource,
    Value<String>? source,
  }) {
    return QuranVersesCacheCompanion(
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      id: id ?? this.id,
      chapterNumber: chapterNumber ?? this.chapterNumber,
      verseNumber: verseNumber ?? this.verseNumber,
      verseKey: verseKey ?? this.verseKey,
      textArabic: textArabic ?? this.textArabic,
      translationText: translationText ?? this.translationText,
      translationSource: translationSource ?? this.translationSource,
      source: source ?? this.source,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (chapterNumber.present) {
      map['chapter_number'] = Variable<int>(chapterNumber.value);
    }
    if (verseNumber.present) {
      map['verse_number'] = Variable<int>(verseNumber.value);
    }
    if (verseKey.present) {
      map['verse_key'] = Variable<String>(verseKey.value);
    }
    if (textArabic.present) {
      map['text_arabic'] = Variable<String>(textArabic.value);
    }
    if (translationText.present) {
      map['translation_text'] = Variable<String>(translationText.value);
    }
    if (translationSource.present) {
      map['translation_source'] = Variable<String>(translationSource.value);
    }
    if (source.present) {
      map['source'] = Variable<String>(source.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('QuranVersesCacheCompanion(')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('id: $id, ')
          ..write('chapterNumber: $chapterNumber, ')
          ..write('verseNumber: $verseNumber, ')
          ..write('verseKey: $verseKey, ')
          ..write('textArabic: $textArabic, ')
          ..write('translationText: $translationText, ')
          ..write('translationSource: $translationSource, ')
          ..write('source: $source')
          ..write(')'))
        .toString();
  }
}

class $TafsirCachesTable extends TafsirCaches
    with TableInfo<$TafsirCachesTable, TafsirCache> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TafsirCachesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _verseKeyMeta = const VerificationMeta(
    'verseKey',
  );
  @override
  late final GeneratedColumn<String> verseKey = GeneratedColumn<String>(
    'verse_key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _tafsirIdMeta = const VerificationMeta(
    'tafsirId',
  );
  @override
  late final GeneratedColumn<String> tafsirId = GeneratedColumn<String>(
    'tafsir_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _languageCodeMeta = const VerificationMeta(
    'languageCode',
  );
  @override
  late final GeneratedColumn<String> languageCode = GeneratedColumn<String>(
    'language_code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _tafsirTextMeta = const VerificationMeta(
    'tafsirText',
  );
  @override
  late final GeneratedColumn<String> tafsirText = GeneratedColumn<String>(
    'tafsir_text',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sourceMeta = const VerificationMeta('source');
  @override
  late final GeneratedColumn<String> source = GeneratedColumn<String>(
    'source',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    createdAt,
    updatedAt,
    id,
    verseKey,
    tafsirId,
    languageCode,
    tafsirText,
    source,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tafsir_caches';
  @override
  VerificationContext validateIntegrity(
    Insertable<TafsirCache> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('verse_key')) {
      context.handle(
        _verseKeyMeta,
        verseKey.isAcceptableOrUnknown(data['verse_key']!, _verseKeyMeta),
      );
    } else if (isInserting) {
      context.missing(_verseKeyMeta);
    }
    if (data.containsKey('tafsir_id')) {
      context.handle(
        _tafsirIdMeta,
        tafsirId.isAcceptableOrUnknown(data['tafsir_id']!, _tafsirIdMeta),
      );
    } else if (isInserting) {
      context.missing(_tafsirIdMeta);
    }
    if (data.containsKey('language_code')) {
      context.handle(
        _languageCodeMeta,
        languageCode.isAcceptableOrUnknown(
          data['language_code']!,
          _languageCodeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_languageCodeMeta);
    }
    if (data.containsKey('tafsir_text')) {
      context.handle(
        _tafsirTextMeta,
        tafsirText.isAcceptableOrUnknown(data['tafsir_text']!, _tafsirTextMeta),
      );
    } else if (isInserting) {
      context.missing(_tafsirTextMeta);
    }
    if (data.containsKey('source')) {
      context.handle(
        _sourceMeta,
        source.isAcceptableOrUnknown(data['source']!, _sourceMeta),
      );
    } else if (isInserting) {
      context.missing(_sourceMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TafsirCache map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TafsirCache(
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      verseKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}verse_key'],
      )!,
      tafsirId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tafsir_id'],
      )!,
      languageCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}language_code'],
      )!,
      tafsirText: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tafsir_text'],
      )!,
      source: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source'],
      )!,
    );
  }

  @override
  $TafsirCachesTable createAlias(String alias) {
    return $TafsirCachesTable(attachedDatabase, alias);
  }
}

class TafsirCache extends DataClass implements Insertable<TafsirCache> {
  final DateTime createdAt;
  final DateTime updatedAt;
  final int id;
  final String verseKey;
  final String tafsirId;
  final String languageCode;
  final String tafsirText;
  final String source;
  const TafsirCache({
    required this.createdAt,
    required this.updatedAt,
    required this.id,
    required this.verseKey,
    required this.tafsirId,
    required this.languageCode,
    required this.tafsirText,
    required this.source,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['id'] = Variable<int>(id);
    map['verse_key'] = Variable<String>(verseKey);
    map['tafsir_id'] = Variable<String>(tafsirId);
    map['language_code'] = Variable<String>(languageCode);
    map['tafsir_text'] = Variable<String>(tafsirText);
    map['source'] = Variable<String>(source);
    return map;
  }

  TafsirCachesCompanion toCompanion(bool nullToAbsent) {
    return TafsirCachesCompanion(
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      id: Value(id),
      verseKey: Value(verseKey),
      tafsirId: Value(tafsirId),
      languageCode: Value(languageCode),
      tafsirText: Value(tafsirText),
      source: Value(source),
    );
  }

  factory TafsirCache.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TafsirCache(
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      id: serializer.fromJson<int>(json['id']),
      verseKey: serializer.fromJson<String>(json['verseKey']),
      tafsirId: serializer.fromJson<String>(json['tafsirId']),
      languageCode: serializer.fromJson<String>(json['languageCode']),
      tafsirText: serializer.fromJson<String>(json['tafsirText']),
      source: serializer.fromJson<String>(json['source']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'id': serializer.toJson<int>(id),
      'verseKey': serializer.toJson<String>(verseKey),
      'tafsirId': serializer.toJson<String>(tafsirId),
      'languageCode': serializer.toJson<String>(languageCode),
      'tafsirText': serializer.toJson<String>(tafsirText),
      'source': serializer.toJson<String>(source),
    };
  }

  TafsirCache copyWith({
    DateTime? createdAt,
    DateTime? updatedAt,
    int? id,
    String? verseKey,
    String? tafsirId,
    String? languageCode,
    String? tafsirText,
    String? source,
  }) => TafsirCache(
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    id: id ?? this.id,
    verseKey: verseKey ?? this.verseKey,
    tafsirId: tafsirId ?? this.tafsirId,
    languageCode: languageCode ?? this.languageCode,
    tafsirText: tafsirText ?? this.tafsirText,
    source: source ?? this.source,
  );
  TafsirCache copyWithCompanion(TafsirCachesCompanion data) {
    return TafsirCache(
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      id: data.id.present ? data.id.value : this.id,
      verseKey: data.verseKey.present ? data.verseKey.value : this.verseKey,
      tafsirId: data.tafsirId.present ? data.tafsirId.value : this.tafsirId,
      languageCode: data.languageCode.present
          ? data.languageCode.value
          : this.languageCode,
      tafsirText: data.tafsirText.present
          ? data.tafsirText.value
          : this.tafsirText,
      source: data.source.present ? data.source.value : this.source,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TafsirCache(')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('id: $id, ')
          ..write('verseKey: $verseKey, ')
          ..write('tafsirId: $tafsirId, ')
          ..write('languageCode: $languageCode, ')
          ..write('tafsirText: $tafsirText, ')
          ..write('source: $source')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    createdAt,
    updatedAt,
    id,
    verseKey,
    tafsirId,
    languageCode,
    tafsirText,
    source,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TafsirCache &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.id == this.id &&
          other.verseKey == this.verseKey &&
          other.tafsirId == this.tafsirId &&
          other.languageCode == this.languageCode &&
          other.tafsirText == this.tafsirText &&
          other.source == this.source);
}

class TafsirCachesCompanion extends UpdateCompanion<TafsirCache> {
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> id;
  final Value<String> verseKey;
  final Value<String> tafsirId;
  final Value<String> languageCode;
  final Value<String> tafsirText;
  final Value<String> source;
  const TafsirCachesCompanion({
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.id = const Value.absent(),
    this.verseKey = const Value.absent(),
    this.tafsirId = const Value.absent(),
    this.languageCode = const Value.absent(),
    this.tafsirText = const Value.absent(),
    this.source = const Value.absent(),
  });
  TafsirCachesCompanion.insert({
    required DateTime createdAt,
    required DateTime updatedAt,
    this.id = const Value.absent(),
    required String verseKey,
    required String tafsirId,
    required String languageCode,
    required String tafsirText,
    required String source,
  }) : createdAt = Value(createdAt),
       updatedAt = Value(updatedAt),
       verseKey = Value(verseKey),
       tafsirId = Value(tafsirId),
       languageCode = Value(languageCode),
       tafsirText = Value(tafsirText),
       source = Value(source);
  static Insertable<TafsirCache> custom({
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? id,
    Expression<String>? verseKey,
    Expression<String>? tafsirId,
    Expression<String>? languageCode,
    Expression<String>? tafsirText,
    Expression<String>? source,
  }) {
    return RawValuesInsertable({
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (id != null) 'id': id,
      if (verseKey != null) 'verse_key': verseKey,
      if (tafsirId != null) 'tafsir_id': tafsirId,
      if (languageCode != null) 'language_code': languageCode,
      if (tafsirText != null) 'tafsir_text': tafsirText,
      if (source != null) 'source': source,
    });
  }

  TafsirCachesCompanion copyWith({
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? id,
    Value<String>? verseKey,
    Value<String>? tafsirId,
    Value<String>? languageCode,
    Value<String>? tafsirText,
    Value<String>? source,
  }) {
    return TafsirCachesCompanion(
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      id: id ?? this.id,
      verseKey: verseKey ?? this.verseKey,
      tafsirId: tafsirId ?? this.tafsirId,
      languageCode: languageCode ?? this.languageCode,
      tafsirText: tafsirText ?? this.tafsirText,
      source: source ?? this.source,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (verseKey.present) {
      map['verse_key'] = Variable<String>(verseKey.value);
    }
    if (tafsirId.present) {
      map['tafsir_id'] = Variable<String>(tafsirId.value);
    }
    if (languageCode.present) {
      map['language_code'] = Variable<String>(languageCode.value);
    }
    if (tafsirText.present) {
      map['tafsir_text'] = Variable<String>(tafsirText.value);
    }
    if (source.present) {
      map['source'] = Variable<String>(source.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TafsirCachesCompanion(')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('id: $id, ')
          ..write('verseKey: $verseKey, ')
          ..write('tafsirId: $tafsirId, ')
          ..write('languageCode: $languageCode, ')
          ..write('tafsirText: $tafsirText, ')
          ..write('source: $source')
          ..write(')'))
        .toString();
  }
}

class $AudioCacheMetadataTable extends AudioCacheMetadata
    with TableInfo<$AudioCacheMetadataTable, AudioCacheMetadataData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AudioCacheMetadataTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _verseKeyMeta = const VerificationMeta(
    'verseKey',
  );
  @override
  late final GeneratedColumn<String> verseKey = GeneratedColumn<String>(
    'verse_key',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _reciterIdMeta = const VerificationMeta(
    'reciterId',
  );
  @override
  late final GeneratedColumn<String> reciterId = GeneratedColumn<String>(
    'reciter_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _remoteUrlMeta = const VerificationMeta(
    'remoteUrl',
  );
  @override
  late final GeneratedColumn<String> remoteUrl = GeneratedColumn<String>(
    'remote_url',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _localPathMeta = const VerificationMeta(
    'localPath',
  );
  @override
  late final GeneratedColumn<String> localPath = GeneratedColumn<String>(
    'local_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sourceMeta = const VerificationMeta('source');
  @override
  late final GeneratedColumn<String> source = GeneratedColumn<String>(
    'source',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isDownloadedMeta = const VerificationMeta(
    'isDownloaded',
  );
  @override
  late final GeneratedColumn<bool> isDownloaded = GeneratedColumn<bool>(
    'is_downloaded',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_downloaded" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    createdAt,
    updatedAt,
    id,
    verseKey,
    reciterId,
    remoteUrl,
    localPath,
    source,
    isDownloaded,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'audio_cache_metadata';
  @override
  VerificationContext validateIntegrity(
    Insertable<AudioCacheMetadataData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('verse_key')) {
      context.handle(
        _verseKeyMeta,
        verseKey.isAcceptableOrUnknown(data['verse_key']!, _verseKeyMeta),
      );
    }
    if (data.containsKey('reciter_id')) {
      context.handle(
        _reciterIdMeta,
        reciterId.isAcceptableOrUnknown(data['reciter_id']!, _reciterIdMeta),
      );
    } else if (isInserting) {
      context.missing(_reciterIdMeta);
    }
    if (data.containsKey('remote_url')) {
      context.handle(
        _remoteUrlMeta,
        remoteUrl.isAcceptableOrUnknown(data['remote_url']!, _remoteUrlMeta),
      );
    } else if (isInserting) {
      context.missing(_remoteUrlMeta);
    }
    if (data.containsKey('local_path')) {
      context.handle(
        _localPathMeta,
        localPath.isAcceptableOrUnknown(data['local_path']!, _localPathMeta),
      );
    }
    if (data.containsKey('source')) {
      context.handle(
        _sourceMeta,
        source.isAcceptableOrUnknown(data['source']!, _sourceMeta),
      );
    } else if (isInserting) {
      context.missing(_sourceMeta);
    }
    if (data.containsKey('is_downloaded')) {
      context.handle(
        _isDownloadedMeta,
        isDownloaded.isAcceptableOrUnknown(
          data['is_downloaded']!,
          _isDownloadedMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AudioCacheMetadataData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AudioCacheMetadataData(
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      verseKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}verse_key'],
      ),
      reciterId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}reciter_id'],
      )!,
      remoteUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}remote_url'],
      )!,
      localPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}local_path'],
      ),
      source: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source'],
      )!,
      isDownloaded: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_downloaded'],
      )!,
    );
  }

  @override
  $AudioCacheMetadataTable createAlias(String alias) {
    return $AudioCacheMetadataTable(attachedDatabase, alias);
  }
}

class AudioCacheMetadataData extends DataClass
    implements Insertable<AudioCacheMetadataData> {
  final DateTime createdAt;
  final DateTime updatedAt;
  final int id;
  final String? verseKey;
  final String reciterId;
  final String remoteUrl;
  final String? localPath;
  final String source;
  final bool isDownloaded;
  const AudioCacheMetadataData({
    required this.createdAt,
    required this.updatedAt,
    required this.id,
    this.verseKey,
    required this.reciterId,
    required this.remoteUrl,
    this.localPath,
    required this.source,
    required this.isDownloaded,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || verseKey != null) {
      map['verse_key'] = Variable<String>(verseKey);
    }
    map['reciter_id'] = Variable<String>(reciterId);
    map['remote_url'] = Variable<String>(remoteUrl);
    if (!nullToAbsent || localPath != null) {
      map['local_path'] = Variable<String>(localPath);
    }
    map['source'] = Variable<String>(source);
    map['is_downloaded'] = Variable<bool>(isDownloaded);
    return map;
  }

  AudioCacheMetadataCompanion toCompanion(bool nullToAbsent) {
    return AudioCacheMetadataCompanion(
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      id: Value(id),
      verseKey: verseKey == null && nullToAbsent
          ? const Value.absent()
          : Value(verseKey),
      reciterId: Value(reciterId),
      remoteUrl: Value(remoteUrl),
      localPath: localPath == null && nullToAbsent
          ? const Value.absent()
          : Value(localPath),
      source: Value(source),
      isDownloaded: Value(isDownloaded),
    );
  }

  factory AudioCacheMetadataData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AudioCacheMetadataData(
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      id: serializer.fromJson<int>(json['id']),
      verseKey: serializer.fromJson<String?>(json['verseKey']),
      reciterId: serializer.fromJson<String>(json['reciterId']),
      remoteUrl: serializer.fromJson<String>(json['remoteUrl']),
      localPath: serializer.fromJson<String?>(json['localPath']),
      source: serializer.fromJson<String>(json['source']),
      isDownloaded: serializer.fromJson<bool>(json['isDownloaded']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'id': serializer.toJson<int>(id),
      'verseKey': serializer.toJson<String?>(verseKey),
      'reciterId': serializer.toJson<String>(reciterId),
      'remoteUrl': serializer.toJson<String>(remoteUrl),
      'localPath': serializer.toJson<String?>(localPath),
      'source': serializer.toJson<String>(source),
      'isDownloaded': serializer.toJson<bool>(isDownloaded),
    };
  }

  AudioCacheMetadataData copyWith({
    DateTime? createdAt,
    DateTime? updatedAt,
    int? id,
    Value<String?> verseKey = const Value.absent(),
    String? reciterId,
    String? remoteUrl,
    Value<String?> localPath = const Value.absent(),
    String? source,
    bool? isDownloaded,
  }) => AudioCacheMetadataData(
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    id: id ?? this.id,
    verseKey: verseKey.present ? verseKey.value : this.verseKey,
    reciterId: reciterId ?? this.reciterId,
    remoteUrl: remoteUrl ?? this.remoteUrl,
    localPath: localPath.present ? localPath.value : this.localPath,
    source: source ?? this.source,
    isDownloaded: isDownloaded ?? this.isDownloaded,
  );
  AudioCacheMetadataData copyWithCompanion(AudioCacheMetadataCompanion data) {
    return AudioCacheMetadataData(
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      id: data.id.present ? data.id.value : this.id,
      verseKey: data.verseKey.present ? data.verseKey.value : this.verseKey,
      reciterId: data.reciterId.present ? data.reciterId.value : this.reciterId,
      remoteUrl: data.remoteUrl.present ? data.remoteUrl.value : this.remoteUrl,
      localPath: data.localPath.present ? data.localPath.value : this.localPath,
      source: data.source.present ? data.source.value : this.source,
      isDownloaded: data.isDownloaded.present
          ? data.isDownloaded.value
          : this.isDownloaded,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AudioCacheMetadataData(')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('id: $id, ')
          ..write('verseKey: $verseKey, ')
          ..write('reciterId: $reciterId, ')
          ..write('remoteUrl: $remoteUrl, ')
          ..write('localPath: $localPath, ')
          ..write('source: $source, ')
          ..write('isDownloaded: $isDownloaded')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    createdAt,
    updatedAt,
    id,
    verseKey,
    reciterId,
    remoteUrl,
    localPath,
    source,
    isDownloaded,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AudioCacheMetadataData &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.id == this.id &&
          other.verseKey == this.verseKey &&
          other.reciterId == this.reciterId &&
          other.remoteUrl == this.remoteUrl &&
          other.localPath == this.localPath &&
          other.source == this.source &&
          other.isDownloaded == this.isDownloaded);
}

class AudioCacheMetadataCompanion
    extends UpdateCompanion<AudioCacheMetadataData> {
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> id;
  final Value<String?> verseKey;
  final Value<String> reciterId;
  final Value<String> remoteUrl;
  final Value<String?> localPath;
  final Value<String> source;
  final Value<bool> isDownloaded;
  const AudioCacheMetadataCompanion({
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.id = const Value.absent(),
    this.verseKey = const Value.absent(),
    this.reciterId = const Value.absent(),
    this.remoteUrl = const Value.absent(),
    this.localPath = const Value.absent(),
    this.source = const Value.absent(),
    this.isDownloaded = const Value.absent(),
  });
  AudioCacheMetadataCompanion.insert({
    required DateTime createdAt,
    required DateTime updatedAt,
    this.id = const Value.absent(),
    this.verseKey = const Value.absent(),
    required String reciterId,
    required String remoteUrl,
    this.localPath = const Value.absent(),
    required String source,
    this.isDownloaded = const Value.absent(),
  }) : createdAt = Value(createdAt),
       updatedAt = Value(updatedAt),
       reciterId = Value(reciterId),
       remoteUrl = Value(remoteUrl),
       source = Value(source);
  static Insertable<AudioCacheMetadataData> custom({
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? id,
    Expression<String>? verseKey,
    Expression<String>? reciterId,
    Expression<String>? remoteUrl,
    Expression<String>? localPath,
    Expression<String>? source,
    Expression<bool>? isDownloaded,
  }) {
    return RawValuesInsertable({
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (id != null) 'id': id,
      if (verseKey != null) 'verse_key': verseKey,
      if (reciterId != null) 'reciter_id': reciterId,
      if (remoteUrl != null) 'remote_url': remoteUrl,
      if (localPath != null) 'local_path': localPath,
      if (source != null) 'source': source,
      if (isDownloaded != null) 'is_downloaded': isDownloaded,
    });
  }

  AudioCacheMetadataCompanion copyWith({
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? id,
    Value<String?>? verseKey,
    Value<String>? reciterId,
    Value<String>? remoteUrl,
    Value<String?>? localPath,
    Value<String>? source,
    Value<bool>? isDownloaded,
  }) {
    return AudioCacheMetadataCompanion(
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      id: id ?? this.id,
      verseKey: verseKey ?? this.verseKey,
      reciterId: reciterId ?? this.reciterId,
      remoteUrl: remoteUrl ?? this.remoteUrl,
      localPath: localPath ?? this.localPath,
      source: source ?? this.source,
      isDownloaded: isDownloaded ?? this.isDownloaded,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (verseKey.present) {
      map['verse_key'] = Variable<String>(verseKey.value);
    }
    if (reciterId.present) {
      map['reciter_id'] = Variable<String>(reciterId.value);
    }
    if (remoteUrl.present) {
      map['remote_url'] = Variable<String>(remoteUrl.value);
    }
    if (localPath.present) {
      map['local_path'] = Variable<String>(localPath.value);
    }
    if (source.present) {
      map['source'] = Variable<String>(source.value);
    }
    if (isDownloaded.present) {
      map['is_downloaded'] = Variable<bool>(isDownloaded.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AudioCacheMetadataCompanion(')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('id: $id, ')
          ..write('verseKey: $verseKey, ')
          ..write('reciterId: $reciterId, ')
          ..write('remoteUrl: $remoteUrl, ')
          ..write('localPath: $localPath, ')
          ..write('source: $source, ')
          ..write('isDownloaded: $isDownloaded')
          ..write(')'))
        .toString();
  }
}

class $QuranRecitersCacheTable extends QuranRecitersCache
    with TableInfo<$QuranRecitersCacheTable, QuranRecitersCacheData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $QuranRecitersCacheTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _reciterIdMeta = const VerificationMeta(
    'reciterId',
  );
  @override
  late final GeneratedColumn<String> reciterId = GeneratedColumn<String>(
    'reciter_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _nameArabicMeta = const VerificationMeta(
    'nameArabic',
  );
  @override
  late final GeneratedColumn<String> nameArabic = GeneratedColumn<String>(
    'name_arabic',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nameEnglishMeta = const VerificationMeta(
    'nameEnglish',
  );
  @override
  late final GeneratedColumn<String> nameEnglish = GeneratedColumn<String>(
    'name_english',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _styleMeta = const VerificationMeta('style');
  @override
  late final GeneratedColumn<String> style = GeneratedColumn<String>(
    'style',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sourceMeta = const VerificationMeta('source');
  @override
  late final GeneratedColumn<String> source = GeneratedColumn<String>(
    'source',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    createdAt,
    updatedAt,
    id,
    reciterId,
    nameArabic,
    nameEnglish,
    style,
    source,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'quran_reciters_cache';
  @override
  VerificationContext validateIntegrity(
    Insertable<QuranRecitersCacheData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('reciter_id')) {
      context.handle(
        _reciterIdMeta,
        reciterId.isAcceptableOrUnknown(data['reciter_id']!, _reciterIdMeta),
      );
    } else if (isInserting) {
      context.missing(_reciterIdMeta);
    }
    if (data.containsKey('name_arabic')) {
      context.handle(
        _nameArabicMeta,
        nameArabic.isAcceptableOrUnknown(data['name_arabic']!, _nameArabicMeta),
      );
    }
    if (data.containsKey('name_english')) {
      context.handle(
        _nameEnglishMeta,
        nameEnglish.isAcceptableOrUnknown(
          data['name_english']!,
          _nameEnglishMeta,
        ),
      );
    }
    if (data.containsKey('style')) {
      context.handle(
        _styleMeta,
        style.isAcceptableOrUnknown(data['style']!, _styleMeta),
      );
    }
    if (data.containsKey('source')) {
      context.handle(
        _sourceMeta,
        source.isAcceptableOrUnknown(data['source']!, _sourceMeta),
      );
    } else if (isInserting) {
      context.missing(_sourceMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  QuranRecitersCacheData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return QuranRecitersCacheData(
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      reciterId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}reciter_id'],
      )!,
      nameArabic: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name_arabic'],
      ),
      nameEnglish: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name_english'],
      ),
      style: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}style'],
      ),
      source: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source'],
      )!,
    );
  }

  @override
  $QuranRecitersCacheTable createAlias(String alias) {
    return $QuranRecitersCacheTable(attachedDatabase, alias);
  }
}

class QuranRecitersCacheData extends DataClass
    implements Insertable<QuranRecitersCacheData> {
  final DateTime createdAt;
  final DateTime updatedAt;
  final int id;
  final String reciterId;
  final String? nameArabic;
  final String? nameEnglish;
  final String? style;
  final String source;
  const QuranRecitersCacheData({
    required this.createdAt,
    required this.updatedAt,
    required this.id,
    required this.reciterId,
    this.nameArabic,
    this.nameEnglish,
    this.style,
    required this.source,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['id'] = Variable<int>(id);
    map['reciter_id'] = Variable<String>(reciterId);
    if (!nullToAbsent || nameArabic != null) {
      map['name_arabic'] = Variable<String>(nameArabic);
    }
    if (!nullToAbsent || nameEnglish != null) {
      map['name_english'] = Variable<String>(nameEnglish);
    }
    if (!nullToAbsent || style != null) {
      map['style'] = Variable<String>(style);
    }
    map['source'] = Variable<String>(source);
    return map;
  }

  QuranRecitersCacheCompanion toCompanion(bool nullToAbsent) {
    return QuranRecitersCacheCompanion(
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      id: Value(id),
      reciterId: Value(reciterId),
      nameArabic: nameArabic == null && nullToAbsent
          ? const Value.absent()
          : Value(nameArabic),
      nameEnglish: nameEnglish == null && nullToAbsent
          ? const Value.absent()
          : Value(nameEnglish),
      style: style == null && nullToAbsent
          ? const Value.absent()
          : Value(style),
      source: Value(source),
    );
  }

  factory QuranRecitersCacheData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return QuranRecitersCacheData(
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      id: serializer.fromJson<int>(json['id']),
      reciterId: serializer.fromJson<String>(json['reciterId']),
      nameArabic: serializer.fromJson<String?>(json['nameArabic']),
      nameEnglish: serializer.fromJson<String?>(json['nameEnglish']),
      style: serializer.fromJson<String?>(json['style']),
      source: serializer.fromJson<String>(json['source']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'id': serializer.toJson<int>(id),
      'reciterId': serializer.toJson<String>(reciterId),
      'nameArabic': serializer.toJson<String?>(nameArabic),
      'nameEnglish': serializer.toJson<String?>(nameEnglish),
      'style': serializer.toJson<String?>(style),
      'source': serializer.toJson<String>(source),
    };
  }

  QuranRecitersCacheData copyWith({
    DateTime? createdAt,
    DateTime? updatedAt,
    int? id,
    String? reciterId,
    Value<String?> nameArabic = const Value.absent(),
    Value<String?> nameEnglish = const Value.absent(),
    Value<String?> style = const Value.absent(),
    String? source,
  }) => QuranRecitersCacheData(
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    id: id ?? this.id,
    reciterId: reciterId ?? this.reciterId,
    nameArabic: nameArabic.present ? nameArabic.value : this.nameArabic,
    nameEnglish: nameEnglish.present ? nameEnglish.value : this.nameEnglish,
    style: style.present ? style.value : this.style,
    source: source ?? this.source,
  );
  QuranRecitersCacheData copyWithCompanion(QuranRecitersCacheCompanion data) {
    return QuranRecitersCacheData(
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      id: data.id.present ? data.id.value : this.id,
      reciterId: data.reciterId.present ? data.reciterId.value : this.reciterId,
      nameArabic: data.nameArabic.present
          ? data.nameArabic.value
          : this.nameArabic,
      nameEnglish: data.nameEnglish.present
          ? data.nameEnglish.value
          : this.nameEnglish,
      style: data.style.present ? data.style.value : this.style,
      source: data.source.present ? data.source.value : this.source,
    );
  }

  @override
  String toString() {
    return (StringBuffer('QuranRecitersCacheData(')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('id: $id, ')
          ..write('reciterId: $reciterId, ')
          ..write('nameArabic: $nameArabic, ')
          ..write('nameEnglish: $nameEnglish, ')
          ..write('style: $style, ')
          ..write('source: $source')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    createdAt,
    updatedAt,
    id,
    reciterId,
    nameArabic,
    nameEnglish,
    style,
    source,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is QuranRecitersCacheData &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.id == this.id &&
          other.reciterId == this.reciterId &&
          other.nameArabic == this.nameArabic &&
          other.nameEnglish == this.nameEnglish &&
          other.style == this.style &&
          other.source == this.source);
}

class QuranRecitersCacheCompanion
    extends UpdateCompanion<QuranRecitersCacheData> {
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> id;
  final Value<String> reciterId;
  final Value<String?> nameArabic;
  final Value<String?> nameEnglish;
  final Value<String?> style;
  final Value<String> source;
  const QuranRecitersCacheCompanion({
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.id = const Value.absent(),
    this.reciterId = const Value.absent(),
    this.nameArabic = const Value.absent(),
    this.nameEnglish = const Value.absent(),
    this.style = const Value.absent(),
    this.source = const Value.absent(),
  });
  QuranRecitersCacheCompanion.insert({
    required DateTime createdAt,
    required DateTime updatedAt,
    this.id = const Value.absent(),
    required String reciterId,
    this.nameArabic = const Value.absent(),
    this.nameEnglish = const Value.absent(),
    this.style = const Value.absent(),
    required String source,
  }) : createdAt = Value(createdAt),
       updatedAt = Value(updatedAt),
       reciterId = Value(reciterId),
       source = Value(source);
  static Insertable<QuranRecitersCacheData> custom({
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? id,
    Expression<String>? reciterId,
    Expression<String>? nameArabic,
    Expression<String>? nameEnglish,
    Expression<String>? style,
    Expression<String>? source,
  }) {
    return RawValuesInsertable({
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (id != null) 'id': id,
      if (reciterId != null) 'reciter_id': reciterId,
      if (nameArabic != null) 'name_arabic': nameArabic,
      if (nameEnglish != null) 'name_english': nameEnglish,
      if (style != null) 'style': style,
      if (source != null) 'source': source,
    });
  }

  QuranRecitersCacheCompanion copyWith({
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? id,
    Value<String>? reciterId,
    Value<String?>? nameArabic,
    Value<String?>? nameEnglish,
    Value<String?>? style,
    Value<String>? source,
  }) {
    return QuranRecitersCacheCompanion(
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      id: id ?? this.id,
      reciterId: reciterId ?? this.reciterId,
      nameArabic: nameArabic ?? this.nameArabic,
      nameEnglish: nameEnglish ?? this.nameEnglish,
      style: style ?? this.style,
      source: source ?? this.source,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (reciterId.present) {
      map['reciter_id'] = Variable<String>(reciterId.value);
    }
    if (nameArabic.present) {
      map['name_arabic'] = Variable<String>(nameArabic.value);
    }
    if (nameEnglish.present) {
      map['name_english'] = Variable<String>(nameEnglish.value);
    }
    if (style.present) {
      map['style'] = Variable<String>(style.value);
    }
    if (source.present) {
      map['source'] = Variable<String>(source.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('QuranRecitersCacheCompanion(')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('id: $id, ')
          ..write('reciterId: $reciterId, ')
          ..write('nameArabic: $nameArabic, ')
          ..write('nameEnglish: $nameEnglish, ')
          ..write('style: $style, ')
          ..write('source: $source')
          ..write(')'))
        .toString();
  }
}

class $DailyAyahHistoryTable extends DailyAyahHistory
    with TableInfo<$DailyAyahHistoryTable, DailyAyahHistoryData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DailyAyahHistoryTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _firebaseIdMeta = const VerificationMeta(
    'firebaseId',
  );
  @override
  late final GeneratedColumn<String> firebaseId = GeneratedColumn<String>(
    'firebase_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ownerUserIdMeta = const VerificationMeta(
    'ownerUserId',
  );
  @override
  late final GeneratedColumn<String> ownerUserId = GeneratedColumn<String>(
    'owner_user_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
    'sync_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('local'),
  );
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _verseKeyMeta = const VerificationMeta(
    'verseKey',
  );
  @override
  late final GeneratedColumn<String> verseKey = GeneratedColumn<String>(
    'verse_key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _selectedDateMeta = const VerificationMeta(
    'selectedDate',
  );
  @override
  late final GeneratedColumn<DateTime> selectedDate = GeneratedColumn<DateTime>(
    'selected_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _wasReadMeta = const VerificationMeta(
    'wasRead',
  );
  @override
  late final GeneratedColumn<bool> wasRead = GeneratedColumn<bool>(
    'was_read',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("was_read" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    createdAt,
    updatedAt,
    deletedAt,
    firebaseId,
    ownerUserId,
    syncStatus,
    id,
    verseKey,
    selectedDate,
    wasRead,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'daily_ayah_history';
  @override
  VerificationContext validateIntegrity(
    Insertable<DailyAyahHistoryData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('firebase_id')) {
      context.handle(
        _firebaseIdMeta,
        firebaseId.isAcceptableOrUnknown(data['firebase_id']!, _firebaseIdMeta),
      );
    }
    if (data.containsKey('owner_user_id')) {
      context.handle(
        _ownerUserIdMeta,
        ownerUserId.isAcceptableOrUnknown(
          data['owner_user_id']!,
          _ownerUserIdMeta,
        ),
      );
    }
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('verse_key')) {
      context.handle(
        _verseKeyMeta,
        verseKey.isAcceptableOrUnknown(data['verse_key']!, _verseKeyMeta),
      );
    } else if (isInserting) {
      context.missing(_verseKeyMeta);
    }
    if (data.containsKey('selected_date')) {
      context.handle(
        _selectedDateMeta,
        selectedDate.isAcceptableOrUnknown(
          data['selected_date']!,
          _selectedDateMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_selectedDateMeta);
    }
    if (data.containsKey('was_read')) {
      context.handle(
        _wasReadMeta,
        wasRead.isAcceptableOrUnknown(data['was_read']!, _wasReadMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DailyAyahHistoryData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DailyAyahHistoryData(
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      firebaseId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}firebase_id'],
      ),
      ownerUserId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}owner_user_id'],
      ),
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_status'],
      )!,
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      verseKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}verse_key'],
      )!,
      selectedDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}selected_date'],
      )!,
      wasRead: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}was_read'],
      )!,
    );
  }

  @override
  $DailyAyahHistoryTable createAlias(String alias) {
    return $DailyAyahHistoryTable(attachedDatabase, alias);
  }
}

class DailyAyahHistoryData extends DataClass
    implements Insertable<DailyAyahHistoryData> {
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final String? firebaseId;
  final String? ownerUserId;
  final String syncStatus;
  final int id;
  final String verseKey;
  final DateTime selectedDate;
  final bool wasRead;
  const DailyAyahHistoryData({
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    this.firebaseId,
    this.ownerUserId,
    required this.syncStatus,
    required this.id,
    required this.verseKey,
    required this.selectedDate,
    required this.wasRead,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    if (!nullToAbsent || firebaseId != null) {
      map['firebase_id'] = Variable<String>(firebaseId);
    }
    if (!nullToAbsent || ownerUserId != null) {
      map['owner_user_id'] = Variable<String>(ownerUserId);
    }
    map['sync_status'] = Variable<String>(syncStatus);
    map['id'] = Variable<int>(id);
    map['verse_key'] = Variable<String>(verseKey);
    map['selected_date'] = Variable<DateTime>(selectedDate);
    map['was_read'] = Variable<bool>(wasRead);
    return map;
  }

  DailyAyahHistoryCompanion toCompanion(bool nullToAbsent) {
    return DailyAyahHistoryCompanion(
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      firebaseId: firebaseId == null && nullToAbsent
          ? const Value.absent()
          : Value(firebaseId),
      ownerUserId: ownerUserId == null && nullToAbsent
          ? const Value.absent()
          : Value(ownerUserId),
      syncStatus: Value(syncStatus),
      id: Value(id),
      verseKey: Value(verseKey),
      selectedDate: Value(selectedDate),
      wasRead: Value(wasRead),
    );
  }

  factory DailyAyahHistoryData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DailyAyahHistoryData(
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      firebaseId: serializer.fromJson<String?>(json['firebaseId']),
      ownerUserId: serializer.fromJson<String?>(json['ownerUserId']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
      id: serializer.fromJson<int>(json['id']),
      verseKey: serializer.fromJson<String>(json['verseKey']),
      selectedDate: serializer.fromJson<DateTime>(json['selectedDate']),
      wasRead: serializer.fromJson<bool>(json['wasRead']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'firebaseId': serializer.toJson<String?>(firebaseId),
      'ownerUserId': serializer.toJson<String?>(ownerUserId),
      'syncStatus': serializer.toJson<String>(syncStatus),
      'id': serializer.toJson<int>(id),
      'verseKey': serializer.toJson<String>(verseKey),
      'selectedDate': serializer.toJson<DateTime>(selectedDate),
      'wasRead': serializer.toJson<bool>(wasRead),
    };
  }

  DailyAyahHistoryData copyWith({
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    Value<String?> firebaseId = const Value.absent(),
    Value<String?> ownerUserId = const Value.absent(),
    String? syncStatus,
    int? id,
    String? verseKey,
    DateTime? selectedDate,
    bool? wasRead,
  }) => DailyAyahHistoryData(
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    firebaseId: firebaseId.present ? firebaseId.value : this.firebaseId,
    ownerUserId: ownerUserId.present ? ownerUserId.value : this.ownerUserId,
    syncStatus: syncStatus ?? this.syncStatus,
    id: id ?? this.id,
    verseKey: verseKey ?? this.verseKey,
    selectedDate: selectedDate ?? this.selectedDate,
    wasRead: wasRead ?? this.wasRead,
  );
  DailyAyahHistoryData copyWithCompanion(DailyAyahHistoryCompanion data) {
    return DailyAyahHistoryData(
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      firebaseId: data.firebaseId.present
          ? data.firebaseId.value
          : this.firebaseId,
      ownerUserId: data.ownerUserId.present
          ? data.ownerUserId.value
          : this.ownerUserId,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
      id: data.id.present ? data.id.value : this.id,
      verseKey: data.verseKey.present ? data.verseKey.value : this.verseKey,
      selectedDate: data.selectedDate.present
          ? data.selectedDate.value
          : this.selectedDate,
      wasRead: data.wasRead.present ? data.wasRead.value : this.wasRead,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DailyAyahHistoryData(')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('firebaseId: $firebaseId, ')
          ..write('ownerUserId: $ownerUserId, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('id: $id, ')
          ..write('verseKey: $verseKey, ')
          ..write('selectedDate: $selectedDate, ')
          ..write('wasRead: $wasRead')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    createdAt,
    updatedAt,
    deletedAt,
    firebaseId,
    ownerUserId,
    syncStatus,
    id,
    verseKey,
    selectedDate,
    wasRead,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DailyAyahHistoryData &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.firebaseId == this.firebaseId &&
          other.ownerUserId == this.ownerUserId &&
          other.syncStatus == this.syncStatus &&
          other.id == this.id &&
          other.verseKey == this.verseKey &&
          other.selectedDate == this.selectedDate &&
          other.wasRead == this.wasRead);
}

class DailyAyahHistoryCompanion extends UpdateCompanion<DailyAyahHistoryData> {
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<String?> firebaseId;
  final Value<String?> ownerUserId;
  final Value<String> syncStatus;
  final Value<int> id;
  final Value<String> verseKey;
  final Value<DateTime> selectedDate;
  final Value<bool> wasRead;
  const DailyAyahHistoryCompanion({
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.firebaseId = const Value.absent(),
    this.ownerUserId = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.id = const Value.absent(),
    this.verseKey = const Value.absent(),
    this.selectedDate = const Value.absent(),
    this.wasRead = const Value.absent(),
  });
  DailyAyahHistoryCompanion.insert({
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.firebaseId = const Value.absent(),
    this.ownerUserId = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.id = const Value.absent(),
    required String verseKey,
    required DateTime selectedDate,
    this.wasRead = const Value.absent(),
  }) : createdAt = Value(createdAt),
       updatedAt = Value(updatedAt),
       verseKey = Value(verseKey),
       selectedDate = Value(selectedDate);
  static Insertable<DailyAyahHistoryData> custom({
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<String>? firebaseId,
    Expression<String>? ownerUserId,
    Expression<String>? syncStatus,
    Expression<int>? id,
    Expression<String>? verseKey,
    Expression<DateTime>? selectedDate,
    Expression<bool>? wasRead,
  }) {
    return RawValuesInsertable({
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (firebaseId != null) 'firebase_id': firebaseId,
      if (ownerUserId != null) 'owner_user_id': ownerUserId,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (id != null) 'id': id,
      if (verseKey != null) 'verse_key': verseKey,
      if (selectedDate != null) 'selected_date': selectedDate,
      if (wasRead != null) 'was_read': wasRead,
    });
  }

  DailyAyahHistoryCompanion copyWith({
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<String?>? firebaseId,
    Value<String?>? ownerUserId,
    Value<String>? syncStatus,
    Value<int>? id,
    Value<String>? verseKey,
    Value<DateTime>? selectedDate,
    Value<bool>? wasRead,
  }) {
    return DailyAyahHistoryCompanion(
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      firebaseId: firebaseId ?? this.firebaseId,
      ownerUserId: ownerUserId ?? this.ownerUserId,
      syncStatus: syncStatus ?? this.syncStatus,
      id: id ?? this.id,
      verseKey: verseKey ?? this.verseKey,
      selectedDate: selectedDate ?? this.selectedDate,
      wasRead: wasRead ?? this.wasRead,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (firebaseId.present) {
      map['firebase_id'] = Variable<String>(firebaseId.value);
    }
    if (ownerUserId.present) {
      map['owner_user_id'] = Variable<String>(ownerUserId.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (verseKey.present) {
      map['verse_key'] = Variable<String>(verseKey.value);
    }
    if (selectedDate.present) {
      map['selected_date'] = Variable<DateTime>(selectedDate.value);
    }
    if (wasRead.present) {
      map['was_read'] = Variable<bool>(wasRead.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DailyAyahHistoryCompanion(')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('firebaseId: $firebaseId, ')
          ..write('ownerUserId: $ownerUserId, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('id: $id, ')
          ..write('verseKey: $verseKey, ')
          ..write('selectedDate: $selectedDate, ')
          ..write('wasRead: $wasRead')
          ..write(')'))
        .toString();
  }
}

class $ReadingProgressTable extends ReadingProgress
    with TableInfo<$ReadingProgressTable, ReadingProgressData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ReadingProgressTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _firebaseIdMeta = const VerificationMeta(
    'firebaseId',
  );
  @override
  late final GeneratedColumn<String> firebaseId = GeneratedColumn<String>(
    'firebase_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ownerUserIdMeta = const VerificationMeta(
    'ownerUserId',
  );
  @override
  late final GeneratedColumn<String> ownerUserId = GeneratedColumn<String>(
    'owner_user_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
    'sync_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('local'),
  );
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _verseKeyMeta = const VerificationMeta(
    'verseKey',
  );
  @override
  late final GeneratedColumn<String> verseKey = GeneratedColumn<String>(
    'verse_key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _chapterNumberMeta = const VerificationMeta(
    'chapterNumber',
  );
  @override
  late final GeneratedColumn<int> chapterNumber = GeneratedColumn<int>(
    'chapter_number',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _verseNumberMeta = const VerificationMeta(
    'verseNumber',
  );
  @override
  late final GeneratedColumn<int> verseNumber = GeneratedColumn<int>(
    'verse_number',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lastReadAtMeta = const VerificationMeta(
    'lastReadAt',
  );
  @override
  late final GeneratedColumn<DateTime> lastReadAt = GeneratedColumn<DateTime>(
    'last_read_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    createdAt,
    updatedAt,
    deletedAt,
    firebaseId,
    ownerUserId,
    syncStatus,
    id,
    verseKey,
    chapterNumber,
    verseNumber,
    lastReadAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'reading_progress';
  @override
  VerificationContext validateIntegrity(
    Insertable<ReadingProgressData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('firebase_id')) {
      context.handle(
        _firebaseIdMeta,
        firebaseId.isAcceptableOrUnknown(data['firebase_id']!, _firebaseIdMeta),
      );
    }
    if (data.containsKey('owner_user_id')) {
      context.handle(
        _ownerUserIdMeta,
        ownerUserId.isAcceptableOrUnknown(
          data['owner_user_id']!,
          _ownerUserIdMeta,
        ),
      );
    }
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('verse_key')) {
      context.handle(
        _verseKeyMeta,
        verseKey.isAcceptableOrUnknown(data['verse_key']!, _verseKeyMeta),
      );
    } else if (isInserting) {
      context.missing(_verseKeyMeta);
    }
    if (data.containsKey('chapter_number')) {
      context.handle(
        _chapterNumberMeta,
        chapterNumber.isAcceptableOrUnknown(
          data['chapter_number']!,
          _chapterNumberMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_chapterNumberMeta);
    }
    if (data.containsKey('verse_number')) {
      context.handle(
        _verseNumberMeta,
        verseNumber.isAcceptableOrUnknown(
          data['verse_number']!,
          _verseNumberMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_verseNumberMeta);
    }
    if (data.containsKey('last_read_at')) {
      context.handle(
        _lastReadAtMeta,
        lastReadAt.isAcceptableOrUnknown(
          data['last_read_at']!,
          _lastReadAtMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ReadingProgressData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ReadingProgressData(
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      firebaseId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}firebase_id'],
      ),
      ownerUserId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}owner_user_id'],
      ),
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_status'],
      )!,
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      verseKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}verse_key'],
      )!,
      chapterNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}chapter_number'],
      )!,
      verseNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}verse_number'],
      )!,
      lastReadAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_read_at'],
      ),
    );
  }

  @override
  $ReadingProgressTable createAlias(String alias) {
    return $ReadingProgressTable(attachedDatabase, alias);
  }
}

class ReadingProgressData extends DataClass
    implements Insertable<ReadingProgressData> {
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final String? firebaseId;
  final String? ownerUserId;
  final String syncStatus;
  final int id;
  final String verseKey;
  final int chapterNumber;
  final int verseNumber;
  final DateTime? lastReadAt;
  const ReadingProgressData({
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    this.firebaseId,
    this.ownerUserId,
    required this.syncStatus,
    required this.id,
    required this.verseKey,
    required this.chapterNumber,
    required this.verseNumber,
    this.lastReadAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    if (!nullToAbsent || firebaseId != null) {
      map['firebase_id'] = Variable<String>(firebaseId);
    }
    if (!nullToAbsent || ownerUserId != null) {
      map['owner_user_id'] = Variable<String>(ownerUserId);
    }
    map['sync_status'] = Variable<String>(syncStatus);
    map['id'] = Variable<int>(id);
    map['verse_key'] = Variable<String>(verseKey);
    map['chapter_number'] = Variable<int>(chapterNumber);
    map['verse_number'] = Variable<int>(verseNumber);
    if (!nullToAbsent || lastReadAt != null) {
      map['last_read_at'] = Variable<DateTime>(lastReadAt);
    }
    return map;
  }

  ReadingProgressCompanion toCompanion(bool nullToAbsent) {
    return ReadingProgressCompanion(
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      firebaseId: firebaseId == null && nullToAbsent
          ? const Value.absent()
          : Value(firebaseId),
      ownerUserId: ownerUserId == null && nullToAbsent
          ? const Value.absent()
          : Value(ownerUserId),
      syncStatus: Value(syncStatus),
      id: Value(id),
      verseKey: Value(verseKey),
      chapterNumber: Value(chapterNumber),
      verseNumber: Value(verseNumber),
      lastReadAt: lastReadAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastReadAt),
    );
  }

  factory ReadingProgressData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ReadingProgressData(
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      firebaseId: serializer.fromJson<String?>(json['firebaseId']),
      ownerUserId: serializer.fromJson<String?>(json['ownerUserId']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
      id: serializer.fromJson<int>(json['id']),
      verseKey: serializer.fromJson<String>(json['verseKey']),
      chapterNumber: serializer.fromJson<int>(json['chapterNumber']),
      verseNumber: serializer.fromJson<int>(json['verseNumber']),
      lastReadAt: serializer.fromJson<DateTime?>(json['lastReadAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'firebaseId': serializer.toJson<String?>(firebaseId),
      'ownerUserId': serializer.toJson<String?>(ownerUserId),
      'syncStatus': serializer.toJson<String>(syncStatus),
      'id': serializer.toJson<int>(id),
      'verseKey': serializer.toJson<String>(verseKey),
      'chapterNumber': serializer.toJson<int>(chapterNumber),
      'verseNumber': serializer.toJson<int>(verseNumber),
      'lastReadAt': serializer.toJson<DateTime?>(lastReadAt),
    };
  }

  ReadingProgressData copyWith({
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    Value<String?> firebaseId = const Value.absent(),
    Value<String?> ownerUserId = const Value.absent(),
    String? syncStatus,
    int? id,
    String? verseKey,
    int? chapterNumber,
    int? verseNumber,
    Value<DateTime?> lastReadAt = const Value.absent(),
  }) => ReadingProgressData(
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    firebaseId: firebaseId.present ? firebaseId.value : this.firebaseId,
    ownerUserId: ownerUserId.present ? ownerUserId.value : this.ownerUserId,
    syncStatus: syncStatus ?? this.syncStatus,
    id: id ?? this.id,
    verseKey: verseKey ?? this.verseKey,
    chapterNumber: chapterNumber ?? this.chapterNumber,
    verseNumber: verseNumber ?? this.verseNumber,
    lastReadAt: lastReadAt.present ? lastReadAt.value : this.lastReadAt,
  );
  ReadingProgressData copyWithCompanion(ReadingProgressCompanion data) {
    return ReadingProgressData(
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      firebaseId: data.firebaseId.present
          ? data.firebaseId.value
          : this.firebaseId,
      ownerUserId: data.ownerUserId.present
          ? data.ownerUserId.value
          : this.ownerUserId,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
      id: data.id.present ? data.id.value : this.id,
      verseKey: data.verseKey.present ? data.verseKey.value : this.verseKey,
      chapterNumber: data.chapterNumber.present
          ? data.chapterNumber.value
          : this.chapterNumber,
      verseNumber: data.verseNumber.present
          ? data.verseNumber.value
          : this.verseNumber,
      lastReadAt: data.lastReadAt.present
          ? data.lastReadAt.value
          : this.lastReadAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ReadingProgressData(')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('firebaseId: $firebaseId, ')
          ..write('ownerUserId: $ownerUserId, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('id: $id, ')
          ..write('verseKey: $verseKey, ')
          ..write('chapterNumber: $chapterNumber, ')
          ..write('verseNumber: $verseNumber, ')
          ..write('lastReadAt: $lastReadAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    createdAt,
    updatedAt,
    deletedAt,
    firebaseId,
    ownerUserId,
    syncStatus,
    id,
    verseKey,
    chapterNumber,
    verseNumber,
    lastReadAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ReadingProgressData &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.firebaseId == this.firebaseId &&
          other.ownerUserId == this.ownerUserId &&
          other.syncStatus == this.syncStatus &&
          other.id == this.id &&
          other.verseKey == this.verseKey &&
          other.chapterNumber == this.chapterNumber &&
          other.verseNumber == this.verseNumber &&
          other.lastReadAt == this.lastReadAt);
}

class ReadingProgressCompanion extends UpdateCompanion<ReadingProgressData> {
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<String?> firebaseId;
  final Value<String?> ownerUserId;
  final Value<String> syncStatus;
  final Value<int> id;
  final Value<String> verseKey;
  final Value<int> chapterNumber;
  final Value<int> verseNumber;
  final Value<DateTime?> lastReadAt;
  const ReadingProgressCompanion({
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.firebaseId = const Value.absent(),
    this.ownerUserId = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.id = const Value.absent(),
    this.verseKey = const Value.absent(),
    this.chapterNumber = const Value.absent(),
    this.verseNumber = const Value.absent(),
    this.lastReadAt = const Value.absent(),
  });
  ReadingProgressCompanion.insert({
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.firebaseId = const Value.absent(),
    this.ownerUserId = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.id = const Value.absent(),
    required String verseKey,
    required int chapterNumber,
    required int verseNumber,
    this.lastReadAt = const Value.absent(),
  }) : createdAt = Value(createdAt),
       updatedAt = Value(updatedAt),
       verseKey = Value(verseKey),
       chapterNumber = Value(chapterNumber),
       verseNumber = Value(verseNumber);
  static Insertable<ReadingProgressData> custom({
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<String>? firebaseId,
    Expression<String>? ownerUserId,
    Expression<String>? syncStatus,
    Expression<int>? id,
    Expression<String>? verseKey,
    Expression<int>? chapterNumber,
    Expression<int>? verseNumber,
    Expression<DateTime>? lastReadAt,
  }) {
    return RawValuesInsertable({
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (firebaseId != null) 'firebase_id': firebaseId,
      if (ownerUserId != null) 'owner_user_id': ownerUserId,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (id != null) 'id': id,
      if (verseKey != null) 'verse_key': verseKey,
      if (chapterNumber != null) 'chapter_number': chapterNumber,
      if (verseNumber != null) 'verse_number': verseNumber,
      if (lastReadAt != null) 'last_read_at': lastReadAt,
    });
  }

  ReadingProgressCompanion copyWith({
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<String?>? firebaseId,
    Value<String?>? ownerUserId,
    Value<String>? syncStatus,
    Value<int>? id,
    Value<String>? verseKey,
    Value<int>? chapterNumber,
    Value<int>? verseNumber,
    Value<DateTime?>? lastReadAt,
  }) {
    return ReadingProgressCompanion(
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      firebaseId: firebaseId ?? this.firebaseId,
      ownerUserId: ownerUserId ?? this.ownerUserId,
      syncStatus: syncStatus ?? this.syncStatus,
      id: id ?? this.id,
      verseKey: verseKey ?? this.verseKey,
      chapterNumber: chapterNumber ?? this.chapterNumber,
      verseNumber: verseNumber ?? this.verseNumber,
      lastReadAt: lastReadAt ?? this.lastReadAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (firebaseId.present) {
      map['firebase_id'] = Variable<String>(firebaseId.value);
    }
    if (ownerUserId.present) {
      map['owner_user_id'] = Variable<String>(ownerUserId.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (verseKey.present) {
      map['verse_key'] = Variable<String>(verseKey.value);
    }
    if (chapterNumber.present) {
      map['chapter_number'] = Variable<int>(chapterNumber.value);
    }
    if (verseNumber.present) {
      map['verse_number'] = Variable<int>(verseNumber.value);
    }
    if (lastReadAt.present) {
      map['last_read_at'] = Variable<DateTime>(lastReadAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReadingProgressCompanion(')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('firebaseId: $firebaseId, ')
          ..write('ownerUserId: $ownerUserId, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('id: $id, ')
          ..write('verseKey: $verseKey, ')
          ..write('chapterNumber: $chapterNumber, ')
          ..write('verseNumber: $verseNumber, ')
          ..write('lastReadAt: $lastReadAt')
          ..write(')'))
        .toString();
  }
}

class $ReadingSessionsTable extends ReadingSessions
    with TableInfo<$ReadingSessionsTable, ReadingSession> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ReadingSessionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _firebaseIdMeta = const VerificationMeta(
    'firebaseId',
  );
  @override
  late final GeneratedColumn<String> firebaseId = GeneratedColumn<String>(
    'firebase_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ownerUserIdMeta = const VerificationMeta(
    'ownerUserId',
  );
  @override
  late final GeneratedColumn<String> ownerUserId = GeneratedColumn<String>(
    'owner_user_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
    'sync_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('local'),
  );
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _sessionDateMeta = const VerificationMeta(
    'sessionDate',
  );
  @override
  late final GeneratedColumn<DateTime> sessionDate = GeneratedColumn<DateTime>(
    'session_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _startedAtMeta = const VerificationMeta(
    'startedAt',
  );
  @override
  late final GeneratedColumn<DateTime> startedAt = GeneratedColumn<DateTime>(
    'started_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _endedAtMeta = const VerificationMeta(
    'endedAt',
  );
  @override
  late final GeneratedColumn<DateTime> endedAt = GeneratedColumn<DateTime>(
    'ended_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ayahCountMeta = const VerificationMeta(
    'ayahCount',
  );
  @override
  late final GeneratedColumn<int> ayahCount = GeneratedColumn<int>(
    'ayah_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _pageCountMeta = const VerificationMeta(
    'pageCount',
  );
  @override
  late final GeneratedColumn<int> pageCount = GeneratedColumn<int>(
    'page_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _durationMinutesMeta = const VerificationMeta(
    'durationMinutes',
  );
  @override
  late final GeneratedColumn<int> durationMinutes = GeneratedColumn<int>(
    'duration_minutes',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _startVerseKeyMeta = const VerificationMeta(
    'startVerseKey',
  );
  @override
  late final GeneratedColumn<String> startVerseKey = GeneratedColumn<String>(
    'start_verse_key',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _endVerseKeyMeta = const VerificationMeta(
    'endVerseKey',
  );
  @override
  late final GeneratedColumn<String> endVerseKey = GeneratedColumn<String>(
    'end_verse_key',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    createdAt,
    updatedAt,
    deletedAt,
    firebaseId,
    ownerUserId,
    syncStatus,
    id,
    sessionDate,
    startedAt,
    endedAt,
    ayahCount,
    pageCount,
    durationMinutes,
    startVerseKey,
    endVerseKey,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'reading_sessions';
  @override
  VerificationContext validateIntegrity(
    Insertable<ReadingSession> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('firebase_id')) {
      context.handle(
        _firebaseIdMeta,
        firebaseId.isAcceptableOrUnknown(data['firebase_id']!, _firebaseIdMeta),
      );
    }
    if (data.containsKey('owner_user_id')) {
      context.handle(
        _ownerUserIdMeta,
        ownerUserId.isAcceptableOrUnknown(
          data['owner_user_id']!,
          _ownerUserIdMeta,
        ),
      );
    }
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('session_date')) {
      context.handle(
        _sessionDateMeta,
        sessionDate.isAcceptableOrUnknown(
          data['session_date']!,
          _sessionDateMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_sessionDateMeta);
    }
    if (data.containsKey('started_at')) {
      context.handle(
        _startedAtMeta,
        startedAt.isAcceptableOrUnknown(data['started_at']!, _startedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_startedAtMeta);
    }
    if (data.containsKey('ended_at')) {
      context.handle(
        _endedAtMeta,
        endedAt.isAcceptableOrUnknown(data['ended_at']!, _endedAtMeta),
      );
    }
    if (data.containsKey('ayah_count')) {
      context.handle(
        _ayahCountMeta,
        ayahCount.isAcceptableOrUnknown(data['ayah_count']!, _ayahCountMeta),
      );
    }
    if (data.containsKey('page_count')) {
      context.handle(
        _pageCountMeta,
        pageCount.isAcceptableOrUnknown(data['page_count']!, _pageCountMeta),
      );
    }
    if (data.containsKey('duration_minutes')) {
      context.handle(
        _durationMinutesMeta,
        durationMinutes.isAcceptableOrUnknown(
          data['duration_minutes']!,
          _durationMinutesMeta,
        ),
      );
    }
    if (data.containsKey('start_verse_key')) {
      context.handle(
        _startVerseKeyMeta,
        startVerseKey.isAcceptableOrUnknown(
          data['start_verse_key']!,
          _startVerseKeyMeta,
        ),
      );
    }
    if (data.containsKey('end_verse_key')) {
      context.handle(
        _endVerseKeyMeta,
        endVerseKey.isAcceptableOrUnknown(
          data['end_verse_key']!,
          _endVerseKeyMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ReadingSession map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ReadingSession(
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      firebaseId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}firebase_id'],
      ),
      ownerUserId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}owner_user_id'],
      ),
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_status'],
      )!,
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      sessionDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}session_date'],
      )!,
      startedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}started_at'],
      )!,
      endedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}ended_at'],
      ),
      ayahCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}ayah_count'],
      )!,
      pageCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}page_count'],
      )!,
      durationMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}duration_minutes'],
      )!,
      startVerseKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}start_verse_key'],
      ),
      endVerseKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}end_verse_key'],
      ),
    );
  }

  @override
  $ReadingSessionsTable createAlias(String alias) {
    return $ReadingSessionsTable(attachedDatabase, alias);
  }
}

class ReadingSession extends DataClass implements Insertable<ReadingSession> {
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final String? firebaseId;
  final String? ownerUserId;
  final String syncStatus;
  final int id;
  final DateTime sessionDate;
  final DateTime startedAt;
  final DateTime? endedAt;
  final int ayahCount;
  final int pageCount;
  final int durationMinutes;
  final String? startVerseKey;
  final String? endVerseKey;
  const ReadingSession({
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    this.firebaseId,
    this.ownerUserId,
    required this.syncStatus,
    required this.id,
    required this.sessionDate,
    required this.startedAt,
    this.endedAt,
    required this.ayahCount,
    required this.pageCount,
    required this.durationMinutes,
    this.startVerseKey,
    this.endVerseKey,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    if (!nullToAbsent || firebaseId != null) {
      map['firebase_id'] = Variable<String>(firebaseId);
    }
    if (!nullToAbsent || ownerUserId != null) {
      map['owner_user_id'] = Variable<String>(ownerUserId);
    }
    map['sync_status'] = Variable<String>(syncStatus);
    map['id'] = Variable<int>(id);
    map['session_date'] = Variable<DateTime>(sessionDate);
    map['started_at'] = Variable<DateTime>(startedAt);
    if (!nullToAbsent || endedAt != null) {
      map['ended_at'] = Variable<DateTime>(endedAt);
    }
    map['ayah_count'] = Variable<int>(ayahCount);
    map['page_count'] = Variable<int>(pageCount);
    map['duration_minutes'] = Variable<int>(durationMinutes);
    if (!nullToAbsent || startVerseKey != null) {
      map['start_verse_key'] = Variable<String>(startVerseKey);
    }
    if (!nullToAbsent || endVerseKey != null) {
      map['end_verse_key'] = Variable<String>(endVerseKey);
    }
    return map;
  }

  ReadingSessionsCompanion toCompanion(bool nullToAbsent) {
    return ReadingSessionsCompanion(
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      firebaseId: firebaseId == null && nullToAbsent
          ? const Value.absent()
          : Value(firebaseId),
      ownerUserId: ownerUserId == null && nullToAbsent
          ? const Value.absent()
          : Value(ownerUserId),
      syncStatus: Value(syncStatus),
      id: Value(id),
      sessionDate: Value(sessionDate),
      startedAt: Value(startedAt),
      endedAt: endedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(endedAt),
      ayahCount: Value(ayahCount),
      pageCount: Value(pageCount),
      durationMinutes: Value(durationMinutes),
      startVerseKey: startVerseKey == null && nullToAbsent
          ? const Value.absent()
          : Value(startVerseKey),
      endVerseKey: endVerseKey == null && nullToAbsent
          ? const Value.absent()
          : Value(endVerseKey),
    );
  }

  factory ReadingSession.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ReadingSession(
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      firebaseId: serializer.fromJson<String?>(json['firebaseId']),
      ownerUserId: serializer.fromJson<String?>(json['ownerUserId']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
      id: serializer.fromJson<int>(json['id']),
      sessionDate: serializer.fromJson<DateTime>(json['sessionDate']),
      startedAt: serializer.fromJson<DateTime>(json['startedAt']),
      endedAt: serializer.fromJson<DateTime?>(json['endedAt']),
      ayahCount: serializer.fromJson<int>(json['ayahCount']),
      pageCount: serializer.fromJson<int>(json['pageCount']),
      durationMinutes: serializer.fromJson<int>(json['durationMinutes']),
      startVerseKey: serializer.fromJson<String?>(json['startVerseKey']),
      endVerseKey: serializer.fromJson<String?>(json['endVerseKey']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'firebaseId': serializer.toJson<String?>(firebaseId),
      'ownerUserId': serializer.toJson<String?>(ownerUserId),
      'syncStatus': serializer.toJson<String>(syncStatus),
      'id': serializer.toJson<int>(id),
      'sessionDate': serializer.toJson<DateTime>(sessionDate),
      'startedAt': serializer.toJson<DateTime>(startedAt),
      'endedAt': serializer.toJson<DateTime?>(endedAt),
      'ayahCount': serializer.toJson<int>(ayahCount),
      'pageCount': serializer.toJson<int>(pageCount),
      'durationMinutes': serializer.toJson<int>(durationMinutes),
      'startVerseKey': serializer.toJson<String?>(startVerseKey),
      'endVerseKey': serializer.toJson<String?>(endVerseKey),
    };
  }

  ReadingSession copyWith({
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    Value<String?> firebaseId = const Value.absent(),
    Value<String?> ownerUserId = const Value.absent(),
    String? syncStatus,
    int? id,
    DateTime? sessionDate,
    DateTime? startedAt,
    Value<DateTime?> endedAt = const Value.absent(),
    int? ayahCount,
    int? pageCount,
    int? durationMinutes,
    Value<String?> startVerseKey = const Value.absent(),
    Value<String?> endVerseKey = const Value.absent(),
  }) => ReadingSession(
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    firebaseId: firebaseId.present ? firebaseId.value : this.firebaseId,
    ownerUserId: ownerUserId.present ? ownerUserId.value : this.ownerUserId,
    syncStatus: syncStatus ?? this.syncStatus,
    id: id ?? this.id,
    sessionDate: sessionDate ?? this.sessionDate,
    startedAt: startedAt ?? this.startedAt,
    endedAt: endedAt.present ? endedAt.value : this.endedAt,
    ayahCount: ayahCount ?? this.ayahCount,
    pageCount: pageCount ?? this.pageCount,
    durationMinutes: durationMinutes ?? this.durationMinutes,
    startVerseKey: startVerseKey.present
        ? startVerseKey.value
        : this.startVerseKey,
    endVerseKey: endVerseKey.present ? endVerseKey.value : this.endVerseKey,
  );
  ReadingSession copyWithCompanion(ReadingSessionsCompanion data) {
    return ReadingSession(
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      firebaseId: data.firebaseId.present
          ? data.firebaseId.value
          : this.firebaseId,
      ownerUserId: data.ownerUserId.present
          ? data.ownerUserId.value
          : this.ownerUserId,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
      id: data.id.present ? data.id.value : this.id,
      sessionDate: data.sessionDate.present
          ? data.sessionDate.value
          : this.sessionDate,
      startedAt: data.startedAt.present ? data.startedAt.value : this.startedAt,
      endedAt: data.endedAt.present ? data.endedAt.value : this.endedAt,
      ayahCount: data.ayahCount.present ? data.ayahCount.value : this.ayahCount,
      pageCount: data.pageCount.present ? data.pageCount.value : this.pageCount,
      durationMinutes: data.durationMinutes.present
          ? data.durationMinutes.value
          : this.durationMinutes,
      startVerseKey: data.startVerseKey.present
          ? data.startVerseKey.value
          : this.startVerseKey,
      endVerseKey: data.endVerseKey.present
          ? data.endVerseKey.value
          : this.endVerseKey,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ReadingSession(')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('firebaseId: $firebaseId, ')
          ..write('ownerUserId: $ownerUserId, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('id: $id, ')
          ..write('sessionDate: $sessionDate, ')
          ..write('startedAt: $startedAt, ')
          ..write('endedAt: $endedAt, ')
          ..write('ayahCount: $ayahCount, ')
          ..write('pageCount: $pageCount, ')
          ..write('durationMinutes: $durationMinutes, ')
          ..write('startVerseKey: $startVerseKey, ')
          ..write('endVerseKey: $endVerseKey')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    createdAt,
    updatedAt,
    deletedAt,
    firebaseId,
    ownerUserId,
    syncStatus,
    id,
    sessionDate,
    startedAt,
    endedAt,
    ayahCount,
    pageCount,
    durationMinutes,
    startVerseKey,
    endVerseKey,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ReadingSession &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.firebaseId == this.firebaseId &&
          other.ownerUserId == this.ownerUserId &&
          other.syncStatus == this.syncStatus &&
          other.id == this.id &&
          other.sessionDate == this.sessionDate &&
          other.startedAt == this.startedAt &&
          other.endedAt == this.endedAt &&
          other.ayahCount == this.ayahCount &&
          other.pageCount == this.pageCount &&
          other.durationMinutes == this.durationMinutes &&
          other.startVerseKey == this.startVerseKey &&
          other.endVerseKey == this.endVerseKey);
}

class ReadingSessionsCompanion extends UpdateCompanion<ReadingSession> {
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<String?> firebaseId;
  final Value<String?> ownerUserId;
  final Value<String> syncStatus;
  final Value<int> id;
  final Value<DateTime> sessionDate;
  final Value<DateTime> startedAt;
  final Value<DateTime?> endedAt;
  final Value<int> ayahCount;
  final Value<int> pageCount;
  final Value<int> durationMinutes;
  final Value<String?> startVerseKey;
  final Value<String?> endVerseKey;
  const ReadingSessionsCompanion({
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.firebaseId = const Value.absent(),
    this.ownerUserId = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.id = const Value.absent(),
    this.sessionDate = const Value.absent(),
    this.startedAt = const Value.absent(),
    this.endedAt = const Value.absent(),
    this.ayahCount = const Value.absent(),
    this.pageCount = const Value.absent(),
    this.durationMinutes = const Value.absent(),
    this.startVerseKey = const Value.absent(),
    this.endVerseKey = const Value.absent(),
  });
  ReadingSessionsCompanion.insert({
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.firebaseId = const Value.absent(),
    this.ownerUserId = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.id = const Value.absent(),
    required DateTime sessionDate,
    required DateTime startedAt,
    this.endedAt = const Value.absent(),
    this.ayahCount = const Value.absent(),
    this.pageCount = const Value.absent(),
    this.durationMinutes = const Value.absent(),
    this.startVerseKey = const Value.absent(),
    this.endVerseKey = const Value.absent(),
  }) : createdAt = Value(createdAt),
       updatedAt = Value(updatedAt),
       sessionDate = Value(sessionDate),
       startedAt = Value(startedAt);
  static Insertable<ReadingSession> custom({
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<String>? firebaseId,
    Expression<String>? ownerUserId,
    Expression<String>? syncStatus,
    Expression<int>? id,
    Expression<DateTime>? sessionDate,
    Expression<DateTime>? startedAt,
    Expression<DateTime>? endedAt,
    Expression<int>? ayahCount,
    Expression<int>? pageCount,
    Expression<int>? durationMinutes,
    Expression<String>? startVerseKey,
    Expression<String>? endVerseKey,
  }) {
    return RawValuesInsertable({
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (firebaseId != null) 'firebase_id': firebaseId,
      if (ownerUserId != null) 'owner_user_id': ownerUserId,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (id != null) 'id': id,
      if (sessionDate != null) 'session_date': sessionDate,
      if (startedAt != null) 'started_at': startedAt,
      if (endedAt != null) 'ended_at': endedAt,
      if (ayahCount != null) 'ayah_count': ayahCount,
      if (pageCount != null) 'page_count': pageCount,
      if (durationMinutes != null) 'duration_minutes': durationMinutes,
      if (startVerseKey != null) 'start_verse_key': startVerseKey,
      if (endVerseKey != null) 'end_verse_key': endVerseKey,
    });
  }

  ReadingSessionsCompanion copyWith({
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<String?>? firebaseId,
    Value<String?>? ownerUserId,
    Value<String>? syncStatus,
    Value<int>? id,
    Value<DateTime>? sessionDate,
    Value<DateTime>? startedAt,
    Value<DateTime?>? endedAt,
    Value<int>? ayahCount,
    Value<int>? pageCount,
    Value<int>? durationMinutes,
    Value<String?>? startVerseKey,
    Value<String?>? endVerseKey,
  }) {
    return ReadingSessionsCompanion(
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      firebaseId: firebaseId ?? this.firebaseId,
      ownerUserId: ownerUserId ?? this.ownerUserId,
      syncStatus: syncStatus ?? this.syncStatus,
      id: id ?? this.id,
      sessionDate: sessionDate ?? this.sessionDate,
      startedAt: startedAt ?? this.startedAt,
      endedAt: endedAt ?? this.endedAt,
      ayahCount: ayahCount ?? this.ayahCount,
      pageCount: pageCount ?? this.pageCount,
      durationMinutes: durationMinutes ?? this.durationMinutes,
      startVerseKey: startVerseKey ?? this.startVerseKey,
      endVerseKey: endVerseKey ?? this.endVerseKey,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (firebaseId.present) {
      map['firebase_id'] = Variable<String>(firebaseId.value);
    }
    if (ownerUserId.present) {
      map['owner_user_id'] = Variable<String>(ownerUserId.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (sessionDate.present) {
      map['session_date'] = Variable<DateTime>(sessionDate.value);
    }
    if (startedAt.present) {
      map['started_at'] = Variable<DateTime>(startedAt.value);
    }
    if (endedAt.present) {
      map['ended_at'] = Variable<DateTime>(endedAt.value);
    }
    if (ayahCount.present) {
      map['ayah_count'] = Variable<int>(ayahCount.value);
    }
    if (pageCount.present) {
      map['page_count'] = Variable<int>(pageCount.value);
    }
    if (durationMinutes.present) {
      map['duration_minutes'] = Variable<int>(durationMinutes.value);
    }
    if (startVerseKey.present) {
      map['start_verse_key'] = Variable<String>(startVerseKey.value);
    }
    if (endVerseKey.present) {
      map['end_verse_key'] = Variable<String>(endVerseKey.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReadingSessionsCompanion(')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('firebaseId: $firebaseId, ')
          ..write('ownerUserId: $ownerUserId, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('id: $id, ')
          ..write('sessionDate: $sessionDate, ')
          ..write('startedAt: $startedAt, ')
          ..write('endedAt: $endedAt, ')
          ..write('ayahCount: $ayahCount, ')
          ..write('pageCount: $pageCount, ')
          ..write('durationMinutes: $durationMinutes, ')
          ..write('startVerseKey: $startVerseKey, ')
          ..write('endVerseKey: $endVerseKey')
          ..write(')'))
        .toString();
  }
}

class $DailyGoalsTable extends DailyGoals
    with TableInfo<$DailyGoalsTable, DailyGoal> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DailyGoalsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _firebaseIdMeta = const VerificationMeta(
    'firebaseId',
  );
  @override
  late final GeneratedColumn<String> firebaseId = GeneratedColumn<String>(
    'firebase_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ownerUserIdMeta = const VerificationMeta(
    'ownerUserId',
  );
  @override
  late final GeneratedColumn<String> ownerUserId = GeneratedColumn<String>(
    'owner_user_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
    'sync_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('local'),
  );
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _goalDateMeta = const VerificationMeta(
    'goalDate',
  );
  @override
  late final GeneratedColumn<DateTime> goalDate = GeneratedColumn<DateTime>(
    'goal_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _goalTypeMeta = const VerificationMeta(
    'goalType',
  );
  @override
  late final GeneratedColumn<String> goalType = GeneratedColumn<String>(
    'goal_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('one_ayah_per_day'),
  );
  static const VerificationMeta _targetVersesMeta = const VerificationMeta(
    'targetVerses',
  );
  @override
  late final GeneratedColumn<int> targetVerses = GeneratedColumn<int>(
    'target_verses',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _completedVersesMeta = const VerificationMeta(
    'completedVerses',
  );
  @override
  late final GeneratedColumn<int> completedVerses = GeneratedColumn<int>(
    'completed_verses',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _targetPagesMeta = const VerificationMeta(
    'targetPages',
  );
  @override
  late final GeneratedColumn<int> targetPages = GeneratedColumn<int>(
    'target_pages',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _completedPagesMeta = const VerificationMeta(
    'completedPages',
  );
  @override
  late final GeneratedColumn<int> completedPages = GeneratedColumn<int>(
    'completed_pages',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _targetMinutesMeta = const VerificationMeta(
    'targetMinutes',
  );
  @override
  late final GeneratedColumn<int> targetMinutes = GeneratedColumn<int>(
    'target_minutes',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _completedMinutesMeta = const VerificationMeta(
    'completedMinutes',
  );
  @override
  late final GeneratedColumn<int> completedMinutes = GeneratedColumn<int>(
    'completed_minutes',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _isCompletedMeta = const VerificationMeta(
    'isCompleted',
  );
  @override
  late final GeneratedColumn<bool> isCompleted = GeneratedColumn<bool>(
    'is_completed',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_completed" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    createdAt,
    updatedAt,
    deletedAt,
    firebaseId,
    ownerUserId,
    syncStatus,
    id,
    goalDate,
    goalType,
    targetVerses,
    completedVerses,
    targetPages,
    completedPages,
    targetMinutes,
    completedMinutes,
    isCompleted,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'daily_goals';
  @override
  VerificationContext validateIntegrity(
    Insertable<DailyGoal> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('firebase_id')) {
      context.handle(
        _firebaseIdMeta,
        firebaseId.isAcceptableOrUnknown(data['firebase_id']!, _firebaseIdMeta),
      );
    }
    if (data.containsKey('owner_user_id')) {
      context.handle(
        _ownerUserIdMeta,
        ownerUserId.isAcceptableOrUnknown(
          data['owner_user_id']!,
          _ownerUserIdMeta,
        ),
      );
    }
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('goal_date')) {
      context.handle(
        _goalDateMeta,
        goalDate.isAcceptableOrUnknown(data['goal_date']!, _goalDateMeta),
      );
    } else if (isInserting) {
      context.missing(_goalDateMeta);
    }
    if (data.containsKey('goal_type')) {
      context.handle(
        _goalTypeMeta,
        goalType.isAcceptableOrUnknown(data['goal_type']!, _goalTypeMeta),
      );
    }
    if (data.containsKey('target_verses')) {
      context.handle(
        _targetVersesMeta,
        targetVerses.isAcceptableOrUnknown(
          data['target_verses']!,
          _targetVersesMeta,
        ),
      );
    }
    if (data.containsKey('completed_verses')) {
      context.handle(
        _completedVersesMeta,
        completedVerses.isAcceptableOrUnknown(
          data['completed_verses']!,
          _completedVersesMeta,
        ),
      );
    }
    if (data.containsKey('target_pages')) {
      context.handle(
        _targetPagesMeta,
        targetPages.isAcceptableOrUnknown(
          data['target_pages']!,
          _targetPagesMeta,
        ),
      );
    }
    if (data.containsKey('completed_pages')) {
      context.handle(
        _completedPagesMeta,
        completedPages.isAcceptableOrUnknown(
          data['completed_pages']!,
          _completedPagesMeta,
        ),
      );
    }
    if (data.containsKey('target_minutes')) {
      context.handle(
        _targetMinutesMeta,
        targetMinutes.isAcceptableOrUnknown(
          data['target_minutes']!,
          _targetMinutesMeta,
        ),
      );
    }
    if (data.containsKey('completed_minutes')) {
      context.handle(
        _completedMinutesMeta,
        completedMinutes.isAcceptableOrUnknown(
          data['completed_minutes']!,
          _completedMinutesMeta,
        ),
      );
    }
    if (data.containsKey('is_completed')) {
      context.handle(
        _isCompletedMeta,
        isCompleted.isAcceptableOrUnknown(
          data['is_completed']!,
          _isCompletedMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DailyGoal map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DailyGoal(
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      firebaseId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}firebase_id'],
      ),
      ownerUserId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}owner_user_id'],
      ),
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_status'],
      )!,
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      goalDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}goal_date'],
      )!,
      goalType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}goal_type'],
      )!,
      targetVerses: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}target_verses'],
      )!,
      completedVerses: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}completed_verses'],
      )!,
      targetPages: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}target_pages'],
      )!,
      completedPages: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}completed_pages'],
      )!,
      targetMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}target_minutes'],
      )!,
      completedMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}completed_minutes'],
      )!,
      isCompleted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_completed'],
      )!,
    );
  }

  @override
  $DailyGoalsTable createAlias(String alias) {
    return $DailyGoalsTable(attachedDatabase, alias);
  }
}

class DailyGoal extends DataClass implements Insertable<DailyGoal> {
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final String? firebaseId;
  final String? ownerUserId;
  final String syncStatus;
  final int id;
  final DateTime goalDate;
  final String goalType;
  final int targetVerses;
  final int completedVerses;
  final int targetPages;
  final int completedPages;
  final int targetMinutes;
  final int completedMinutes;
  final bool isCompleted;
  const DailyGoal({
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    this.firebaseId,
    this.ownerUserId,
    required this.syncStatus,
    required this.id,
    required this.goalDate,
    required this.goalType,
    required this.targetVerses,
    required this.completedVerses,
    required this.targetPages,
    required this.completedPages,
    required this.targetMinutes,
    required this.completedMinutes,
    required this.isCompleted,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    if (!nullToAbsent || firebaseId != null) {
      map['firebase_id'] = Variable<String>(firebaseId);
    }
    if (!nullToAbsent || ownerUserId != null) {
      map['owner_user_id'] = Variable<String>(ownerUserId);
    }
    map['sync_status'] = Variable<String>(syncStatus);
    map['id'] = Variable<int>(id);
    map['goal_date'] = Variable<DateTime>(goalDate);
    map['goal_type'] = Variable<String>(goalType);
    map['target_verses'] = Variable<int>(targetVerses);
    map['completed_verses'] = Variable<int>(completedVerses);
    map['target_pages'] = Variable<int>(targetPages);
    map['completed_pages'] = Variable<int>(completedPages);
    map['target_minutes'] = Variable<int>(targetMinutes);
    map['completed_minutes'] = Variable<int>(completedMinutes);
    map['is_completed'] = Variable<bool>(isCompleted);
    return map;
  }

  DailyGoalsCompanion toCompanion(bool nullToAbsent) {
    return DailyGoalsCompanion(
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      firebaseId: firebaseId == null && nullToAbsent
          ? const Value.absent()
          : Value(firebaseId),
      ownerUserId: ownerUserId == null && nullToAbsent
          ? const Value.absent()
          : Value(ownerUserId),
      syncStatus: Value(syncStatus),
      id: Value(id),
      goalDate: Value(goalDate),
      goalType: Value(goalType),
      targetVerses: Value(targetVerses),
      completedVerses: Value(completedVerses),
      targetPages: Value(targetPages),
      completedPages: Value(completedPages),
      targetMinutes: Value(targetMinutes),
      completedMinutes: Value(completedMinutes),
      isCompleted: Value(isCompleted),
    );
  }

  factory DailyGoal.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DailyGoal(
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      firebaseId: serializer.fromJson<String?>(json['firebaseId']),
      ownerUserId: serializer.fromJson<String?>(json['ownerUserId']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
      id: serializer.fromJson<int>(json['id']),
      goalDate: serializer.fromJson<DateTime>(json['goalDate']),
      goalType: serializer.fromJson<String>(json['goalType']),
      targetVerses: serializer.fromJson<int>(json['targetVerses']),
      completedVerses: serializer.fromJson<int>(json['completedVerses']),
      targetPages: serializer.fromJson<int>(json['targetPages']),
      completedPages: serializer.fromJson<int>(json['completedPages']),
      targetMinutes: serializer.fromJson<int>(json['targetMinutes']),
      completedMinutes: serializer.fromJson<int>(json['completedMinutes']),
      isCompleted: serializer.fromJson<bool>(json['isCompleted']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'firebaseId': serializer.toJson<String?>(firebaseId),
      'ownerUserId': serializer.toJson<String?>(ownerUserId),
      'syncStatus': serializer.toJson<String>(syncStatus),
      'id': serializer.toJson<int>(id),
      'goalDate': serializer.toJson<DateTime>(goalDate),
      'goalType': serializer.toJson<String>(goalType),
      'targetVerses': serializer.toJson<int>(targetVerses),
      'completedVerses': serializer.toJson<int>(completedVerses),
      'targetPages': serializer.toJson<int>(targetPages),
      'completedPages': serializer.toJson<int>(completedPages),
      'targetMinutes': serializer.toJson<int>(targetMinutes),
      'completedMinutes': serializer.toJson<int>(completedMinutes),
      'isCompleted': serializer.toJson<bool>(isCompleted),
    };
  }

  DailyGoal copyWith({
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    Value<String?> firebaseId = const Value.absent(),
    Value<String?> ownerUserId = const Value.absent(),
    String? syncStatus,
    int? id,
    DateTime? goalDate,
    String? goalType,
    int? targetVerses,
    int? completedVerses,
    int? targetPages,
    int? completedPages,
    int? targetMinutes,
    int? completedMinutes,
    bool? isCompleted,
  }) => DailyGoal(
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    firebaseId: firebaseId.present ? firebaseId.value : this.firebaseId,
    ownerUserId: ownerUserId.present ? ownerUserId.value : this.ownerUserId,
    syncStatus: syncStatus ?? this.syncStatus,
    id: id ?? this.id,
    goalDate: goalDate ?? this.goalDate,
    goalType: goalType ?? this.goalType,
    targetVerses: targetVerses ?? this.targetVerses,
    completedVerses: completedVerses ?? this.completedVerses,
    targetPages: targetPages ?? this.targetPages,
    completedPages: completedPages ?? this.completedPages,
    targetMinutes: targetMinutes ?? this.targetMinutes,
    completedMinutes: completedMinutes ?? this.completedMinutes,
    isCompleted: isCompleted ?? this.isCompleted,
  );
  DailyGoal copyWithCompanion(DailyGoalsCompanion data) {
    return DailyGoal(
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      firebaseId: data.firebaseId.present
          ? data.firebaseId.value
          : this.firebaseId,
      ownerUserId: data.ownerUserId.present
          ? data.ownerUserId.value
          : this.ownerUserId,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
      id: data.id.present ? data.id.value : this.id,
      goalDate: data.goalDate.present ? data.goalDate.value : this.goalDate,
      goalType: data.goalType.present ? data.goalType.value : this.goalType,
      targetVerses: data.targetVerses.present
          ? data.targetVerses.value
          : this.targetVerses,
      completedVerses: data.completedVerses.present
          ? data.completedVerses.value
          : this.completedVerses,
      targetPages: data.targetPages.present
          ? data.targetPages.value
          : this.targetPages,
      completedPages: data.completedPages.present
          ? data.completedPages.value
          : this.completedPages,
      targetMinutes: data.targetMinutes.present
          ? data.targetMinutes.value
          : this.targetMinutes,
      completedMinutes: data.completedMinutes.present
          ? data.completedMinutes.value
          : this.completedMinutes,
      isCompleted: data.isCompleted.present
          ? data.isCompleted.value
          : this.isCompleted,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DailyGoal(')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('firebaseId: $firebaseId, ')
          ..write('ownerUserId: $ownerUserId, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('id: $id, ')
          ..write('goalDate: $goalDate, ')
          ..write('goalType: $goalType, ')
          ..write('targetVerses: $targetVerses, ')
          ..write('completedVerses: $completedVerses, ')
          ..write('targetPages: $targetPages, ')
          ..write('completedPages: $completedPages, ')
          ..write('targetMinutes: $targetMinutes, ')
          ..write('completedMinutes: $completedMinutes, ')
          ..write('isCompleted: $isCompleted')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    createdAt,
    updatedAt,
    deletedAt,
    firebaseId,
    ownerUserId,
    syncStatus,
    id,
    goalDate,
    goalType,
    targetVerses,
    completedVerses,
    targetPages,
    completedPages,
    targetMinutes,
    completedMinutes,
    isCompleted,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DailyGoal &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.firebaseId == this.firebaseId &&
          other.ownerUserId == this.ownerUserId &&
          other.syncStatus == this.syncStatus &&
          other.id == this.id &&
          other.goalDate == this.goalDate &&
          other.goalType == this.goalType &&
          other.targetVerses == this.targetVerses &&
          other.completedVerses == this.completedVerses &&
          other.targetPages == this.targetPages &&
          other.completedPages == this.completedPages &&
          other.targetMinutes == this.targetMinutes &&
          other.completedMinutes == this.completedMinutes &&
          other.isCompleted == this.isCompleted);
}

class DailyGoalsCompanion extends UpdateCompanion<DailyGoal> {
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<String?> firebaseId;
  final Value<String?> ownerUserId;
  final Value<String> syncStatus;
  final Value<int> id;
  final Value<DateTime> goalDate;
  final Value<String> goalType;
  final Value<int> targetVerses;
  final Value<int> completedVerses;
  final Value<int> targetPages;
  final Value<int> completedPages;
  final Value<int> targetMinutes;
  final Value<int> completedMinutes;
  final Value<bool> isCompleted;
  const DailyGoalsCompanion({
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.firebaseId = const Value.absent(),
    this.ownerUserId = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.id = const Value.absent(),
    this.goalDate = const Value.absent(),
    this.goalType = const Value.absent(),
    this.targetVerses = const Value.absent(),
    this.completedVerses = const Value.absent(),
    this.targetPages = const Value.absent(),
    this.completedPages = const Value.absent(),
    this.targetMinutes = const Value.absent(),
    this.completedMinutes = const Value.absent(),
    this.isCompleted = const Value.absent(),
  });
  DailyGoalsCompanion.insert({
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.firebaseId = const Value.absent(),
    this.ownerUserId = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.id = const Value.absent(),
    required DateTime goalDate,
    this.goalType = const Value.absent(),
    this.targetVerses = const Value.absent(),
    this.completedVerses = const Value.absent(),
    this.targetPages = const Value.absent(),
    this.completedPages = const Value.absent(),
    this.targetMinutes = const Value.absent(),
    this.completedMinutes = const Value.absent(),
    this.isCompleted = const Value.absent(),
  }) : createdAt = Value(createdAt),
       updatedAt = Value(updatedAt),
       goalDate = Value(goalDate);
  static Insertable<DailyGoal> custom({
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<String>? firebaseId,
    Expression<String>? ownerUserId,
    Expression<String>? syncStatus,
    Expression<int>? id,
    Expression<DateTime>? goalDate,
    Expression<String>? goalType,
    Expression<int>? targetVerses,
    Expression<int>? completedVerses,
    Expression<int>? targetPages,
    Expression<int>? completedPages,
    Expression<int>? targetMinutes,
    Expression<int>? completedMinutes,
    Expression<bool>? isCompleted,
  }) {
    return RawValuesInsertable({
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (firebaseId != null) 'firebase_id': firebaseId,
      if (ownerUserId != null) 'owner_user_id': ownerUserId,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (id != null) 'id': id,
      if (goalDate != null) 'goal_date': goalDate,
      if (goalType != null) 'goal_type': goalType,
      if (targetVerses != null) 'target_verses': targetVerses,
      if (completedVerses != null) 'completed_verses': completedVerses,
      if (targetPages != null) 'target_pages': targetPages,
      if (completedPages != null) 'completed_pages': completedPages,
      if (targetMinutes != null) 'target_minutes': targetMinutes,
      if (completedMinutes != null) 'completed_minutes': completedMinutes,
      if (isCompleted != null) 'is_completed': isCompleted,
    });
  }

  DailyGoalsCompanion copyWith({
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<String?>? firebaseId,
    Value<String?>? ownerUserId,
    Value<String>? syncStatus,
    Value<int>? id,
    Value<DateTime>? goalDate,
    Value<String>? goalType,
    Value<int>? targetVerses,
    Value<int>? completedVerses,
    Value<int>? targetPages,
    Value<int>? completedPages,
    Value<int>? targetMinutes,
    Value<int>? completedMinutes,
    Value<bool>? isCompleted,
  }) {
    return DailyGoalsCompanion(
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      firebaseId: firebaseId ?? this.firebaseId,
      ownerUserId: ownerUserId ?? this.ownerUserId,
      syncStatus: syncStatus ?? this.syncStatus,
      id: id ?? this.id,
      goalDate: goalDate ?? this.goalDate,
      goalType: goalType ?? this.goalType,
      targetVerses: targetVerses ?? this.targetVerses,
      completedVerses: completedVerses ?? this.completedVerses,
      targetPages: targetPages ?? this.targetPages,
      completedPages: completedPages ?? this.completedPages,
      targetMinutes: targetMinutes ?? this.targetMinutes,
      completedMinutes: completedMinutes ?? this.completedMinutes,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (firebaseId.present) {
      map['firebase_id'] = Variable<String>(firebaseId.value);
    }
    if (ownerUserId.present) {
      map['owner_user_id'] = Variable<String>(ownerUserId.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (goalDate.present) {
      map['goal_date'] = Variable<DateTime>(goalDate.value);
    }
    if (goalType.present) {
      map['goal_type'] = Variable<String>(goalType.value);
    }
    if (targetVerses.present) {
      map['target_verses'] = Variable<int>(targetVerses.value);
    }
    if (completedVerses.present) {
      map['completed_verses'] = Variable<int>(completedVerses.value);
    }
    if (targetPages.present) {
      map['target_pages'] = Variable<int>(targetPages.value);
    }
    if (completedPages.present) {
      map['completed_pages'] = Variable<int>(completedPages.value);
    }
    if (targetMinutes.present) {
      map['target_minutes'] = Variable<int>(targetMinutes.value);
    }
    if (completedMinutes.present) {
      map['completed_minutes'] = Variable<int>(completedMinutes.value);
    }
    if (isCompleted.present) {
      map['is_completed'] = Variable<bool>(isCompleted.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DailyGoalsCompanion(')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('firebaseId: $firebaseId, ')
          ..write('ownerUserId: $ownerUserId, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('id: $id, ')
          ..write('goalDate: $goalDate, ')
          ..write('goalType: $goalType, ')
          ..write('targetVerses: $targetVerses, ')
          ..write('completedVerses: $completedVerses, ')
          ..write('targetPages: $targetPages, ')
          ..write('completedPages: $completedPages, ')
          ..write('targetMinutes: $targetMinutes, ')
          ..write('completedMinutes: $completedMinutes, ')
          ..write('isCompleted: $isCompleted')
          ..write(')'))
        .toString();
  }
}

class $StreakRecordsTable extends StreakRecords
    with TableInfo<$StreakRecordsTable, StreakRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StreakRecordsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _firebaseIdMeta = const VerificationMeta(
    'firebaseId',
  );
  @override
  late final GeneratedColumn<String> firebaseId = GeneratedColumn<String>(
    'firebase_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ownerUserIdMeta = const VerificationMeta(
    'ownerUserId',
  );
  @override
  late final GeneratedColumn<String> ownerUserId = GeneratedColumn<String>(
    'owner_user_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
    'sync_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('local'),
  );
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _streakDateMeta = const VerificationMeta(
    'streakDate',
  );
  @override
  late final GeneratedColumn<DateTime> streakDate = GeneratedColumn<DateTime>(
    'streak_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isCompletedMeta = const VerificationMeta(
    'isCompleted',
  );
  @override
  late final GeneratedColumn<bool> isCompleted = GeneratedColumn<bool>(
    'is_completed',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_completed" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _isMissedMeta = const VerificationMeta(
    'isMissed',
  );
  @override
  late final GeneratedColumn<bool> isMissed = GeneratedColumn<bool>(
    'is_missed',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_missed" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    createdAt,
    updatedAt,
    deletedAt,
    firebaseId,
    ownerUserId,
    syncStatus,
    id,
    streakDate,
    isCompleted,
    isMissed,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'streak_records';
  @override
  VerificationContext validateIntegrity(
    Insertable<StreakRecord> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('firebase_id')) {
      context.handle(
        _firebaseIdMeta,
        firebaseId.isAcceptableOrUnknown(data['firebase_id']!, _firebaseIdMeta),
      );
    }
    if (data.containsKey('owner_user_id')) {
      context.handle(
        _ownerUserIdMeta,
        ownerUserId.isAcceptableOrUnknown(
          data['owner_user_id']!,
          _ownerUserIdMeta,
        ),
      );
    }
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('streak_date')) {
      context.handle(
        _streakDateMeta,
        streakDate.isAcceptableOrUnknown(data['streak_date']!, _streakDateMeta),
      );
    } else if (isInserting) {
      context.missing(_streakDateMeta);
    }
    if (data.containsKey('is_completed')) {
      context.handle(
        _isCompletedMeta,
        isCompleted.isAcceptableOrUnknown(
          data['is_completed']!,
          _isCompletedMeta,
        ),
      );
    }
    if (data.containsKey('is_missed')) {
      context.handle(
        _isMissedMeta,
        isMissed.isAcceptableOrUnknown(data['is_missed']!, _isMissedMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  StreakRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StreakRecord(
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      firebaseId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}firebase_id'],
      ),
      ownerUserId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}owner_user_id'],
      ),
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_status'],
      )!,
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      streakDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}streak_date'],
      )!,
      isCompleted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_completed'],
      )!,
      isMissed: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_missed'],
      )!,
    );
  }

  @override
  $StreakRecordsTable createAlias(String alias) {
    return $StreakRecordsTable(attachedDatabase, alias);
  }
}

class StreakRecord extends DataClass implements Insertable<StreakRecord> {
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final String? firebaseId;
  final String? ownerUserId;
  final String syncStatus;
  final int id;
  final DateTime streakDate;
  final bool isCompleted;
  final bool isMissed;
  const StreakRecord({
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    this.firebaseId,
    this.ownerUserId,
    required this.syncStatus,
    required this.id,
    required this.streakDate,
    required this.isCompleted,
    required this.isMissed,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    if (!nullToAbsent || firebaseId != null) {
      map['firebase_id'] = Variable<String>(firebaseId);
    }
    if (!nullToAbsent || ownerUserId != null) {
      map['owner_user_id'] = Variable<String>(ownerUserId);
    }
    map['sync_status'] = Variable<String>(syncStatus);
    map['id'] = Variable<int>(id);
    map['streak_date'] = Variable<DateTime>(streakDate);
    map['is_completed'] = Variable<bool>(isCompleted);
    map['is_missed'] = Variable<bool>(isMissed);
    return map;
  }

  StreakRecordsCompanion toCompanion(bool nullToAbsent) {
    return StreakRecordsCompanion(
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      firebaseId: firebaseId == null && nullToAbsent
          ? const Value.absent()
          : Value(firebaseId),
      ownerUserId: ownerUserId == null && nullToAbsent
          ? const Value.absent()
          : Value(ownerUserId),
      syncStatus: Value(syncStatus),
      id: Value(id),
      streakDate: Value(streakDate),
      isCompleted: Value(isCompleted),
      isMissed: Value(isMissed),
    );
  }

  factory StreakRecord.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StreakRecord(
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      firebaseId: serializer.fromJson<String?>(json['firebaseId']),
      ownerUserId: serializer.fromJson<String?>(json['ownerUserId']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
      id: serializer.fromJson<int>(json['id']),
      streakDate: serializer.fromJson<DateTime>(json['streakDate']),
      isCompleted: serializer.fromJson<bool>(json['isCompleted']),
      isMissed: serializer.fromJson<bool>(json['isMissed']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'firebaseId': serializer.toJson<String?>(firebaseId),
      'ownerUserId': serializer.toJson<String?>(ownerUserId),
      'syncStatus': serializer.toJson<String>(syncStatus),
      'id': serializer.toJson<int>(id),
      'streakDate': serializer.toJson<DateTime>(streakDate),
      'isCompleted': serializer.toJson<bool>(isCompleted),
      'isMissed': serializer.toJson<bool>(isMissed),
    };
  }

  StreakRecord copyWith({
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    Value<String?> firebaseId = const Value.absent(),
    Value<String?> ownerUserId = const Value.absent(),
    String? syncStatus,
    int? id,
    DateTime? streakDate,
    bool? isCompleted,
    bool? isMissed,
  }) => StreakRecord(
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    firebaseId: firebaseId.present ? firebaseId.value : this.firebaseId,
    ownerUserId: ownerUserId.present ? ownerUserId.value : this.ownerUserId,
    syncStatus: syncStatus ?? this.syncStatus,
    id: id ?? this.id,
    streakDate: streakDate ?? this.streakDate,
    isCompleted: isCompleted ?? this.isCompleted,
    isMissed: isMissed ?? this.isMissed,
  );
  StreakRecord copyWithCompanion(StreakRecordsCompanion data) {
    return StreakRecord(
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      firebaseId: data.firebaseId.present
          ? data.firebaseId.value
          : this.firebaseId,
      ownerUserId: data.ownerUserId.present
          ? data.ownerUserId.value
          : this.ownerUserId,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
      id: data.id.present ? data.id.value : this.id,
      streakDate: data.streakDate.present
          ? data.streakDate.value
          : this.streakDate,
      isCompleted: data.isCompleted.present
          ? data.isCompleted.value
          : this.isCompleted,
      isMissed: data.isMissed.present ? data.isMissed.value : this.isMissed,
    );
  }

  @override
  String toString() {
    return (StringBuffer('StreakRecord(')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('firebaseId: $firebaseId, ')
          ..write('ownerUserId: $ownerUserId, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('id: $id, ')
          ..write('streakDate: $streakDate, ')
          ..write('isCompleted: $isCompleted, ')
          ..write('isMissed: $isMissed')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    createdAt,
    updatedAt,
    deletedAt,
    firebaseId,
    ownerUserId,
    syncStatus,
    id,
    streakDate,
    isCompleted,
    isMissed,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StreakRecord &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.firebaseId == this.firebaseId &&
          other.ownerUserId == this.ownerUserId &&
          other.syncStatus == this.syncStatus &&
          other.id == this.id &&
          other.streakDate == this.streakDate &&
          other.isCompleted == this.isCompleted &&
          other.isMissed == this.isMissed);
}

class StreakRecordsCompanion extends UpdateCompanion<StreakRecord> {
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<String?> firebaseId;
  final Value<String?> ownerUserId;
  final Value<String> syncStatus;
  final Value<int> id;
  final Value<DateTime> streakDate;
  final Value<bool> isCompleted;
  final Value<bool> isMissed;
  const StreakRecordsCompanion({
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.firebaseId = const Value.absent(),
    this.ownerUserId = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.id = const Value.absent(),
    this.streakDate = const Value.absent(),
    this.isCompleted = const Value.absent(),
    this.isMissed = const Value.absent(),
  });
  StreakRecordsCompanion.insert({
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.firebaseId = const Value.absent(),
    this.ownerUserId = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.id = const Value.absent(),
    required DateTime streakDate,
    this.isCompleted = const Value.absent(),
    this.isMissed = const Value.absent(),
  }) : createdAt = Value(createdAt),
       updatedAt = Value(updatedAt),
       streakDate = Value(streakDate);
  static Insertable<StreakRecord> custom({
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<String>? firebaseId,
    Expression<String>? ownerUserId,
    Expression<String>? syncStatus,
    Expression<int>? id,
    Expression<DateTime>? streakDate,
    Expression<bool>? isCompleted,
    Expression<bool>? isMissed,
  }) {
    return RawValuesInsertable({
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (firebaseId != null) 'firebase_id': firebaseId,
      if (ownerUserId != null) 'owner_user_id': ownerUserId,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (id != null) 'id': id,
      if (streakDate != null) 'streak_date': streakDate,
      if (isCompleted != null) 'is_completed': isCompleted,
      if (isMissed != null) 'is_missed': isMissed,
    });
  }

  StreakRecordsCompanion copyWith({
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<String?>? firebaseId,
    Value<String?>? ownerUserId,
    Value<String>? syncStatus,
    Value<int>? id,
    Value<DateTime>? streakDate,
    Value<bool>? isCompleted,
    Value<bool>? isMissed,
  }) {
    return StreakRecordsCompanion(
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      firebaseId: firebaseId ?? this.firebaseId,
      ownerUserId: ownerUserId ?? this.ownerUserId,
      syncStatus: syncStatus ?? this.syncStatus,
      id: id ?? this.id,
      streakDate: streakDate ?? this.streakDate,
      isCompleted: isCompleted ?? this.isCompleted,
      isMissed: isMissed ?? this.isMissed,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (firebaseId.present) {
      map['firebase_id'] = Variable<String>(firebaseId.value);
    }
    if (ownerUserId.present) {
      map['owner_user_id'] = Variable<String>(ownerUserId.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (streakDate.present) {
      map['streak_date'] = Variable<DateTime>(streakDate.value);
    }
    if (isCompleted.present) {
      map['is_completed'] = Variable<bool>(isCompleted.value);
    }
    if (isMissed.present) {
      map['is_missed'] = Variable<bool>(isMissed.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StreakRecordsCompanion(')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('firebaseId: $firebaseId, ')
          ..write('ownerUserId: $ownerUserId, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('id: $id, ')
          ..write('streakDate: $streakDate, ')
          ..write('isCompleted: $isCompleted, ')
          ..write('isMissed: $isMissed')
          ..write(')'))
        .toString();
  }
}

class $ReflectionNotesTable extends ReflectionNotes
    with TableInfo<$ReflectionNotesTable, ReflectionNote> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ReflectionNotesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _firebaseIdMeta = const VerificationMeta(
    'firebaseId',
  );
  @override
  late final GeneratedColumn<String> firebaseId = GeneratedColumn<String>(
    'firebase_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ownerUserIdMeta = const VerificationMeta(
    'ownerUserId',
  );
  @override
  late final GeneratedColumn<String> ownerUserId = GeneratedColumn<String>(
    'owner_user_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
    'sync_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('local'),
  );
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _verseKeyMeta = const VerificationMeta(
    'verseKey',
  );
  @override
  late final GeneratedColumn<String> verseKey = GeneratedColumn<String>(
    'verse_key',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sourceTypeMeta = const VerificationMeta(
    'sourceType',
  );
  @override
  late final GeneratedColumn<String> sourceType = GeneratedColumn<String>(
    'source_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('quran_ayah'),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _bodyMeta = const VerificationMeta('body');
  @override
  late final GeneratedColumn<String> body = GeneratedColumn<String>(
    'body',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    createdAt,
    updatedAt,
    deletedAt,
    firebaseId,
    ownerUserId,
    syncStatus,
    id,
    verseKey,
    sourceType,
    title,
    body,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'reflection_notes';
  @override
  VerificationContext validateIntegrity(
    Insertable<ReflectionNote> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('firebase_id')) {
      context.handle(
        _firebaseIdMeta,
        firebaseId.isAcceptableOrUnknown(data['firebase_id']!, _firebaseIdMeta),
      );
    }
    if (data.containsKey('owner_user_id')) {
      context.handle(
        _ownerUserIdMeta,
        ownerUserId.isAcceptableOrUnknown(
          data['owner_user_id']!,
          _ownerUserIdMeta,
        ),
      );
    }
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('verse_key')) {
      context.handle(
        _verseKeyMeta,
        verseKey.isAcceptableOrUnknown(data['verse_key']!, _verseKeyMeta),
      );
    }
    if (data.containsKey('source_type')) {
      context.handle(
        _sourceTypeMeta,
        sourceType.isAcceptableOrUnknown(data['source_type']!, _sourceTypeMeta),
      );
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    }
    if (data.containsKey('body')) {
      context.handle(
        _bodyMeta,
        body.isAcceptableOrUnknown(data['body']!, _bodyMeta),
      );
    } else if (isInserting) {
      context.missing(_bodyMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ReflectionNote map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ReflectionNote(
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      firebaseId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}firebase_id'],
      ),
      ownerUserId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}owner_user_id'],
      ),
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_status'],
      )!,
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      verseKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}verse_key'],
      ),
      sourceType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source_type'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      ),
      body: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}body'],
      )!,
    );
  }

  @override
  $ReflectionNotesTable createAlias(String alias) {
    return $ReflectionNotesTable(attachedDatabase, alias);
  }
}

class ReflectionNote extends DataClass implements Insertable<ReflectionNote> {
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final String? firebaseId;
  final String? ownerUserId;
  final String syncStatus;
  final int id;
  final String? verseKey;
  final String sourceType;
  final String? title;
  final String body;
  const ReflectionNote({
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    this.firebaseId,
    this.ownerUserId,
    required this.syncStatus,
    required this.id,
    this.verseKey,
    required this.sourceType,
    this.title,
    required this.body,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    if (!nullToAbsent || firebaseId != null) {
      map['firebase_id'] = Variable<String>(firebaseId);
    }
    if (!nullToAbsent || ownerUserId != null) {
      map['owner_user_id'] = Variable<String>(ownerUserId);
    }
    map['sync_status'] = Variable<String>(syncStatus);
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || verseKey != null) {
      map['verse_key'] = Variable<String>(verseKey);
    }
    map['source_type'] = Variable<String>(sourceType);
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String>(title);
    }
    map['body'] = Variable<String>(body);
    return map;
  }

  ReflectionNotesCompanion toCompanion(bool nullToAbsent) {
    return ReflectionNotesCompanion(
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      firebaseId: firebaseId == null && nullToAbsent
          ? const Value.absent()
          : Value(firebaseId),
      ownerUserId: ownerUserId == null && nullToAbsent
          ? const Value.absent()
          : Value(ownerUserId),
      syncStatus: Value(syncStatus),
      id: Value(id),
      verseKey: verseKey == null && nullToAbsent
          ? const Value.absent()
          : Value(verseKey),
      sourceType: Value(sourceType),
      title: title == null && nullToAbsent
          ? const Value.absent()
          : Value(title),
      body: Value(body),
    );
  }

  factory ReflectionNote.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ReflectionNote(
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      firebaseId: serializer.fromJson<String?>(json['firebaseId']),
      ownerUserId: serializer.fromJson<String?>(json['ownerUserId']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
      id: serializer.fromJson<int>(json['id']),
      verseKey: serializer.fromJson<String?>(json['verseKey']),
      sourceType: serializer.fromJson<String>(json['sourceType']),
      title: serializer.fromJson<String?>(json['title']),
      body: serializer.fromJson<String>(json['body']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'firebaseId': serializer.toJson<String?>(firebaseId),
      'ownerUserId': serializer.toJson<String?>(ownerUserId),
      'syncStatus': serializer.toJson<String>(syncStatus),
      'id': serializer.toJson<int>(id),
      'verseKey': serializer.toJson<String?>(verseKey),
      'sourceType': serializer.toJson<String>(sourceType),
      'title': serializer.toJson<String?>(title),
      'body': serializer.toJson<String>(body),
    };
  }

  ReflectionNote copyWith({
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    Value<String?> firebaseId = const Value.absent(),
    Value<String?> ownerUserId = const Value.absent(),
    String? syncStatus,
    int? id,
    Value<String?> verseKey = const Value.absent(),
    String? sourceType,
    Value<String?> title = const Value.absent(),
    String? body,
  }) => ReflectionNote(
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    firebaseId: firebaseId.present ? firebaseId.value : this.firebaseId,
    ownerUserId: ownerUserId.present ? ownerUserId.value : this.ownerUserId,
    syncStatus: syncStatus ?? this.syncStatus,
    id: id ?? this.id,
    verseKey: verseKey.present ? verseKey.value : this.verseKey,
    sourceType: sourceType ?? this.sourceType,
    title: title.present ? title.value : this.title,
    body: body ?? this.body,
  );
  ReflectionNote copyWithCompanion(ReflectionNotesCompanion data) {
    return ReflectionNote(
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      firebaseId: data.firebaseId.present
          ? data.firebaseId.value
          : this.firebaseId,
      ownerUserId: data.ownerUserId.present
          ? data.ownerUserId.value
          : this.ownerUserId,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
      id: data.id.present ? data.id.value : this.id,
      verseKey: data.verseKey.present ? data.verseKey.value : this.verseKey,
      sourceType: data.sourceType.present
          ? data.sourceType.value
          : this.sourceType,
      title: data.title.present ? data.title.value : this.title,
      body: data.body.present ? data.body.value : this.body,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ReflectionNote(')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('firebaseId: $firebaseId, ')
          ..write('ownerUserId: $ownerUserId, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('id: $id, ')
          ..write('verseKey: $verseKey, ')
          ..write('sourceType: $sourceType, ')
          ..write('title: $title, ')
          ..write('body: $body')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    createdAt,
    updatedAt,
    deletedAt,
    firebaseId,
    ownerUserId,
    syncStatus,
    id,
    verseKey,
    sourceType,
    title,
    body,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ReflectionNote &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.firebaseId == this.firebaseId &&
          other.ownerUserId == this.ownerUserId &&
          other.syncStatus == this.syncStatus &&
          other.id == this.id &&
          other.verseKey == this.verseKey &&
          other.sourceType == this.sourceType &&
          other.title == this.title &&
          other.body == this.body);
}

class ReflectionNotesCompanion extends UpdateCompanion<ReflectionNote> {
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<String?> firebaseId;
  final Value<String?> ownerUserId;
  final Value<String> syncStatus;
  final Value<int> id;
  final Value<String?> verseKey;
  final Value<String> sourceType;
  final Value<String?> title;
  final Value<String> body;
  const ReflectionNotesCompanion({
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.firebaseId = const Value.absent(),
    this.ownerUserId = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.id = const Value.absent(),
    this.verseKey = const Value.absent(),
    this.sourceType = const Value.absent(),
    this.title = const Value.absent(),
    this.body = const Value.absent(),
  });
  ReflectionNotesCompanion.insert({
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.firebaseId = const Value.absent(),
    this.ownerUserId = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.id = const Value.absent(),
    this.verseKey = const Value.absent(),
    this.sourceType = const Value.absent(),
    this.title = const Value.absent(),
    required String body,
  }) : createdAt = Value(createdAt),
       updatedAt = Value(updatedAt),
       body = Value(body);
  static Insertable<ReflectionNote> custom({
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<String>? firebaseId,
    Expression<String>? ownerUserId,
    Expression<String>? syncStatus,
    Expression<int>? id,
    Expression<String>? verseKey,
    Expression<String>? sourceType,
    Expression<String>? title,
    Expression<String>? body,
  }) {
    return RawValuesInsertable({
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (firebaseId != null) 'firebase_id': firebaseId,
      if (ownerUserId != null) 'owner_user_id': ownerUserId,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (id != null) 'id': id,
      if (verseKey != null) 'verse_key': verseKey,
      if (sourceType != null) 'source_type': sourceType,
      if (title != null) 'title': title,
      if (body != null) 'body': body,
    });
  }

  ReflectionNotesCompanion copyWith({
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<String?>? firebaseId,
    Value<String?>? ownerUserId,
    Value<String>? syncStatus,
    Value<int>? id,
    Value<String?>? verseKey,
    Value<String>? sourceType,
    Value<String?>? title,
    Value<String>? body,
  }) {
    return ReflectionNotesCompanion(
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      firebaseId: firebaseId ?? this.firebaseId,
      ownerUserId: ownerUserId ?? this.ownerUserId,
      syncStatus: syncStatus ?? this.syncStatus,
      id: id ?? this.id,
      verseKey: verseKey ?? this.verseKey,
      sourceType: sourceType ?? this.sourceType,
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (firebaseId.present) {
      map['firebase_id'] = Variable<String>(firebaseId.value);
    }
    if (ownerUserId.present) {
      map['owner_user_id'] = Variable<String>(ownerUserId.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (verseKey.present) {
      map['verse_key'] = Variable<String>(verseKey.value);
    }
    if (sourceType.present) {
      map['source_type'] = Variable<String>(sourceType.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (body.present) {
      map['body'] = Variable<String>(body.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReflectionNotesCompanion(')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('firebaseId: $firebaseId, ')
          ..write('ownerUserId: $ownerUserId, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('id: $id, ')
          ..write('verseKey: $verseKey, ')
          ..write('sourceType: $sourceType, ')
          ..write('title: $title, ')
          ..write('body: $body')
          ..write(')'))
        .toString();
  }
}

class $FavoriteBookmarksTable extends FavoriteBookmarks
    with TableInfo<$FavoriteBookmarksTable, FavoriteBookmark> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FavoriteBookmarksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _firebaseIdMeta = const VerificationMeta(
    'firebaseId',
  );
  @override
  late final GeneratedColumn<String> firebaseId = GeneratedColumn<String>(
    'firebase_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ownerUserIdMeta = const VerificationMeta(
    'ownerUserId',
  );
  @override
  late final GeneratedColumn<String> ownerUserId = GeneratedColumn<String>(
    'owner_user_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
    'sync_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('local'),
  );
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _itemTypeMeta = const VerificationMeta(
    'itemType',
  );
  @override
  late final GeneratedColumn<String> itemType = GeneratedColumn<String>(
    'item_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _itemKeyMeta = const VerificationMeta(
    'itemKey',
  );
  @override
  late final GeneratedColumn<String> itemKey = GeneratedColumn<String>(
    'item_key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _labelMeta = const VerificationMeta('label');
  @override
  late final GeneratedColumn<String> label = GeneratedColumn<String>(
    'label',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    createdAt,
    updatedAt,
    deletedAt,
    firebaseId,
    ownerUserId,
    syncStatus,
    id,
    itemType,
    itemKey,
    label,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'favorite_bookmarks';
  @override
  VerificationContext validateIntegrity(
    Insertable<FavoriteBookmark> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('firebase_id')) {
      context.handle(
        _firebaseIdMeta,
        firebaseId.isAcceptableOrUnknown(data['firebase_id']!, _firebaseIdMeta),
      );
    }
    if (data.containsKey('owner_user_id')) {
      context.handle(
        _ownerUserIdMeta,
        ownerUserId.isAcceptableOrUnknown(
          data['owner_user_id']!,
          _ownerUserIdMeta,
        ),
      );
    }
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('item_type')) {
      context.handle(
        _itemTypeMeta,
        itemType.isAcceptableOrUnknown(data['item_type']!, _itemTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_itemTypeMeta);
    }
    if (data.containsKey('item_key')) {
      context.handle(
        _itemKeyMeta,
        itemKey.isAcceptableOrUnknown(data['item_key']!, _itemKeyMeta),
      );
    } else if (isInserting) {
      context.missing(_itemKeyMeta);
    }
    if (data.containsKey('label')) {
      context.handle(
        _labelMeta,
        label.isAcceptableOrUnknown(data['label']!, _labelMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FavoriteBookmark map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FavoriteBookmark(
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      firebaseId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}firebase_id'],
      ),
      ownerUserId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}owner_user_id'],
      ),
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_status'],
      )!,
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      itemType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}item_type'],
      )!,
      itemKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}item_key'],
      )!,
      label: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}label'],
      ),
    );
  }

  @override
  $FavoriteBookmarksTable createAlias(String alias) {
    return $FavoriteBookmarksTable(attachedDatabase, alias);
  }
}

class FavoriteBookmark extends DataClass
    implements Insertable<FavoriteBookmark> {
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final String? firebaseId;
  final String? ownerUserId;
  final String syncStatus;
  final int id;
  final String itemType;
  final String itemKey;
  final String? label;
  const FavoriteBookmark({
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    this.firebaseId,
    this.ownerUserId,
    required this.syncStatus,
    required this.id,
    required this.itemType,
    required this.itemKey,
    this.label,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    if (!nullToAbsent || firebaseId != null) {
      map['firebase_id'] = Variable<String>(firebaseId);
    }
    if (!nullToAbsent || ownerUserId != null) {
      map['owner_user_id'] = Variable<String>(ownerUserId);
    }
    map['sync_status'] = Variable<String>(syncStatus);
    map['id'] = Variable<int>(id);
    map['item_type'] = Variable<String>(itemType);
    map['item_key'] = Variable<String>(itemKey);
    if (!nullToAbsent || label != null) {
      map['label'] = Variable<String>(label);
    }
    return map;
  }

  FavoriteBookmarksCompanion toCompanion(bool nullToAbsent) {
    return FavoriteBookmarksCompanion(
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      firebaseId: firebaseId == null && nullToAbsent
          ? const Value.absent()
          : Value(firebaseId),
      ownerUserId: ownerUserId == null && nullToAbsent
          ? const Value.absent()
          : Value(ownerUserId),
      syncStatus: Value(syncStatus),
      id: Value(id),
      itemType: Value(itemType),
      itemKey: Value(itemKey),
      label: label == null && nullToAbsent
          ? const Value.absent()
          : Value(label),
    );
  }

  factory FavoriteBookmark.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FavoriteBookmark(
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      firebaseId: serializer.fromJson<String?>(json['firebaseId']),
      ownerUserId: serializer.fromJson<String?>(json['ownerUserId']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
      id: serializer.fromJson<int>(json['id']),
      itemType: serializer.fromJson<String>(json['itemType']),
      itemKey: serializer.fromJson<String>(json['itemKey']),
      label: serializer.fromJson<String?>(json['label']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'firebaseId': serializer.toJson<String?>(firebaseId),
      'ownerUserId': serializer.toJson<String?>(ownerUserId),
      'syncStatus': serializer.toJson<String>(syncStatus),
      'id': serializer.toJson<int>(id),
      'itemType': serializer.toJson<String>(itemType),
      'itemKey': serializer.toJson<String>(itemKey),
      'label': serializer.toJson<String?>(label),
    };
  }

  FavoriteBookmark copyWith({
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    Value<String?> firebaseId = const Value.absent(),
    Value<String?> ownerUserId = const Value.absent(),
    String? syncStatus,
    int? id,
    String? itemType,
    String? itemKey,
    Value<String?> label = const Value.absent(),
  }) => FavoriteBookmark(
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    firebaseId: firebaseId.present ? firebaseId.value : this.firebaseId,
    ownerUserId: ownerUserId.present ? ownerUserId.value : this.ownerUserId,
    syncStatus: syncStatus ?? this.syncStatus,
    id: id ?? this.id,
    itemType: itemType ?? this.itemType,
    itemKey: itemKey ?? this.itemKey,
    label: label.present ? label.value : this.label,
  );
  FavoriteBookmark copyWithCompanion(FavoriteBookmarksCompanion data) {
    return FavoriteBookmark(
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      firebaseId: data.firebaseId.present
          ? data.firebaseId.value
          : this.firebaseId,
      ownerUserId: data.ownerUserId.present
          ? data.ownerUserId.value
          : this.ownerUserId,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
      id: data.id.present ? data.id.value : this.id,
      itemType: data.itemType.present ? data.itemType.value : this.itemType,
      itemKey: data.itemKey.present ? data.itemKey.value : this.itemKey,
      label: data.label.present ? data.label.value : this.label,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FavoriteBookmark(')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('firebaseId: $firebaseId, ')
          ..write('ownerUserId: $ownerUserId, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('id: $id, ')
          ..write('itemType: $itemType, ')
          ..write('itemKey: $itemKey, ')
          ..write('label: $label')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    createdAt,
    updatedAt,
    deletedAt,
    firebaseId,
    ownerUserId,
    syncStatus,
    id,
    itemType,
    itemKey,
    label,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FavoriteBookmark &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.firebaseId == this.firebaseId &&
          other.ownerUserId == this.ownerUserId &&
          other.syncStatus == this.syncStatus &&
          other.id == this.id &&
          other.itemType == this.itemType &&
          other.itemKey == this.itemKey &&
          other.label == this.label);
}

class FavoriteBookmarksCompanion extends UpdateCompanion<FavoriteBookmark> {
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<String?> firebaseId;
  final Value<String?> ownerUserId;
  final Value<String> syncStatus;
  final Value<int> id;
  final Value<String> itemType;
  final Value<String> itemKey;
  final Value<String?> label;
  const FavoriteBookmarksCompanion({
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.firebaseId = const Value.absent(),
    this.ownerUserId = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.id = const Value.absent(),
    this.itemType = const Value.absent(),
    this.itemKey = const Value.absent(),
    this.label = const Value.absent(),
  });
  FavoriteBookmarksCompanion.insert({
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.firebaseId = const Value.absent(),
    this.ownerUserId = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.id = const Value.absent(),
    required String itemType,
    required String itemKey,
    this.label = const Value.absent(),
  }) : createdAt = Value(createdAt),
       updatedAt = Value(updatedAt),
       itemType = Value(itemType),
       itemKey = Value(itemKey);
  static Insertable<FavoriteBookmark> custom({
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<String>? firebaseId,
    Expression<String>? ownerUserId,
    Expression<String>? syncStatus,
    Expression<int>? id,
    Expression<String>? itemType,
    Expression<String>? itemKey,
    Expression<String>? label,
  }) {
    return RawValuesInsertable({
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (firebaseId != null) 'firebase_id': firebaseId,
      if (ownerUserId != null) 'owner_user_id': ownerUserId,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (id != null) 'id': id,
      if (itemType != null) 'item_type': itemType,
      if (itemKey != null) 'item_key': itemKey,
      if (label != null) 'label': label,
    });
  }

  FavoriteBookmarksCompanion copyWith({
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<String?>? firebaseId,
    Value<String?>? ownerUserId,
    Value<String>? syncStatus,
    Value<int>? id,
    Value<String>? itemType,
    Value<String>? itemKey,
    Value<String?>? label,
  }) {
    return FavoriteBookmarksCompanion(
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      firebaseId: firebaseId ?? this.firebaseId,
      ownerUserId: ownerUserId ?? this.ownerUserId,
      syncStatus: syncStatus ?? this.syncStatus,
      id: id ?? this.id,
      itemType: itemType ?? this.itemType,
      itemKey: itemKey ?? this.itemKey,
      label: label ?? this.label,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (firebaseId.present) {
      map['firebase_id'] = Variable<String>(firebaseId.value);
    }
    if (ownerUserId.present) {
      map['owner_user_id'] = Variable<String>(ownerUserId.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (itemType.present) {
      map['item_type'] = Variable<String>(itemType.value);
    }
    if (itemKey.present) {
      map['item_key'] = Variable<String>(itemKey.value);
    }
    if (label.present) {
      map['label'] = Variable<String>(label.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FavoriteBookmarksCompanion(')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('firebaseId: $firebaseId, ')
          ..write('ownerUserId: $ownerUserId, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('id: $id, ')
          ..write('itemType: $itemType, ')
          ..write('itemKey: $itemKey, ')
          ..write('label: $label')
          ..write(')'))
        .toString();
  }
}

class $AdhkarCategoriesTable extends AdhkarCategories
    with TableInfo<$AdhkarCategoriesTable, AdhkarCategory> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AdhkarCategoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _categoryKeyMeta = const VerificationMeta(
    'categoryKey',
  );
  @override
  late final GeneratedColumn<String> categoryKey = GeneratedColumn<String>(
    'category_key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _titleArabicMeta = const VerificationMeta(
    'titleArabic',
  );
  @override
  late final GeneratedColumn<String> titleArabic = GeneratedColumn<String>(
    'title_arabic',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleEnglishMeta = const VerificationMeta(
    'titleEnglish',
  );
  @override
  late final GeneratedColumn<String> titleEnglish = GeneratedColumn<String>(
    'title_english',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sourceMeta = const VerificationMeta('source');
  @override
  late final GeneratedColumn<String> source = GeneratedColumn<String>(
    'source',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    createdAt,
    updatedAt,
    id,
    categoryKey,
    titleArabic,
    titleEnglish,
    source,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'adhkar_categories';
  @override
  VerificationContext validateIntegrity(
    Insertable<AdhkarCategory> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('category_key')) {
      context.handle(
        _categoryKeyMeta,
        categoryKey.isAcceptableOrUnknown(
          data['category_key']!,
          _categoryKeyMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_categoryKeyMeta);
    }
    if (data.containsKey('title_arabic')) {
      context.handle(
        _titleArabicMeta,
        titleArabic.isAcceptableOrUnknown(
          data['title_arabic']!,
          _titleArabicMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_titleArabicMeta);
    }
    if (data.containsKey('title_english')) {
      context.handle(
        _titleEnglishMeta,
        titleEnglish.isAcceptableOrUnknown(
          data['title_english']!,
          _titleEnglishMeta,
        ),
      );
    }
    if (data.containsKey('source')) {
      context.handle(
        _sourceMeta,
        source.isAcceptableOrUnknown(data['source']!, _sourceMeta),
      );
    } else if (isInserting) {
      context.missing(_sourceMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AdhkarCategory map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AdhkarCategory(
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      categoryKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category_key'],
      )!,
      titleArabic: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title_arabic'],
      )!,
      titleEnglish: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title_english'],
      ),
      source: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source'],
      )!,
    );
  }

  @override
  $AdhkarCategoriesTable createAlias(String alias) {
    return $AdhkarCategoriesTable(attachedDatabase, alias);
  }
}

class AdhkarCategory extends DataClass implements Insertable<AdhkarCategory> {
  final DateTime createdAt;
  final DateTime updatedAt;
  final int id;
  final String categoryKey;
  final String titleArabic;
  final String? titleEnglish;
  final String source;
  const AdhkarCategory({
    required this.createdAt,
    required this.updatedAt,
    required this.id,
    required this.categoryKey,
    required this.titleArabic,
    this.titleEnglish,
    required this.source,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['id'] = Variable<int>(id);
    map['category_key'] = Variable<String>(categoryKey);
    map['title_arabic'] = Variable<String>(titleArabic);
    if (!nullToAbsent || titleEnglish != null) {
      map['title_english'] = Variable<String>(titleEnglish);
    }
    map['source'] = Variable<String>(source);
    return map;
  }

  AdhkarCategoriesCompanion toCompanion(bool nullToAbsent) {
    return AdhkarCategoriesCompanion(
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      id: Value(id),
      categoryKey: Value(categoryKey),
      titleArabic: Value(titleArabic),
      titleEnglish: titleEnglish == null && nullToAbsent
          ? const Value.absent()
          : Value(titleEnglish),
      source: Value(source),
    );
  }

  factory AdhkarCategory.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AdhkarCategory(
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      id: serializer.fromJson<int>(json['id']),
      categoryKey: serializer.fromJson<String>(json['categoryKey']),
      titleArabic: serializer.fromJson<String>(json['titleArabic']),
      titleEnglish: serializer.fromJson<String?>(json['titleEnglish']),
      source: serializer.fromJson<String>(json['source']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'id': serializer.toJson<int>(id),
      'categoryKey': serializer.toJson<String>(categoryKey),
      'titleArabic': serializer.toJson<String>(titleArabic),
      'titleEnglish': serializer.toJson<String?>(titleEnglish),
      'source': serializer.toJson<String>(source),
    };
  }

  AdhkarCategory copyWith({
    DateTime? createdAt,
    DateTime? updatedAt,
    int? id,
    String? categoryKey,
    String? titleArabic,
    Value<String?> titleEnglish = const Value.absent(),
    String? source,
  }) => AdhkarCategory(
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    id: id ?? this.id,
    categoryKey: categoryKey ?? this.categoryKey,
    titleArabic: titleArabic ?? this.titleArabic,
    titleEnglish: titleEnglish.present ? titleEnglish.value : this.titleEnglish,
    source: source ?? this.source,
  );
  AdhkarCategory copyWithCompanion(AdhkarCategoriesCompanion data) {
    return AdhkarCategory(
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      id: data.id.present ? data.id.value : this.id,
      categoryKey: data.categoryKey.present
          ? data.categoryKey.value
          : this.categoryKey,
      titleArabic: data.titleArabic.present
          ? data.titleArabic.value
          : this.titleArabic,
      titleEnglish: data.titleEnglish.present
          ? data.titleEnglish.value
          : this.titleEnglish,
      source: data.source.present ? data.source.value : this.source,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AdhkarCategory(')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('id: $id, ')
          ..write('categoryKey: $categoryKey, ')
          ..write('titleArabic: $titleArabic, ')
          ..write('titleEnglish: $titleEnglish, ')
          ..write('source: $source')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    createdAt,
    updatedAt,
    id,
    categoryKey,
    titleArabic,
    titleEnglish,
    source,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AdhkarCategory &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.id == this.id &&
          other.categoryKey == this.categoryKey &&
          other.titleArabic == this.titleArabic &&
          other.titleEnglish == this.titleEnglish &&
          other.source == this.source);
}

class AdhkarCategoriesCompanion extends UpdateCompanion<AdhkarCategory> {
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> id;
  final Value<String> categoryKey;
  final Value<String> titleArabic;
  final Value<String?> titleEnglish;
  final Value<String> source;
  const AdhkarCategoriesCompanion({
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.id = const Value.absent(),
    this.categoryKey = const Value.absent(),
    this.titleArabic = const Value.absent(),
    this.titleEnglish = const Value.absent(),
    this.source = const Value.absent(),
  });
  AdhkarCategoriesCompanion.insert({
    required DateTime createdAt,
    required DateTime updatedAt,
    this.id = const Value.absent(),
    required String categoryKey,
    required String titleArabic,
    this.titleEnglish = const Value.absent(),
    required String source,
  }) : createdAt = Value(createdAt),
       updatedAt = Value(updatedAt),
       categoryKey = Value(categoryKey),
       titleArabic = Value(titleArabic),
       source = Value(source);
  static Insertable<AdhkarCategory> custom({
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? id,
    Expression<String>? categoryKey,
    Expression<String>? titleArabic,
    Expression<String>? titleEnglish,
    Expression<String>? source,
  }) {
    return RawValuesInsertable({
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (id != null) 'id': id,
      if (categoryKey != null) 'category_key': categoryKey,
      if (titleArabic != null) 'title_arabic': titleArabic,
      if (titleEnglish != null) 'title_english': titleEnglish,
      if (source != null) 'source': source,
    });
  }

  AdhkarCategoriesCompanion copyWith({
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? id,
    Value<String>? categoryKey,
    Value<String>? titleArabic,
    Value<String?>? titleEnglish,
    Value<String>? source,
  }) {
    return AdhkarCategoriesCompanion(
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      id: id ?? this.id,
      categoryKey: categoryKey ?? this.categoryKey,
      titleArabic: titleArabic ?? this.titleArabic,
      titleEnglish: titleEnglish ?? this.titleEnglish,
      source: source ?? this.source,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (categoryKey.present) {
      map['category_key'] = Variable<String>(categoryKey.value);
    }
    if (titleArabic.present) {
      map['title_arabic'] = Variable<String>(titleArabic.value);
    }
    if (titleEnglish.present) {
      map['title_english'] = Variable<String>(titleEnglish.value);
    }
    if (source.present) {
      map['source'] = Variable<String>(source.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AdhkarCategoriesCompanion(')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('id: $id, ')
          ..write('categoryKey: $categoryKey, ')
          ..write('titleArabic: $titleArabic, ')
          ..write('titleEnglish: $titleEnglish, ')
          ..write('source: $source')
          ..write(')'))
        .toString();
  }
}

class $AdhkarItemsTable extends AdhkarItems
    with TableInfo<$AdhkarItemsTable, AdhkarItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AdhkarItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _itemKeyMeta = const VerificationMeta(
    'itemKey',
  );
  @override
  late final GeneratedColumn<String> itemKey = GeneratedColumn<String>(
    'item_key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _categoryKeyMeta = const VerificationMeta(
    'categoryKey',
  );
  @override
  late final GeneratedColumn<String> categoryKey = GeneratedColumn<String>(
    'category_key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _textArabicMeta = const VerificationMeta(
    'textArabic',
  );
  @override
  late final GeneratedColumn<String> textArabic = GeneratedColumn<String>(
    'text_arabic',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _textEnglishMeta = const VerificationMeta(
    'textEnglish',
  );
  @override
  late final GeneratedColumn<String> textEnglish = GeneratedColumn<String>(
    'text_english',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _repeatCountMeta = const VerificationMeta(
    'repeatCount',
  );
  @override
  late final GeneratedColumn<int> repeatCount = GeneratedColumn<int>(
    'repeat_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _sourceMeta = const VerificationMeta('source');
  @override
  late final GeneratedColumn<String> source = GeneratedColumn<String>(
    'source',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sourceReferenceMeta = const VerificationMeta(
    'sourceReference',
  );
  @override
  late final GeneratedColumn<String> sourceReference = GeneratedColumn<String>(
    'source_reference',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    createdAt,
    updatedAt,
    id,
    itemKey,
    categoryKey,
    textArabic,
    textEnglish,
    repeatCount,
    source,
    sourceReference,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'adhkar_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<AdhkarItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('item_key')) {
      context.handle(
        _itemKeyMeta,
        itemKey.isAcceptableOrUnknown(data['item_key']!, _itemKeyMeta),
      );
    } else if (isInserting) {
      context.missing(_itemKeyMeta);
    }
    if (data.containsKey('category_key')) {
      context.handle(
        _categoryKeyMeta,
        categoryKey.isAcceptableOrUnknown(
          data['category_key']!,
          _categoryKeyMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_categoryKeyMeta);
    }
    if (data.containsKey('text_arabic')) {
      context.handle(
        _textArabicMeta,
        textArabic.isAcceptableOrUnknown(data['text_arabic']!, _textArabicMeta),
      );
    } else if (isInserting) {
      context.missing(_textArabicMeta);
    }
    if (data.containsKey('text_english')) {
      context.handle(
        _textEnglishMeta,
        textEnglish.isAcceptableOrUnknown(
          data['text_english']!,
          _textEnglishMeta,
        ),
      );
    }
    if (data.containsKey('repeat_count')) {
      context.handle(
        _repeatCountMeta,
        repeatCount.isAcceptableOrUnknown(
          data['repeat_count']!,
          _repeatCountMeta,
        ),
      );
    }
    if (data.containsKey('source')) {
      context.handle(
        _sourceMeta,
        source.isAcceptableOrUnknown(data['source']!, _sourceMeta),
      );
    } else if (isInserting) {
      context.missing(_sourceMeta);
    }
    if (data.containsKey('source_reference')) {
      context.handle(
        _sourceReferenceMeta,
        sourceReference.isAcceptableOrUnknown(
          data['source_reference']!,
          _sourceReferenceMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_sourceReferenceMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AdhkarItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AdhkarItem(
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      itemKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}item_key'],
      )!,
      categoryKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category_key'],
      )!,
      textArabic: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}text_arabic'],
      )!,
      textEnglish: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}text_english'],
      ),
      repeatCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}repeat_count'],
      )!,
      source: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source'],
      )!,
      sourceReference: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source_reference'],
      )!,
    );
  }

  @override
  $AdhkarItemsTable createAlias(String alias) {
    return $AdhkarItemsTable(attachedDatabase, alias);
  }
}

class AdhkarItem extends DataClass implements Insertable<AdhkarItem> {
  final DateTime createdAt;
  final DateTime updatedAt;
  final int id;
  final String itemKey;
  final String categoryKey;
  final String textArabic;
  final String? textEnglish;
  final int repeatCount;
  final String source;
  final String sourceReference;
  const AdhkarItem({
    required this.createdAt,
    required this.updatedAt,
    required this.id,
    required this.itemKey,
    required this.categoryKey,
    required this.textArabic,
    this.textEnglish,
    required this.repeatCount,
    required this.source,
    required this.sourceReference,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['id'] = Variable<int>(id);
    map['item_key'] = Variable<String>(itemKey);
    map['category_key'] = Variable<String>(categoryKey);
    map['text_arabic'] = Variable<String>(textArabic);
    if (!nullToAbsent || textEnglish != null) {
      map['text_english'] = Variable<String>(textEnglish);
    }
    map['repeat_count'] = Variable<int>(repeatCount);
    map['source'] = Variable<String>(source);
    map['source_reference'] = Variable<String>(sourceReference);
    return map;
  }

  AdhkarItemsCompanion toCompanion(bool nullToAbsent) {
    return AdhkarItemsCompanion(
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      id: Value(id),
      itemKey: Value(itemKey),
      categoryKey: Value(categoryKey),
      textArabic: Value(textArabic),
      textEnglish: textEnglish == null && nullToAbsent
          ? const Value.absent()
          : Value(textEnglish),
      repeatCount: Value(repeatCount),
      source: Value(source),
      sourceReference: Value(sourceReference),
    );
  }

  factory AdhkarItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AdhkarItem(
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      id: serializer.fromJson<int>(json['id']),
      itemKey: serializer.fromJson<String>(json['itemKey']),
      categoryKey: serializer.fromJson<String>(json['categoryKey']),
      textArabic: serializer.fromJson<String>(json['textArabic']),
      textEnglish: serializer.fromJson<String?>(json['textEnglish']),
      repeatCount: serializer.fromJson<int>(json['repeatCount']),
      source: serializer.fromJson<String>(json['source']),
      sourceReference: serializer.fromJson<String>(json['sourceReference']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'id': serializer.toJson<int>(id),
      'itemKey': serializer.toJson<String>(itemKey),
      'categoryKey': serializer.toJson<String>(categoryKey),
      'textArabic': serializer.toJson<String>(textArabic),
      'textEnglish': serializer.toJson<String?>(textEnglish),
      'repeatCount': serializer.toJson<int>(repeatCount),
      'source': serializer.toJson<String>(source),
      'sourceReference': serializer.toJson<String>(sourceReference),
    };
  }

  AdhkarItem copyWith({
    DateTime? createdAt,
    DateTime? updatedAt,
    int? id,
    String? itemKey,
    String? categoryKey,
    String? textArabic,
    Value<String?> textEnglish = const Value.absent(),
    int? repeatCount,
    String? source,
    String? sourceReference,
  }) => AdhkarItem(
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    id: id ?? this.id,
    itemKey: itemKey ?? this.itemKey,
    categoryKey: categoryKey ?? this.categoryKey,
    textArabic: textArabic ?? this.textArabic,
    textEnglish: textEnglish.present ? textEnglish.value : this.textEnglish,
    repeatCount: repeatCount ?? this.repeatCount,
    source: source ?? this.source,
    sourceReference: sourceReference ?? this.sourceReference,
  );
  AdhkarItem copyWithCompanion(AdhkarItemsCompanion data) {
    return AdhkarItem(
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      id: data.id.present ? data.id.value : this.id,
      itemKey: data.itemKey.present ? data.itemKey.value : this.itemKey,
      categoryKey: data.categoryKey.present
          ? data.categoryKey.value
          : this.categoryKey,
      textArabic: data.textArabic.present
          ? data.textArabic.value
          : this.textArabic,
      textEnglish: data.textEnglish.present
          ? data.textEnglish.value
          : this.textEnglish,
      repeatCount: data.repeatCount.present
          ? data.repeatCount.value
          : this.repeatCount,
      source: data.source.present ? data.source.value : this.source,
      sourceReference: data.sourceReference.present
          ? data.sourceReference.value
          : this.sourceReference,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AdhkarItem(')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('id: $id, ')
          ..write('itemKey: $itemKey, ')
          ..write('categoryKey: $categoryKey, ')
          ..write('textArabic: $textArabic, ')
          ..write('textEnglish: $textEnglish, ')
          ..write('repeatCount: $repeatCount, ')
          ..write('source: $source, ')
          ..write('sourceReference: $sourceReference')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    createdAt,
    updatedAt,
    id,
    itemKey,
    categoryKey,
    textArabic,
    textEnglish,
    repeatCount,
    source,
    sourceReference,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AdhkarItem &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.id == this.id &&
          other.itemKey == this.itemKey &&
          other.categoryKey == this.categoryKey &&
          other.textArabic == this.textArabic &&
          other.textEnglish == this.textEnglish &&
          other.repeatCount == this.repeatCount &&
          other.source == this.source &&
          other.sourceReference == this.sourceReference);
}

class AdhkarItemsCompanion extends UpdateCompanion<AdhkarItem> {
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> id;
  final Value<String> itemKey;
  final Value<String> categoryKey;
  final Value<String> textArabic;
  final Value<String?> textEnglish;
  final Value<int> repeatCount;
  final Value<String> source;
  final Value<String> sourceReference;
  const AdhkarItemsCompanion({
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.id = const Value.absent(),
    this.itemKey = const Value.absent(),
    this.categoryKey = const Value.absent(),
    this.textArabic = const Value.absent(),
    this.textEnglish = const Value.absent(),
    this.repeatCount = const Value.absent(),
    this.source = const Value.absent(),
    this.sourceReference = const Value.absent(),
  });
  AdhkarItemsCompanion.insert({
    required DateTime createdAt,
    required DateTime updatedAt,
    this.id = const Value.absent(),
    required String itemKey,
    required String categoryKey,
    required String textArabic,
    this.textEnglish = const Value.absent(),
    this.repeatCount = const Value.absent(),
    required String source,
    required String sourceReference,
  }) : createdAt = Value(createdAt),
       updatedAt = Value(updatedAt),
       itemKey = Value(itemKey),
       categoryKey = Value(categoryKey),
       textArabic = Value(textArabic),
       source = Value(source),
       sourceReference = Value(sourceReference);
  static Insertable<AdhkarItem> custom({
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? id,
    Expression<String>? itemKey,
    Expression<String>? categoryKey,
    Expression<String>? textArabic,
    Expression<String>? textEnglish,
    Expression<int>? repeatCount,
    Expression<String>? source,
    Expression<String>? sourceReference,
  }) {
    return RawValuesInsertable({
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (id != null) 'id': id,
      if (itemKey != null) 'item_key': itemKey,
      if (categoryKey != null) 'category_key': categoryKey,
      if (textArabic != null) 'text_arabic': textArabic,
      if (textEnglish != null) 'text_english': textEnglish,
      if (repeatCount != null) 'repeat_count': repeatCount,
      if (source != null) 'source': source,
      if (sourceReference != null) 'source_reference': sourceReference,
    });
  }

  AdhkarItemsCompanion copyWith({
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? id,
    Value<String>? itemKey,
    Value<String>? categoryKey,
    Value<String>? textArabic,
    Value<String?>? textEnglish,
    Value<int>? repeatCount,
    Value<String>? source,
    Value<String>? sourceReference,
  }) {
    return AdhkarItemsCompanion(
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      id: id ?? this.id,
      itemKey: itemKey ?? this.itemKey,
      categoryKey: categoryKey ?? this.categoryKey,
      textArabic: textArabic ?? this.textArabic,
      textEnglish: textEnglish ?? this.textEnglish,
      repeatCount: repeatCount ?? this.repeatCount,
      source: source ?? this.source,
      sourceReference: sourceReference ?? this.sourceReference,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (itemKey.present) {
      map['item_key'] = Variable<String>(itemKey.value);
    }
    if (categoryKey.present) {
      map['category_key'] = Variable<String>(categoryKey.value);
    }
    if (textArabic.present) {
      map['text_arabic'] = Variable<String>(textArabic.value);
    }
    if (textEnglish.present) {
      map['text_english'] = Variable<String>(textEnglish.value);
    }
    if (repeatCount.present) {
      map['repeat_count'] = Variable<int>(repeatCount.value);
    }
    if (source.present) {
      map['source'] = Variable<String>(source.value);
    }
    if (sourceReference.present) {
      map['source_reference'] = Variable<String>(sourceReference.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AdhkarItemsCompanion(')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('id: $id, ')
          ..write('itemKey: $itemKey, ')
          ..write('categoryKey: $categoryKey, ')
          ..write('textArabic: $textArabic, ')
          ..write('textEnglish: $textEnglish, ')
          ..write('repeatCount: $repeatCount, ')
          ..write('source: $source, ')
          ..write('sourceReference: $sourceReference')
          ..write(')'))
        .toString();
  }
}

class $AdhkarProgressCountersTable extends AdhkarProgressCounters
    with TableInfo<$AdhkarProgressCountersTable, AdhkarProgressCounter> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AdhkarProgressCountersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _firebaseIdMeta = const VerificationMeta(
    'firebaseId',
  );
  @override
  late final GeneratedColumn<String> firebaseId = GeneratedColumn<String>(
    'firebase_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ownerUserIdMeta = const VerificationMeta(
    'ownerUserId',
  );
  @override
  late final GeneratedColumn<String> ownerUserId = GeneratedColumn<String>(
    'owner_user_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
    'sync_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('local'),
  );
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _itemKeyMeta = const VerificationMeta(
    'itemKey',
  );
  @override
  late final GeneratedColumn<String> itemKey = GeneratedColumn<String>(
    'item_key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _progressDateMeta = const VerificationMeta(
    'progressDate',
  );
  @override
  late final GeneratedColumn<DateTime> progressDate = GeneratedColumn<DateTime>(
    'progress_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _currentCountMeta = const VerificationMeta(
    'currentCount',
  );
  @override
  late final GeneratedColumn<int> currentCount = GeneratedColumn<int>(
    'current_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _isCompletedMeta = const VerificationMeta(
    'isCompleted',
  );
  @override
  late final GeneratedColumn<bool> isCompleted = GeneratedColumn<bool>(
    'is_completed',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_completed" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    createdAt,
    updatedAt,
    deletedAt,
    firebaseId,
    ownerUserId,
    syncStatus,
    id,
    itemKey,
    progressDate,
    currentCount,
    isCompleted,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'adhkar_progress_counters';
  @override
  VerificationContext validateIntegrity(
    Insertable<AdhkarProgressCounter> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('firebase_id')) {
      context.handle(
        _firebaseIdMeta,
        firebaseId.isAcceptableOrUnknown(data['firebase_id']!, _firebaseIdMeta),
      );
    }
    if (data.containsKey('owner_user_id')) {
      context.handle(
        _ownerUserIdMeta,
        ownerUserId.isAcceptableOrUnknown(
          data['owner_user_id']!,
          _ownerUserIdMeta,
        ),
      );
    }
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('item_key')) {
      context.handle(
        _itemKeyMeta,
        itemKey.isAcceptableOrUnknown(data['item_key']!, _itemKeyMeta),
      );
    } else if (isInserting) {
      context.missing(_itemKeyMeta);
    }
    if (data.containsKey('progress_date')) {
      context.handle(
        _progressDateMeta,
        progressDate.isAcceptableOrUnknown(
          data['progress_date']!,
          _progressDateMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_progressDateMeta);
    }
    if (data.containsKey('current_count')) {
      context.handle(
        _currentCountMeta,
        currentCount.isAcceptableOrUnknown(
          data['current_count']!,
          _currentCountMeta,
        ),
      );
    }
    if (data.containsKey('is_completed')) {
      context.handle(
        _isCompletedMeta,
        isCompleted.isAcceptableOrUnknown(
          data['is_completed']!,
          _isCompletedMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AdhkarProgressCounter map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AdhkarProgressCounter(
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      firebaseId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}firebase_id'],
      ),
      ownerUserId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}owner_user_id'],
      ),
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_status'],
      )!,
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      itemKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}item_key'],
      )!,
      progressDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}progress_date'],
      )!,
      currentCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}current_count'],
      )!,
      isCompleted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_completed'],
      )!,
    );
  }

  @override
  $AdhkarProgressCountersTable createAlias(String alias) {
    return $AdhkarProgressCountersTable(attachedDatabase, alias);
  }
}

class AdhkarProgressCounter extends DataClass
    implements Insertable<AdhkarProgressCounter> {
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final String? firebaseId;
  final String? ownerUserId;
  final String syncStatus;
  final int id;
  final String itemKey;
  final DateTime progressDate;
  final int currentCount;
  final bool isCompleted;
  const AdhkarProgressCounter({
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    this.firebaseId,
    this.ownerUserId,
    required this.syncStatus,
    required this.id,
    required this.itemKey,
    required this.progressDate,
    required this.currentCount,
    required this.isCompleted,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    if (!nullToAbsent || firebaseId != null) {
      map['firebase_id'] = Variable<String>(firebaseId);
    }
    if (!nullToAbsent || ownerUserId != null) {
      map['owner_user_id'] = Variable<String>(ownerUserId);
    }
    map['sync_status'] = Variable<String>(syncStatus);
    map['id'] = Variable<int>(id);
    map['item_key'] = Variable<String>(itemKey);
    map['progress_date'] = Variable<DateTime>(progressDate);
    map['current_count'] = Variable<int>(currentCount);
    map['is_completed'] = Variable<bool>(isCompleted);
    return map;
  }

  AdhkarProgressCountersCompanion toCompanion(bool nullToAbsent) {
    return AdhkarProgressCountersCompanion(
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      firebaseId: firebaseId == null && nullToAbsent
          ? const Value.absent()
          : Value(firebaseId),
      ownerUserId: ownerUserId == null && nullToAbsent
          ? const Value.absent()
          : Value(ownerUserId),
      syncStatus: Value(syncStatus),
      id: Value(id),
      itemKey: Value(itemKey),
      progressDate: Value(progressDate),
      currentCount: Value(currentCount),
      isCompleted: Value(isCompleted),
    );
  }

  factory AdhkarProgressCounter.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AdhkarProgressCounter(
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      firebaseId: serializer.fromJson<String?>(json['firebaseId']),
      ownerUserId: serializer.fromJson<String?>(json['ownerUserId']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
      id: serializer.fromJson<int>(json['id']),
      itemKey: serializer.fromJson<String>(json['itemKey']),
      progressDate: serializer.fromJson<DateTime>(json['progressDate']),
      currentCount: serializer.fromJson<int>(json['currentCount']),
      isCompleted: serializer.fromJson<bool>(json['isCompleted']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'firebaseId': serializer.toJson<String?>(firebaseId),
      'ownerUserId': serializer.toJson<String?>(ownerUserId),
      'syncStatus': serializer.toJson<String>(syncStatus),
      'id': serializer.toJson<int>(id),
      'itemKey': serializer.toJson<String>(itemKey),
      'progressDate': serializer.toJson<DateTime>(progressDate),
      'currentCount': serializer.toJson<int>(currentCount),
      'isCompleted': serializer.toJson<bool>(isCompleted),
    };
  }

  AdhkarProgressCounter copyWith({
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    Value<String?> firebaseId = const Value.absent(),
    Value<String?> ownerUserId = const Value.absent(),
    String? syncStatus,
    int? id,
    String? itemKey,
    DateTime? progressDate,
    int? currentCount,
    bool? isCompleted,
  }) => AdhkarProgressCounter(
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    firebaseId: firebaseId.present ? firebaseId.value : this.firebaseId,
    ownerUserId: ownerUserId.present ? ownerUserId.value : this.ownerUserId,
    syncStatus: syncStatus ?? this.syncStatus,
    id: id ?? this.id,
    itemKey: itemKey ?? this.itemKey,
    progressDate: progressDate ?? this.progressDate,
    currentCount: currentCount ?? this.currentCount,
    isCompleted: isCompleted ?? this.isCompleted,
  );
  AdhkarProgressCounter copyWithCompanion(
    AdhkarProgressCountersCompanion data,
  ) {
    return AdhkarProgressCounter(
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      firebaseId: data.firebaseId.present
          ? data.firebaseId.value
          : this.firebaseId,
      ownerUserId: data.ownerUserId.present
          ? data.ownerUserId.value
          : this.ownerUserId,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
      id: data.id.present ? data.id.value : this.id,
      itemKey: data.itemKey.present ? data.itemKey.value : this.itemKey,
      progressDate: data.progressDate.present
          ? data.progressDate.value
          : this.progressDate,
      currentCount: data.currentCount.present
          ? data.currentCount.value
          : this.currentCount,
      isCompleted: data.isCompleted.present
          ? data.isCompleted.value
          : this.isCompleted,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AdhkarProgressCounter(')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('firebaseId: $firebaseId, ')
          ..write('ownerUserId: $ownerUserId, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('id: $id, ')
          ..write('itemKey: $itemKey, ')
          ..write('progressDate: $progressDate, ')
          ..write('currentCount: $currentCount, ')
          ..write('isCompleted: $isCompleted')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    createdAt,
    updatedAt,
    deletedAt,
    firebaseId,
    ownerUserId,
    syncStatus,
    id,
    itemKey,
    progressDate,
    currentCount,
    isCompleted,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AdhkarProgressCounter &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.firebaseId == this.firebaseId &&
          other.ownerUserId == this.ownerUserId &&
          other.syncStatus == this.syncStatus &&
          other.id == this.id &&
          other.itemKey == this.itemKey &&
          other.progressDate == this.progressDate &&
          other.currentCount == this.currentCount &&
          other.isCompleted == this.isCompleted);
}

class AdhkarProgressCountersCompanion
    extends UpdateCompanion<AdhkarProgressCounter> {
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<String?> firebaseId;
  final Value<String?> ownerUserId;
  final Value<String> syncStatus;
  final Value<int> id;
  final Value<String> itemKey;
  final Value<DateTime> progressDate;
  final Value<int> currentCount;
  final Value<bool> isCompleted;
  const AdhkarProgressCountersCompanion({
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.firebaseId = const Value.absent(),
    this.ownerUserId = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.id = const Value.absent(),
    this.itemKey = const Value.absent(),
    this.progressDate = const Value.absent(),
    this.currentCount = const Value.absent(),
    this.isCompleted = const Value.absent(),
  });
  AdhkarProgressCountersCompanion.insert({
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.firebaseId = const Value.absent(),
    this.ownerUserId = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.id = const Value.absent(),
    required String itemKey,
    required DateTime progressDate,
    this.currentCount = const Value.absent(),
    this.isCompleted = const Value.absent(),
  }) : createdAt = Value(createdAt),
       updatedAt = Value(updatedAt),
       itemKey = Value(itemKey),
       progressDate = Value(progressDate);
  static Insertable<AdhkarProgressCounter> custom({
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<String>? firebaseId,
    Expression<String>? ownerUserId,
    Expression<String>? syncStatus,
    Expression<int>? id,
    Expression<String>? itemKey,
    Expression<DateTime>? progressDate,
    Expression<int>? currentCount,
    Expression<bool>? isCompleted,
  }) {
    return RawValuesInsertable({
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (firebaseId != null) 'firebase_id': firebaseId,
      if (ownerUserId != null) 'owner_user_id': ownerUserId,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (id != null) 'id': id,
      if (itemKey != null) 'item_key': itemKey,
      if (progressDate != null) 'progress_date': progressDate,
      if (currentCount != null) 'current_count': currentCount,
      if (isCompleted != null) 'is_completed': isCompleted,
    });
  }

  AdhkarProgressCountersCompanion copyWith({
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<String?>? firebaseId,
    Value<String?>? ownerUserId,
    Value<String>? syncStatus,
    Value<int>? id,
    Value<String>? itemKey,
    Value<DateTime>? progressDate,
    Value<int>? currentCount,
    Value<bool>? isCompleted,
  }) {
    return AdhkarProgressCountersCompanion(
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      firebaseId: firebaseId ?? this.firebaseId,
      ownerUserId: ownerUserId ?? this.ownerUserId,
      syncStatus: syncStatus ?? this.syncStatus,
      id: id ?? this.id,
      itemKey: itemKey ?? this.itemKey,
      progressDate: progressDate ?? this.progressDate,
      currentCount: currentCount ?? this.currentCount,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (firebaseId.present) {
      map['firebase_id'] = Variable<String>(firebaseId.value);
    }
    if (ownerUserId.present) {
      map['owner_user_id'] = Variable<String>(ownerUserId.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (itemKey.present) {
      map['item_key'] = Variable<String>(itemKey.value);
    }
    if (progressDate.present) {
      map['progress_date'] = Variable<DateTime>(progressDate.value);
    }
    if (currentCount.present) {
      map['current_count'] = Variable<int>(currentCount.value);
    }
    if (isCompleted.present) {
      map['is_completed'] = Variable<bool>(isCompleted.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AdhkarProgressCountersCompanion(')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('firebaseId: $firebaseId, ')
          ..write('ownerUserId: $ownerUserId, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('id: $id, ')
          ..write('itemKey: $itemKey, ')
          ..write('progressDate: $progressDate, ')
          ..write('currentCount: $currentCount, ')
          ..write('isCompleted: $isCompleted')
          ..write(')'))
        .toString();
  }
}

class $PrayerTimesCacheTable extends PrayerTimesCache
    with TableInfo<$PrayerTimesCacheTable, PrayerTimesCacheData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PrayerTimesCacheTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _prayerDateMeta = const VerificationMeta(
    'prayerDate',
  );
  @override
  late final GeneratedColumn<DateTime> prayerDate = GeneratedColumn<DateTime>(
    'prayer_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _locationKeyMeta = const VerificationMeta(
    'locationKey',
  );
  @override
  late final GeneratedColumn<String> locationKey = GeneratedColumn<String>(
    'location_key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _calculationMethodMeta = const VerificationMeta(
    'calculationMethod',
  );
  @override
  late final GeneratedColumn<String> calculationMethod =
      GeneratedColumn<String>(
        'calculation_method',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _madhabMeta = const VerificationMeta('madhab');
  @override
  late final GeneratedColumn<String> madhab = GeneratedColumn<String>(
    'madhab',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _timingsJsonMeta = const VerificationMeta(
    'timingsJson',
  );
  @override
  late final GeneratedColumn<String> timingsJson = GeneratedColumn<String>(
    'timings_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sourceMeta = const VerificationMeta('source');
  @override
  late final GeneratedColumn<String> source = GeneratedColumn<String>(
    'source',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    createdAt,
    updatedAt,
    id,
    prayerDate,
    locationKey,
    calculationMethod,
    madhab,
    timingsJson,
    source,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'prayer_times_cache';
  @override
  VerificationContext validateIntegrity(
    Insertable<PrayerTimesCacheData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('prayer_date')) {
      context.handle(
        _prayerDateMeta,
        prayerDate.isAcceptableOrUnknown(data['prayer_date']!, _prayerDateMeta),
      );
    } else if (isInserting) {
      context.missing(_prayerDateMeta);
    }
    if (data.containsKey('location_key')) {
      context.handle(
        _locationKeyMeta,
        locationKey.isAcceptableOrUnknown(
          data['location_key']!,
          _locationKeyMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_locationKeyMeta);
    }
    if (data.containsKey('calculation_method')) {
      context.handle(
        _calculationMethodMeta,
        calculationMethod.isAcceptableOrUnknown(
          data['calculation_method']!,
          _calculationMethodMeta,
        ),
      );
    }
    if (data.containsKey('madhab')) {
      context.handle(
        _madhabMeta,
        madhab.isAcceptableOrUnknown(data['madhab']!, _madhabMeta),
      );
    }
    if (data.containsKey('timings_json')) {
      context.handle(
        _timingsJsonMeta,
        timingsJson.isAcceptableOrUnknown(
          data['timings_json']!,
          _timingsJsonMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_timingsJsonMeta);
    }
    if (data.containsKey('source')) {
      context.handle(
        _sourceMeta,
        source.isAcceptableOrUnknown(data['source']!, _sourceMeta),
      );
    } else if (isInserting) {
      context.missing(_sourceMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PrayerTimesCacheData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PrayerTimesCacheData(
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      prayerDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}prayer_date'],
      )!,
      locationKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}location_key'],
      )!,
      calculationMethod: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}calculation_method'],
      ),
      madhab: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}madhab'],
      ),
      timingsJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}timings_json'],
      )!,
      source: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source'],
      )!,
    );
  }

  @override
  $PrayerTimesCacheTable createAlias(String alias) {
    return $PrayerTimesCacheTable(attachedDatabase, alias);
  }
}

class PrayerTimesCacheData extends DataClass
    implements Insertable<PrayerTimesCacheData> {
  final DateTime createdAt;
  final DateTime updatedAt;
  final int id;
  final DateTime prayerDate;
  final String locationKey;
  final String? calculationMethod;
  final String? madhab;
  final String timingsJson;
  final String source;
  const PrayerTimesCacheData({
    required this.createdAt,
    required this.updatedAt,
    required this.id,
    required this.prayerDate,
    required this.locationKey,
    this.calculationMethod,
    this.madhab,
    required this.timingsJson,
    required this.source,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['id'] = Variable<int>(id);
    map['prayer_date'] = Variable<DateTime>(prayerDate);
    map['location_key'] = Variable<String>(locationKey);
    if (!nullToAbsent || calculationMethod != null) {
      map['calculation_method'] = Variable<String>(calculationMethod);
    }
    if (!nullToAbsent || madhab != null) {
      map['madhab'] = Variable<String>(madhab);
    }
    map['timings_json'] = Variable<String>(timingsJson);
    map['source'] = Variable<String>(source);
    return map;
  }

  PrayerTimesCacheCompanion toCompanion(bool nullToAbsent) {
    return PrayerTimesCacheCompanion(
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      id: Value(id),
      prayerDate: Value(prayerDate),
      locationKey: Value(locationKey),
      calculationMethod: calculationMethod == null && nullToAbsent
          ? const Value.absent()
          : Value(calculationMethod),
      madhab: madhab == null && nullToAbsent
          ? const Value.absent()
          : Value(madhab),
      timingsJson: Value(timingsJson),
      source: Value(source),
    );
  }

  factory PrayerTimesCacheData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PrayerTimesCacheData(
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      id: serializer.fromJson<int>(json['id']),
      prayerDate: serializer.fromJson<DateTime>(json['prayerDate']),
      locationKey: serializer.fromJson<String>(json['locationKey']),
      calculationMethod: serializer.fromJson<String?>(
        json['calculationMethod'],
      ),
      madhab: serializer.fromJson<String?>(json['madhab']),
      timingsJson: serializer.fromJson<String>(json['timingsJson']),
      source: serializer.fromJson<String>(json['source']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'id': serializer.toJson<int>(id),
      'prayerDate': serializer.toJson<DateTime>(prayerDate),
      'locationKey': serializer.toJson<String>(locationKey),
      'calculationMethod': serializer.toJson<String?>(calculationMethod),
      'madhab': serializer.toJson<String?>(madhab),
      'timingsJson': serializer.toJson<String>(timingsJson),
      'source': serializer.toJson<String>(source),
    };
  }

  PrayerTimesCacheData copyWith({
    DateTime? createdAt,
    DateTime? updatedAt,
    int? id,
    DateTime? prayerDate,
    String? locationKey,
    Value<String?> calculationMethod = const Value.absent(),
    Value<String?> madhab = const Value.absent(),
    String? timingsJson,
    String? source,
  }) => PrayerTimesCacheData(
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    id: id ?? this.id,
    prayerDate: prayerDate ?? this.prayerDate,
    locationKey: locationKey ?? this.locationKey,
    calculationMethod: calculationMethod.present
        ? calculationMethod.value
        : this.calculationMethod,
    madhab: madhab.present ? madhab.value : this.madhab,
    timingsJson: timingsJson ?? this.timingsJson,
    source: source ?? this.source,
  );
  PrayerTimesCacheData copyWithCompanion(PrayerTimesCacheCompanion data) {
    return PrayerTimesCacheData(
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      id: data.id.present ? data.id.value : this.id,
      prayerDate: data.prayerDate.present
          ? data.prayerDate.value
          : this.prayerDate,
      locationKey: data.locationKey.present
          ? data.locationKey.value
          : this.locationKey,
      calculationMethod: data.calculationMethod.present
          ? data.calculationMethod.value
          : this.calculationMethod,
      madhab: data.madhab.present ? data.madhab.value : this.madhab,
      timingsJson: data.timingsJson.present
          ? data.timingsJson.value
          : this.timingsJson,
      source: data.source.present ? data.source.value : this.source,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PrayerTimesCacheData(')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('id: $id, ')
          ..write('prayerDate: $prayerDate, ')
          ..write('locationKey: $locationKey, ')
          ..write('calculationMethod: $calculationMethod, ')
          ..write('madhab: $madhab, ')
          ..write('timingsJson: $timingsJson, ')
          ..write('source: $source')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    createdAt,
    updatedAt,
    id,
    prayerDate,
    locationKey,
    calculationMethod,
    madhab,
    timingsJson,
    source,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PrayerTimesCacheData &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.id == this.id &&
          other.prayerDate == this.prayerDate &&
          other.locationKey == this.locationKey &&
          other.calculationMethod == this.calculationMethod &&
          other.madhab == this.madhab &&
          other.timingsJson == this.timingsJson &&
          other.source == this.source);
}

class PrayerTimesCacheCompanion extends UpdateCompanion<PrayerTimesCacheData> {
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> id;
  final Value<DateTime> prayerDate;
  final Value<String> locationKey;
  final Value<String?> calculationMethod;
  final Value<String?> madhab;
  final Value<String> timingsJson;
  final Value<String> source;
  const PrayerTimesCacheCompanion({
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.id = const Value.absent(),
    this.prayerDate = const Value.absent(),
    this.locationKey = const Value.absent(),
    this.calculationMethod = const Value.absent(),
    this.madhab = const Value.absent(),
    this.timingsJson = const Value.absent(),
    this.source = const Value.absent(),
  });
  PrayerTimesCacheCompanion.insert({
    required DateTime createdAt,
    required DateTime updatedAt,
    this.id = const Value.absent(),
    required DateTime prayerDate,
    required String locationKey,
    this.calculationMethod = const Value.absent(),
    this.madhab = const Value.absent(),
    required String timingsJson,
    required String source,
  }) : createdAt = Value(createdAt),
       updatedAt = Value(updatedAt),
       prayerDate = Value(prayerDate),
       locationKey = Value(locationKey),
       timingsJson = Value(timingsJson),
       source = Value(source);
  static Insertable<PrayerTimesCacheData> custom({
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? id,
    Expression<DateTime>? prayerDate,
    Expression<String>? locationKey,
    Expression<String>? calculationMethod,
    Expression<String>? madhab,
    Expression<String>? timingsJson,
    Expression<String>? source,
  }) {
    return RawValuesInsertable({
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (id != null) 'id': id,
      if (prayerDate != null) 'prayer_date': prayerDate,
      if (locationKey != null) 'location_key': locationKey,
      if (calculationMethod != null) 'calculation_method': calculationMethod,
      if (madhab != null) 'madhab': madhab,
      if (timingsJson != null) 'timings_json': timingsJson,
      if (source != null) 'source': source,
    });
  }

  PrayerTimesCacheCompanion copyWith({
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? id,
    Value<DateTime>? prayerDate,
    Value<String>? locationKey,
    Value<String?>? calculationMethod,
    Value<String?>? madhab,
    Value<String>? timingsJson,
    Value<String>? source,
  }) {
    return PrayerTimesCacheCompanion(
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      id: id ?? this.id,
      prayerDate: prayerDate ?? this.prayerDate,
      locationKey: locationKey ?? this.locationKey,
      calculationMethod: calculationMethod ?? this.calculationMethod,
      madhab: madhab ?? this.madhab,
      timingsJson: timingsJson ?? this.timingsJson,
      source: source ?? this.source,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (prayerDate.present) {
      map['prayer_date'] = Variable<DateTime>(prayerDate.value);
    }
    if (locationKey.present) {
      map['location_key'] = Variable<String>(locationKey.value);
    }
    if (calculationMethod.present) {
      map['calculation_method'] = Variable<String>(calculationMethod.value);
    }
    if (madhab.present) {
      map['madhab'] = Variable<String>(madhab.value);
    }
    if (timingsJson.present) {
      map['timings_json'] = Variable<String>(timingsJson.value);
    }
    if (source.present) {
      map['source'] = Variable<String>(source.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PrayerTimesCacheCompanion(')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('id: $id, ')
          ..write('prayerDate: $prayerDate, ')
          ..write('locationKey: $locationKey, ')
          ..write('calculationMethod: $calculationMethod, ')
          ..write('madhab: $madhab, ')
          ..write('timingsJson: $timingsJson, ')
          ..write('source: $source')
          ..write(')'))
        .toString();
  }
}

class $NotificationSchedulesTable extends NotificationSchedules
    with TableInfo<$NotificationSchedulesTable, NotificationSchedule> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NotificationSchedulesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _firebaseIdMeta = const VerificationMeta(
    'firebaseId',
  );
  @override
  late final GeneratedColumn<String> firebaseId = GeneratedColumn<String>(
    'firebase_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ownerUserIdMeta = const VerificationMeta(
    'ownerUserId',
  );
  @override
  late final GeneratedColumn<String> ownerUserId = GeneratedColumn<String>(
    'owner_user_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
    'sync_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('local'),
  );
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _notificationKeyMeta = const VerificationMeta(
    'notificationKey',
  );
  @override
  late final GeneratedColumn<String> notificationKey = GeneratedColumn<String>(
    'notification_key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _notificationTypeMeta = const VerificationMeta(
    'notificationType',
  );
  @override
  late final GeneratedColumn<String> notificationType = GeneratedColumn<String>(
    'notification_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _scheduledAtMeta = const VerificationMeta(
    'scheduledAt',
  );
  @override
  late final GeneratedColumn<DateTime> scheduledAt = GeneratedColumn<DateTime>(
    'scheduled_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isEnabledMeta = const VerificationMeta(
    'isEnabled',
  );
  @override
  late final GeneratedColumn<bool> isEnabled = GeneratedColumn<bool>(
    'is_enabled',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_enabled" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _payloadJsonMeta = const VerificationMeta(
    'payloadJson',
  );
  @override
  late final GeneratedColumn<String> payloadJson = GeneratedColumn<String>(
    'payload_json',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    createdAt,
    updatedAt,
    deletedAt,
    firebaseId,
    ownerUserId,
    syncStatus,
    id,
    notificationKey,
    notificationType,
    scheduledAt,
    isEnabled,
    payloadJson,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'notification_schedules';
  @override
  VerificationContext validateIntegrity(
    Insertable<NotificationSchedule> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('firebase_id')) {
      context.handle(
        _firebaseIdMeta,
        firebaseId.isAcceptableOrUnknown(data['firebase_id']!, _firebaseIdMeta),
      );
    }
    if (data.containsKey('owner_user_id')) {
      context.handle(
        _ownerUserIdMeta,
        ownerUserId.isAcceptableOrUnknown(
          data['owner_user_id']!,
          _ownerUserIdMeta,
        ),
      );
    }
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('notification_key')) {
      context.handle(
        _notificationKeyMeta,
        notificationKey.isAcceptableOrUnknown(
          data['notification_key']!,
          _notificationKeyMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_notificationKeyMeta);
    }
    if (data.containsKey('notification_type')) {
      context.handle(
        _notificationTypeMeta,
        notificationType.isAcceptableOrUnknown(
          data['notification_type']!,
          _notificationTypeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_notificationTypeMeta);
    }
    if (data.containsKey('scheduled_at')) {
      context.handle(
        _scheduledAtMeta,
        scheduledAt.isAcceptableOrUnknown(
          data['scheduled_at']!,
          _scheduledAtMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_scheduledAtMeta);
    }
    if (data.containsKey('is_enabled')) {
      context.handle(
        _isEnabledMeta,
        isEnabled.isAcceptableOrUnknown(data['is_enabled']!, _isEnabledMeta),
      );
    }
    if (data.containsKey('payload_json')) {
      context.handle(
        _payloadJsonMeta,
        payloadJson.isAcceptableOrUnknown(
          data['payload_json']!,
          _payloadJsonMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  NotificationSchedule map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NotificationSchedule(
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      firebaseId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}firebase_id'],
      ),
      ownerUserId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}owner_user_id'],
      ),
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_status'],
      )!,
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      notificationKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notification_key'],
      )!,
      notificationType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notification_type'],
      )!,
      scheduledAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}scheduled_at'],
      )!,
      isEnabled: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_enabled'],
      )!,
      payloadJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payload_json'],
      ),
    );
  }

  @override
  $NotificationSchedulesTable createAlias(String alias) {
    return $NotificationSchedulesTable(attachedDatabase, alias);
  }
}

class NotificationSchedule extends DataClass
    implements Insertable<NotificationSchedule> {
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final String? firebaseId;
  final String? ownerUserId;
  final String syncStatus;
  final int id;
  final String notificationKey;
  final String notificationType;
  final DateTime scheduledAt;
  final bool isEnabled;
  final String? payloadJson;
  const NotificationSchedule({
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    this.firebaseId,
    this.ownerUserId,
    required this.syncStatus,
    required this.id,
    required this.notificationKey,
    required this.notificationType,
    required this.scheduledAt,
    required this.isEnabled,
    this.payloadJson,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    if (!nullToAbsent || firebaseId != null) {
      map['firebase_id'] = Variable<String>(firebaseId);
    }
    if (!nullToAbsent || ownerUserId != null) {
      map['owner_user_id'] = Variable<String>(ownerUserId);
    }
    map['sync_status'] = Variable<String>(syncStatus);
    map['id'] = Variable<int>(id);
    map['notification_key'] = Variable<String>(notificationKey);
    map['notification_type'] = Variable<String>(notificationType);
    map['scheduled_at'] = Variable<DateTime>(scheduledAt);
    map['is_enabled'] = Variable<bool>(isEnabled);
    if (!nullToAbsent || payloadJson != null) {
      map['payload_json'] = Variable<String>(payloadJson);
    }
    return map;
  }

  NotificationSchedulesCompanion toCompanion(bool nullToAbsent) {
    return NotificationSchedulesCompanion(
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      firebaseId: firebaseId == null && nullToAbsent
          ? const Value.absent()
          : Value(firebaseId),
      ownerUserId: ownerUserId == null && nullToAbsent
          ? const Value.absent()
          : Value(ownerUserId),
      syncStatus: Value(syncStatus),
      id: Value(id),
      notificationKey: Value(notificationKey),
      notificationType: Value(notificationType),
      scheduledAt: Value(scheduledAt),
      isEnabled: Value(isEnabled),
      payloadJson: payloadJson == null && nullToAbsent
          ? const Value.absent()
          : Value(payloadJson),
    );
  }

  factory NotificationSchedule.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NotificationSchedule(
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      firebaseId: serializer.fromJson<String?>(json['firebaseId']),
      ownerUserId: serializer.fromJson<String?>(json['ownerUserId']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
      id: serializer.fromJson<int>(json['id']),
      notificationKey: serializer.fromJson<String>(json['notificationKey']),
      notificationType: serializer.fromJson<String>(json['notificationType']),
      scheduledAt: serializer.fromJson<DateTime>(json['scheduledAt']),
      isEnabled: serializer.fromJson<bool>(json['isEnabled']),
      payloadJson: serializer.fromJson<String?>(json['payloadJson']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'firebaseId': serializer.toJson<String?>(firebaseId),
      'ownerUserId': serializer.toJson<String?>(ownerUserId),
      'syncStatus': serializer.toJson<String>(syncStatus),
      'id': serializer.toJson<int>(id),
      'notificationKey': serializer.toJson<String>(notificationKey),
      'notificationType': serializer.toJson<String>(notificationType),
      'scheduledAt': serializer.toJson<DateTime>(scheduledAt),
      'isEnabled': serializer.toJson<bool>(isEnabled),
      'payloadJson': serializer.toJson<String?>(payloadJson),
    };
  }

  NotificationSchedule copyWith({
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    Value<String?> firebaseId = const Value.absent(),
    Value<String?> ownerUserId = const Value.absent(),
    String? syncStatus,
    int? id,
    String? notificationKey,
    String? notificationType,
    DateTime? scheduledAt,
    bool? isEnabled,
    Value<String?> payloadJson = const Value.absent(),
  }) => NotificationSchedule(
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    firebaseId: firebaseId.present ? firebaseId.value : this.firebaseId,
    ownerUserId: ownerUserId.present ? ownerUserId.value : this.ownerUserId,
    syncStatus: syncStatus ?? this.syncStatus,
    id: id ?? this.id,
    notificationKey: notificationKey ?? this.notificationKey,
    notificationType: notificationType ?? this.notificationType,
    scheduledAt: scheduledAt ?? this.scheduledAt,
    isEnabled: isEnabled ?? this.isEnabled,
    payloadJson: payloadJson.present ? payloadJson.value : this.payloadJson,
  );
  NotificationSchedule copyWithCompanion(NotificationSchedulesCompanion data) {
    return NotificationSchedule(
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      firebaseId: data.firebaseId.present
          ? data.firebaseId.value
          : this.firebaseId,
      ownerUserId: data.ownerUserId.present
          ? data.ownerUserId.value
          : this.ownerUserId,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
      id: data.id.present ? data.id.value : this.id,
      notificationKey: data.notificationKey.present
          ? data.notificationKey.value
          : this.notificationKey,
      notificationType: data.notificationType.present
          ? data.notificationType.value
          : this.notificationType,
      scheduledAt: data.scheduledAt.present
          ? data.scheduledAt.value
          : this.scheduledAt,
      isEnabled: data.isEnabled.present ? data.isEnabled.value : this.isEnabled,
      payloadJson: data.payloadJson.present
          ? data.payloadJson.value
          : this.payloadJson,
    );
  }

  @override
  String toString() {
    return (StringBuffer('NotificationSchedule(')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('firebaseId: $firebaseId, ')
          ..write('ownerUserId: $ownerUserId, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('id: $id, ')
          ..write('notificationKey: $notificationKey, ')
          ..write('notificationType: $notificationType, ')
          ..write('scheduledAt: $scheduledAt, ')
          ..write('isEnabled: $isEnabled, ')
          ..write('payloadJson: $payloadJson')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    createdAt,
    updatedAt,
    deletedAt,
    firebaseId,
    ownerUserId,
    syncStatus,
    id,
    notificationKey,
    notificationType,
    scheduledAt,
    isEnabled,
    payloadJson,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NotificationSchedule &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.firebaseId == this.firebaseId &&
          other.ownerUserId == this.ownerUserId &&
          other.syncStatus == this.syncStatus &&
          other.id == this.id &&
          other.notificationKey == this.notificationKey &&
          other.notificationType == this.notificationType &&
          other.scheduledAt == this.scheduledAt &&
          other.isEnabled == this.isEnabled &&
          other.payloadJson == this.payloadJson);
}

class NotificationSchedulesCompanion
    extends UpdateCompanion<NotificationSchedule> {
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<String?> firebaseId;
  final Value<String?> ownerUserId;
  final Value<String> syncStatus;
  final Value<int> id;
  final Value<String> notificationKey;
  final Value<String> notificationType;
  final Value<DateTime> scheduledAt;
  final Value<bool> isEnabled;
  final Value<String?> payloadJson;
  const NotificationSchedulesCompanion({
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.firebaseId = const Value.absent(),
    this.ownerUserId = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.id = const Value.absent(),
    this.notificationKey = const Value.absent(),
    this.notificationType = const Value.absent(),
    this.scheduledAt = const Value.absent(),
    this.isEnabled = const Value.absent(),
    this.payloadJson = const Value.absent(),
  });
  NotificationSchedulesCompanion.insert({
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.firebaseId = const Value.absent(),
    this.ownerUserId = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.id = const Value.absent(),
    required String notificationKey,
    required String notificationType,
    required DateTime scheduledAt,
    this.isEnabled = const Value.absent(),
    this.payloadJson = const Value.absent(),
  }) : createdAt = Value(createdAt),
       updatedAt = Value(updatedAt),
       notificationKey = Value(notificationKey),
       notificationType = Value(notificationType),
       scheduledAt = Value(scheduledAt);
  static Insertable<NotificationSchedule> custom({
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<String>? firebaseId,
    Expression<String>? ownerUserId,
    Expression<String>? syncStatus,
    Expression<int>? id,
    Expression<String>? notificationKey,
    Expression<String>? notificationType,
    Expression<DateTime>? scheduledAt,
    Expression<bool>? isEnabled,
    Expression<String>? payloadJson,
  }) {
    return RawValuesInsertable({
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (firebaseId != null) 'firebase_id': firebaseId,
      if (ownerUserId != null) 'owner_user_id': ownerUserId,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (id != null) 'id': id,
      if (notificationKey != null) 'notification_key': notificationKey,
      if (notificationType != null) 'notification_type': notificationType,
      if (scheduledAt != null) 'scheduled_at': scheduledAt,
      if (isEnabled != null) 'is_enabled': isEnabled,
      if (payloadJson != null) 'payload_json': payloadJson,
    });
  }

  NotificationSchedulesCompanion copyWith({
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<String?>? firebaseId,
    Value<String?>? ownerUserId,
    Value<String>? syncStatus,
    Value<int>? id,
    Value<String>? notificationKey,
    Value<String>? notificationType,
    Value<DateTime>? scheduledAt,
    Value<bool>? isEnabled,
    Value<String?>? payloadJson,
  }) {
    return NotificationSchedulesCompanion(
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      firebaseId: firebaseId ?? this.firebaseId,
      ownerUserId: ownerUserId ?? this.ownerUserId,
      syncStatus: syncStatus ?? this.syncStatus,
      id: id ?? this.id,
      notificationKey: notificationKey ?? this.notificationKey,
      notificationType: notificationType ?? this.notificationType,
      scheduledAt: scheduledAt ?? this.scheduledAt,
      isEnabled: isEnabled ?? this.isEnabled,
      payloadJson: payloadJson ?? this.payloadJson,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (firebaseId.present) {
      map['firebase_id'] = Variable<String>(firebaseId.value);
    }
    if (ownerUserId.present) {
      map['owner_user_id'] = Variable<String>(ownerUserId.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (notificationKey.present) {
      map['notification_key'] = Variable<String>(notificationKey.value);
    }
    if (notificationType.present) {
      map['notification_type'] = Variable<String>(notificationType.value);
    }
    if (scheduledAt.present) {
      map['scheduled_at'] = Variable<DateTime>(scheduledAt.value);
    }
    if (isEnabled.present) {
      map['is_enabled'] = Variable<bool>(isEnabled.value);
    }
    if (payloadJson.present) {
      map['payload_json'] = Variable<String>(payloadJson.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NotificationSchedulesCompanion(')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('firebaseId: $firebaseId, ')
          ..write('ownerUserId: $ownerUserId, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('id: $id, ')
          ..write('notificationKey: $notificationKey, ')
          ..write('notificationType: $notificationType, ')
          ..write('scheduledAt: $scheduledAt, ')
          ..write('isEnabled: $isEnabled, ')
          ..write('payloadJson: $payloadJson')
          ..write(')'))
        .toString();
  }
}

class $AppSettingsTable extends AppSettings
    with TableInfo<$AppSettingsTable, AppSetting> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AppSettingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _firebaseIdMeta = const VerificationMeta(
    'firebaseId',
  );
  @override
  late final GeneratedColumn<String> firebaseId = GeneratedColumn<String>(
    'firebase_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ownerUserIdMeta = const VerificationMeta(
    'ownerUserId',
  );
  @override
  late final GeneratedColumn<String> ownerUserId = GeneratedColumn<String>(
    'owner_user_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
    'sync_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('local'),
  );
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _settingKeyMeta = const VerificationMeta(
    'settingKey',
  );
  @override
  late final GeneratedColumn<String> settingKey = GeneratedColumn<String>(
    'setting_key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _settingValueMeta = const VerificationMeta(
    'settingValue',
  );
  @override
  late final GeneratedColumn<String> settingValue = GeneratedColumn<String>(
    'setting_value',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valueTypeMeta = const VerificationMeta(
    'valueType',
  );
  @override
  late final GeneratedColumn<String> valueType = GeneratedColumn<String>(
    'value_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('string'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    createdAt,
    updatedAt,
    firebaseId,
    ownerUserId,
    syncStatus,
    id,
    settingKey,
    settingValue,
    valueType,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'app_settings';
  @override
  VerificationContext validateIntegrity(
    Insertable<AppSetting> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('firebase_id')) {
      context.handle(
        _firebaseIdMeta,
        firebaseId.isAcceptableOrUnknown(data['firebase_id']!, _firebaseIdMeta),
      );
    }
    if (data.containsKey('owner_user_id')) {
      context.handle(
        _ownerUserIdMeta,
        ownerUserId.isAcceptableOrUnknown(
          data['owner_user_id']!,
          _ownerUserIdMeta,
        ),
      );
    }
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('setting_key')) {
      context.handle(
        _settingKeyMeta,
        settingKey.isAcceptableOrUnknown(data['setting_key']!, _settingKeyMeta),
      );
    } else if (isInserting) {
      context.missing(_settingKeyMeta);
    }
    if (data.containsKey('setting_value')) {
      context.handle(
        _settingValueMeta,
        settingValue.isAcceptableOrUnknown(
          data['setting_value']!,
          _settingValueMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_settingValueMeta);
    }
    if (data.containsKey('value_type')) {
      context.handle(
        _valueTypeMeta,
        valueType.isAcceptableOrUnknown(data['value_type']!, _valueTypeMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AppSetting map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AppSetting(
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      firebaseId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}firebase_id'],
      ),
      ownerUserId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}owner_user_id'],
      ),
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_status'],
      )!,
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      settingKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}setting_key'],
      )!,
      settingValue: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}setting_value'],
      )!,
      valueType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}value_type'],
      )!,
    );
  }

  @override
  $AppSettingsTable createAlias(String alias) {
    return $AppSettingsTable(attachedDatabase, alias);
  }
}

class AppSetting extends DataClass implements Insertable<AppSetting> {
  final DateTime createdAt;
  final DateTime updatedAt;
  final String? firebaseId;
  final String? ownerUserId;
  final String syncStatus;
  final int id;
  final String settingKey;
  final String settingValue;
  final String valueType;
  const AppSetting({
    required this.createdAt,
    required this.updatedAt,
    this.firebaseId,
    this.ownerUserId,
    required this.syncStatus,
    required this.id,
    required this.settingKey,
    required this.settingValue,
    required this.valueType,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || firebaseId != null) {
      map['firebase_id'] = Variable<String>(firebaseId);
    }
    if (!nullToAbsent || ownerUserId != null) {
      map['owner_user_id'] = Variable<String>(ownerUserId);
    }
    map['sync_status'] = Variable<String>(syncStatus);
    map['id'] = Variable<int>(id);
    map['setting_key'] = Variable<String>(settingKey);
    map['setting_value'] = Variable<String>(settingValue);
    map['value_type'] = Variable<String>(valueType);
    return map;
  }

  AppSettingsCompanion toCompanion(bool nullToAbsent) {
    return AppSettingsCompanion(
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      firebaseId: firebaseId == null && nullToAbsent
          ? const Value.absent()
          : Value(firebaseId),
      ownerUserId: ownerUserId == null && nullToAbsent
          ? const Value.absent()
          : Value(ownerUserId),
      syncStatus: Value(syncStatus),
      id: Value(id),
      settingKey: Value(settingKey),
      settingValue: Value(settingValue),
      valueType: Value(valueType),
    );
  }

  factory AppSetting.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AppSetting(
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      firebaseId: serializer.fromJson<String?>(json['firebaseId']),
      ownerUserId: serializer.fromJson<String?>(json['ownerUserId']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
      id: serializer.fromJson<int>(json['id']),
      settingKey: serializer.fromJson<String>(json['settingKey']),
      settingValue: serializer.fromJson<String>(json['settingValue']),
      valueType: serializer.fromJson<String>(json['valueType']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'firebaseId': serializer.toJson<String?>(firebaseId),
      'ownerUserId': serializer.toJson<String?>(ownerUserId),
      'syncStatus': serializer.toJson<String>(syncStatus),
      'id': serializer.toJson<int>(id),
      'settingKey': serializer.toJson<String>(settingKey),
      'settingValue': serializer.toJson<String>(settingValue),
      'valueType': serializer.toJson<String>(valueType),
    };
  }

  AppSetting copyWith({
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<String?> firebaseId = const Value.absent(),
    Value<String?> ownerUserId = const Value.absent(),
    String? syncStatus,
    int? id,
    String? settingKey,
    String? settingValue,
    String? valueType,
  }) => AppSetting(
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    firebaseId: firebaseId.present ? firebaseId.value : this.firebaseId,
    ownerUserId: ownerUserId.present ? ownerUserId.value : this.ownerUserId,
    syncStatus: syncStatus ?? this.syncStatus,
    id: id ?? this.id,
    settingKey: settingKey ?? this.settingKey,
    settingValue: settingValue ?? this.settingValue,
    valueType: valueType ?? this.valueType,
  );
  AppSetting copyWithCompanion(AppSettingsCompanion data) {
    return AppSetting(
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      firebaseId: data.firebaseId.present
          ? data.firebaseId.value
          : this.firebaseId,
      ownerUserId: data.ownerUserId.present
          ? data.ownerUserId.value
          : this.ownerUserId,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
      id: data.id.present ? data.id.value : this.id,
      settingKey: data.settingKey.present
          ? data.settingKey.value
          : this.settingKey,
      settingValue: data.settingValue.present
          ? data.settingValue.value
          : this.settingValue,
      valueType: data.valueType.present ? data.valueType.value : this.valueType,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AppSetting(')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('firebaseId: $firebaseId, ')
          ..write('ownerUserId: $ownerUserId, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('id: $id, ')
          ..write('settingKey: $settingKey, ')
          ..write('settingValue: $settingValue, ')
          ..write('valueType: $valueType')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    createdAt,
    updatedAt,
    firebaseId,
    ownerUserId,
    syncStatus,
    id,
    settingKey,
    settingValue,
    valueType,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppSetting &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.firebaseId == this.firebaseId &&
          other.ownerUserId == this.ownerUserId &&
          other.syncStatus == this.syncStatus &&
          other.id == this.id &&
          other.settingKey == this.settingKey &&
          other.settingValue == this.settingValue &&
          other.valueType == this.valueType);
}

class AppSettingsCompanion extends UpdateCompanion<AppSetting> {
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<String?> firebaseId;
  final Value<String?> ownerUserId;
  final Value<String> syncStatus;
  final Value<int> id;
  final Value<String> settingKey;
  final Value<String> settingValue;
  final Value<String> valueType;
  const AppSettingsCompanion({
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.firebaseId = const Value.absent(),
    this.ownerUserId = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.id = const Value.absent(),
    this.settingKey = const Value.absent(),
    this.settingValue = const Value.absent(),
    this.valueType = const Value.absent(),
  });
  AppSettingsCompanion.insert({
    required DateTime createdAt,
    required DateTime updatedAt,
    this.firebaseId = const Value.absent(),
    this.ownerUserId = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.id = const Value.absent(),
    required String settingKey,
    required String settingValue,
    this.valueType = const Value.absent(),
  }) : createdAt = Value(createdAt),
       updatedAt = Value(updatedAt),
       settingKey = Value(settingKey),
       settingValue = Value(settingValue);
  static Insertable<AppSetting> custom({
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? firebaseId,
    Expression<String>? ownerUserId,
    Expression<String>? syncStatus,
    Expression<int>? id,
    Expression<String>? settingKey,
    Expression<String>? settingValue,
    Expression<String>? valueType,
  }) {
    return RawValuesInsertable({
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (firebaseId != null) 'firebase_id': firebaseId,
      if (ownerUserId != null) 'owner_user_id': ownerUserId,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (id != null) 'id': id,
      if (settingKey != null) 'setting_key': settingKey,
      if (settingValue != null) 'setting_value': settingValue,
      if (valueType != null) 'value_type': valueType,
    });
  }

  AppSettingsCompanion copyWith({
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<String?>? firebaseId,
    Value<String?>? ownerUserId,
    Value<String>? syncStatus,
    Value<int>? id,
    Value<String>? settingKey,
    Value<String>? settingValue,
    Value<String>? valueType,
  }) {
    return AppSettingsCompanion(
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      firebaseId: firebaseId ?? this.firebaseId,
      ownerUserId: ownerUserId ?? this.ownerUserId,
      syncStatus: syncStatus ?? this.syncStatus,
      id: id ?? this.id,
      settingKey: settingKey ?? this.settingKey,
      settingValue: settingValue ?? this.settingValue,
      valueType: valueType ?? this.valueType,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (firebaseId.present) {
      map['firebase_id'] = Variable<String>(firebaseId.value);
    }
    if (ownerUserId.present) {
      map['owner_user_id'] = Variable<String>(ownerUserId.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (settingKey.present) {
      map['setting_key'] = Variable<String>(settingKey.value);
    }
    if (settingValue.present) {
      map['setting_value'] = Variable<String>(settingValue.value);
    }
    if (valueType.present) {
      map['value_type'] = Variable<String>(valueType.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AppSettingsCompanion(')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('firebaseId: $firebaseId, ')
          ..write('ownerUserId: $ownerUserId, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('id: $id, ')
          ..write('settingKey: $settingKey, ')
          ..write('settingValue: $settingValue, ')
          ..write('valueType: $valueType')
          ..write(')'))
        .toString();
  }
}

class $SyncQueueTable extends SyncQueue
    with TableInfo<$SyncQueueTable, SyncQueueData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SyncQueueTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _ownerUserIdMeta = const VerificationMeta(
    'ownerUserId',
  );
  @override
  late final GeneratedColumn<String> ownerUserId = GeneratedColumn<String>(
    'owner_user_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _entityTypeMeta = const VerificationMeta(
    'entityType',
  );
  @override
  late final GeneratedColumn<String> entityType = GeneratedColumn<String>(
    'entity_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _localEntityIdMeta = const VerificationMeta(
    'localEntityId',
  );
  @override
  late final GeneratedColumn<int> localEntityId = GeneratedColumn<int>(
    'local_entity_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _operationMeta = const VerificationMeta(
    'operation',
  );
  @override
  late final GeneratedColumn<String> operation = GeneratedColumn<String>(
    'operation',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _payloadJsonMeta = const VerificationMeta(
    'payloadJson',
  );
  @override
  late final GeneratedColumn<String> payloadJson = GeneratedColumn<String>(
    'payload_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('pending'),
  );
  static const VerificationMeta _retryCountMeta = const VerificationMeta(
    'retryCount',
  );
  @override
  late final GeneratedColumn<int> retryCount = GeneratedColumn<int>(
    'retry_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _lastAttemptAtMeta = const VerificationMeta(
    'lastAttemptAt',
  );
  @override
  late final GeneratedColumn<DateTime> lastAttemptAt =
      GeneratedColumn<DateTime>(
        'last_attempt_at',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  @override
  List<GeneratedColumn> get $columns => [
    createdAt,
    updatedAt,
    id,
    ownerUserId,
    entityType,
    localEntityId,
    operation,
    payloadJson,
    status,
    retryCount,
    lastAttemptAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sync_queue';
  @override
  VerificationContext validateIntegrity(
    Insertable<SyncQueueData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('owner_user_id')) {
      context.handle(
        _ownerUserIdMeta,
        ownerUserId.isAcceptableOrUnknown(
          data['owner_user_id']!,
          _ownerUserIdMeta,
        ),
      );
    }
    if (data.containsKey('entity_type')) {
      context.handle(
        _entityTypeMeta,
        entityType.isAcceptableOrUnknown(data['entity_type']!, _entityTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_entityTypeMeta);
    }
    if (data.containsKey('local_entity_id')) {
      context.handle(
        _localEntityIdMeta,
        localEntityId.isAcceptableOrUnknown(
          data['local_entity_id']!,
          _localEntityIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_localEntityIdMeta);
    }
    if (data.containsKey('operation')) {
      context.handle(
        _operationMeta,
        operation.isAcceptableOrUnknown(data['operation']!, _operationMeta),
      );
    } else if (isInserting) {
      context.missing(_operationMeta);
    }
    if (data.containsKey('payload_json')) {
      context.handle(
        _payloadJsonMeta,
        payloadJson.isAcceptableOrUnknown(
          data['payload_json']!,
          _payloadJsonMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_payloadJsonMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('retry_count')) {
      context.handle(
        _retryCountMeta,
        retryCount.isAcceptableOrUnknown(data['retry_count']!, _retryCountMeta),
      );
    }
    if (data.containsKey('last_attempt_at')) {
      context.handle(
        _lastAttemptAtMeta,
        lastAttemptAt.isAcceptableOrUnknown(
          data['last_attempt_at']!,
          _lastAttemptAtMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SyncQueueData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SyncQueueData(
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      ownerUserId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}owner_user_id'],
      ),
      entityType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}entity_type'],
      )!,
      localEntityId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}local_entity_id'],
      )!,
      operation: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}operation'],
      )!,
      payloadJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payload_json'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      retryCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}retry_count'],
      )!,
      lastAttemptAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_attempt_at'],
      ),
    );
  }

  @override
  $SyncQueueTable createAlias(String alias) {
    return $SyncQueueTable(attachedDatabase, alias);
  }
}

class SyncQueueData extends DataClass implements Insertable<SyncQueueData> {
  final DateTime createdAt;
  final DateTime updatedAt;
  final int id;
  final String? ownerUserId;
  final String entityType;
  final int localEntityId;
  final String operation;
  final String payloadJson;
  final String status;
  final int retryCount;
  final DateTime? lastAttemptAt;
  const SyncQueueData({
    required this.createdAt,
    required this.updatedAt,
    required this.id,
    this.ownerUserId,
    required this.entityType,
    required this.localEntityId,
    required this.operation,
    required this.payloadJson,
    required this.status,
    required this.retryCount,
    this.lastAttemptAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || ownerUserId != null) {
      map['owner_user_id'] = Variable<String>(ownerUserId);
    }
    map['entity_type'] = Variable<String>(entityType);
    map['local_entity_id'] = Variable<int>(localEntityId);
    map['operation'] = Variable<String>(operation);
    map['payload_json'] = Variable<String>(payloadJson);
    map['status'] = Variable<String>(status);
    map['retry_count'] = Variable<int>(retryCount);
    if (!nullToAbsent || lastAttemptAt != null) {
      map['last_attempt_at'] = Variable<DateTime>(lastAttemptAt);
    }
    return map;
  }

  SyncQueueCompanion toCompanion(bool nullToAbsent) {
    return SyncQueueCompanion(
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      id: Value(id),
      ownerUserId: ownerUserId == null && nullToAbsent
          ? const Value.absent()
          : Value(ownerUserId),
      entityType: Value(entityType),
      localEntityId: Value(localEntityId),
      operation: Value(operation),
      payloadJson: Value(payloadJson),
      status: Value(status),
      retryCount: Value(retryCount),
      lastAttemptAt: lastAttemptAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastAttemptAt),
    );
  }

  factory SyncQueueData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SyncQueueData(
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      id: serializer.fromJson<int>(json['id']),
      ownerUserId: serializer.fromJson<String?>(json['ownerUserId']),
      entityType: serializer.fromJson<String>(json['entityType']),
      localEntityId: serializer.fromJson<int>(json['localEntityId']),
      operation: serializer.fromJson<String>(json['operation']),
      payloadJson: serializer.fromJson<String>(json['payloadJson']),
      status: serializer.fromJson<String>(json['status']),
      retryCount: serializer.fromJson<int>(json['retryCount']),
      lastAttemptAt: serializer.fromJson<DateTime?>(json['lastAttemptAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'id': serializer.toJson<int>(id),
      'ownerUserId': serializer.toJson<String?>(ownerUserId),
      'entityType': serializer.toJson<String>(entityType),
      'localEntityId': serializer.toJson<int>(localEntityId),
      'operation': serializer.toJson<String>(operation),
      'payloadJson': serializer.toJson<String>(payloadJson),
      'status': serializer.toJson<String>(status),
      'retryCount': serializer.toJson<int>(retryCount),
      'lastAttemptAt': serializer.toJson<DateTime?>(lastAttemptAt),
    };
  }

  SyncQueueData copyWith({
    DateTime? createdAt,
    DateTime? updatedAt,
    int? id,
    Value<String?> ownerUserId = const Value.absent(),
    String? entityType,
    int? localEntityId,
    String? operation,
    String? payloadJson,
    String? status,
    int? retryCount,
    Value<DateTime?> lastAttemptAt = const Value.absent(),
  }) => SyncQueueData(
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    id: id ?? this.id,
    ownerUserId: ownerUserId.present ? ownerUserId.value : this.ownerUserId,
    entityType: entityType ?? this.entityType,
    localEntityId: localEntityId ?? this.localEntityId,
    operation: operation ?? this.operation,
    payloadJson: payloadJson ?? this.payloadJson,
    status: status ?? this.status,
    retryCount: retryCount ?? this.retryCount,
    lastAttemptAt: lastAttemptAt.present
        ? lastAttemptAt.value
        : this.lastAttemptAt,
  );
  SyncQueueData copyWithCompanion(SyncQueueCompanion data) {
    return SyncQueueData(
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      id: data.id.present ? data.id.value : this.id,
      ownerUserId: data.ownerUserId.present
          ? data.ownerUserId.value
          : this.ownerUserId,
      entityType: data.entityType.present
          ? data.entityType.value
          : this.entityType,
      localEntityId: data.localEntityId.present
          ? data.localEntityId.value
          : this.localEntityId,
      operation: data.operation.present ? data.operation.value : this.operation,
      payloadJson: data.payloadJson.present
          ? data.payloadJson.value
          : this.payloadJson,
      status: data.status.present ? data.status.value : this.status,
      retryCount: data.retryCount.present
          ? data.retryCount.value
          : this.retryCount,
      lastAttemptAt: data.lastAttemptAt.present
          ? data.lastAttemptAt.value
          : this.lastAttemptAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SyncQueueData(')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('id: $id, ')
          ..write('ownerUserId: $ownerUserId, ')
          ..write('entityType: $entityType, ')
          ..write('localEntityId: $localEntityId, ')
          ..write('operation: $operation, ')
          ..write('payloadJson: $payloadJson, ')
          ..write('status: $status, ')
          ..write('retryCount: $retryCount, ')
          ..write('lastAttemptAt: $lastAttemptAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    createdAt,
    updatedAt,
    id,
    ownerUserId,
    entityType,
    localEntityId,
    operation,
    payloadJson,
    status,
    retryCount,
    lastAttemptAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SyncQueueData &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.id == this.id &&
          other.ownerUserId == this.ownerUserId &&
          other.entityType == this.entityType &&
          other.localEntityId == this.localEntityId &&
          other.operation == this.operation &&
          other.payloadJson == this.payloadJson &&
          other.status == this.status &&
          other.retryCount == this.retryCount &&
          other.lastAttemptAt == this.lastAttemptAt);
}

class SyncQueueCompanion extends UpdateCompanion<SyncQueueData> {
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> id;
  final Value<String?> ownerUserId;
  final Value<String> entityType;
  final Value<int> localEntityId;
  final Value<String> operation;
  final Value<String> payloadJson;
  final Value<String> status;
  final Value<int> retryCount;
  final Value<DateTime?> lastAttemptAt;
  const SyncQueueCompanion({
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.id = const Value.absent(),
    this.ownerUserId = const Value.absent(),
    this.entityType = const Value.absent(),
    this.localEntityId = const Value.absent(),
    this.operation = const Value.absent(),
    this.payloadJson = const Value.absent(),
    this.status = const Value.absent(),
    this.retryCount = const Value.absent(),
    this.lastAttemptAt = const Value.absent(),
  });
  SyncQueueCompanion.insert({
    required DateTime createdAt,
    required DateTime updatedAt,
    this.id = const Value.absent(),
    this.ownerUserId = const Value.absent(),
    required String entityType,
    required int localEntityId,
    required String operation,
    required String payloadJson,
    this.status = const Value.absent(),
    this.retryCount = const Value.absent(),
    this.lastAttemptAt = const Value.absent(),
  }) : createdAt = Value(createdAt),
       updatedAt = Value(updatedAt),
       entityType = Value(entityType),
       localEntityId = Value(localEntityId),
       operation = Value(operation),
       payloadJson = Value(payloadJson);
  static Insertable<SyncQueueData> custom({
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? id,
    Expression<String>? ownerUserId,
    Expression<String>? entityType,
    Expression<int>? localEntityId,
    Expression<String>? operation,
    Expression<String>? payloadJson,
    Expression<String>? status,
    Expression<int>? retryCount,
    Expression<DateTime>? lastAttemptAt,
  }) {
    return RawValuesInsertable({
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (id != null) 'id': id,
      if (ownerUserId != null) 'owner_user_id': ownerUserId,
      if (entityType != null) 'entity_type': entityType,
      if (localEntityId != null) 'local_entity_id': localEntityId,
      if (operation != null) 'operation': operation,
      if (payloadJson != null) 'payload_json': payloadJson,
      if (status != null) 'status': status,
      if (retryCount != null) 'retry_count': retryCount,
      if (lastAttemptAt != null) 'last_attempt_at': lastAttemptAt,
    });
  }

  SyncQueueCompanion copyWith({
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? id,
    Value<String?>? ownerUserId,
    Value<String>? entityType,
    Value<int>? localEntityId,
    Value<String>? operation,
    Value<String>? payloadJson,
    Value<String>? status,
    Value<int>? retryCount,
    Value<DateTime?>? lastAttemptAt,
  }) {
    return SyncQueueCompanion(
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      id: id ?? this.id,
      ownerUserId: ownerUserId ?? this.ownerUserId,
      entityType: entityType ?? this.entityType,
      localEntityId: localEntityId ?? this.localEntityId,
      operation: operation ?? this.operation,
      payloadJson: payloadJson ?? this.payloadJson,
      status: status ?? this.status,
      retryCount: retryCount ?? this.retryCount,
      lastAttemptAt: lastAttemptAt ?? this.lastAttemptAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (ownerUserId.present) {
      map['owner_user_id'] = Variable<String>(ownerUserId.value);
    }
    if (entityType.present) {
      map['entity_type'] = Variable<String>(entityType.value);
    }
    if (localEntityId.present) {
      map['local_entity_id'] = Variable<int>(localEntityId.value);
    }
    if (operation.present) {
      map['operation'] = Variable<String>(operation.value);
    }
    if (payloadJson.present) {
      map['payload_json'] = Variable<String>(payloadJson.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (retryCount.present) {
      map['retry_count'] = Variable<int>(retryCount.value);
    }
    if (lastAttemptAt.present) {
      map['last_attempt_at'] = Variable<DateTime>(lastAttemptAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SyncQueueCompanion(')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('id: $id, ')
          ..write('ownerUserId: $ownerUserId, ')
          ..write('entityType: $entityType, ')
          ..write('localEntityId: $localEntityId, ')
          ..write('operation: $operation, ')
          ..write('payloadJson: $payloadJson, ')
          ..write('status: $status, ')
          ..write('retryCount: $retryCount, ')
          ..write('lastAttemptAt: $lastAttemptAt')
          ..write(')'))
        .toString();
  }
}

class $SyncMetadataTable extends SyncMetadata
    with TableInfo<$SyncMetadataTable, SyncMetadataData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SyncMetadataTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _ownerUserIdMeta = const VerificationMeta(
    'ownerUserId',
  );
  @override
  late final GeneratedColumn<String> ownerUserId = GeneratedColumn<String>(
    'owner_user_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _entityTypeMeta = const VerificationMeta(
    'entityType',
  );
  @override
  late final GeneratedColumn<String> entityType = GeneratedColumn<String>(
    'entity_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lastSyncedAtMeta = const VerificationMeta(
    'lastSyncedAt',
  );
  @override
  late final GeneratedColumn<DateTime> lastSyncedAt = GeneratedColumn<DateTime>(
    'last_synced_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _lastSyncTokenMeta = const VerificationMeta(
    'lastSyncToken',
  );
  @override
  late final GeneratedColumn<String> lastSyncToken = GeneratedColumn<String>(
    'last_sync_token',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('idle'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    createdAt,
    updatedAt,
    id,
    ownerUserId,
    entityType,
    lastSyncedAt,
    lastSyncToken,
    status,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sync_metadata';
  @override
  VerificationContext validateIntegrity(
    Insertable<SyncMetadataData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('owner_user_id')) {
      context.handle(
        _ownerUserIdMeta,
        ownerUserId.isAcceptableOrUnknown(
          data['owner_user_id']!,
          _ownerUserIdMeta,
        ),
      );
    }
    if (data.containsKey('entity_type')) {
      context.handle(
        _entityTypeMeta,
        entityType.isAcceptableOrUnknown(data['entity_type']!, _entityTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_entityTypeMeta);
    }
    if (data.containsKey('last_synced_at')) {
      context.handle(
        _lastSyncedAtMeta,
        lastSyncedAt.isAcceptableOrUnknown(
          data['last_synced_at']!,
          _lastSyncedAtMeta,
        ),
      );
    }
    if (data.containsKey('last_sync_token')) {
      context.handle(
        _lastSyncTokenMeta,
        lastSyncToken.isAcceptableOrUnknown(
          data['last_sync_token']!,
          _lastSyncTokenMeta,
        ),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SyncMetadataData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SyncMetadataData(
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      ownerUserId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}owner_user_id'],
      ),
      entityType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}entity_type'],
      )!,
      lastSyncedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_synced_at'],
      ),
      lastSyncToken: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}last_sync_token'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
    );
  }

  @override
  $SyncMetadataTable createAlias(String alias) {
    return $SyncMetadataTable(attachedDatabase, alias);
  }
}

class SyncMetadataData extends DataClass
    implements Insertable<SyncMetadataData> {
  final DateTime createdAt;
  final DateTime updatedAt;
  final int id;
  final String? ownerUserId;
  final String entityType;
  final DateTime? lastSyncedAt;
  final String? lastSyncToken;
  final String status;
  const SyncMetadataData({
    required this.createdAt,
    required this.updatedAt,
    required this.id,
    this.ownerUserId,
    required this.entityType,
    this.lastSyncedAt,
    this.lastSyncToken,
    required this.status,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || ownerUserId != null) {
      map['owner_user_id'] = Variable<String>(ownerUserId);
    }
    map['entity_type'] = Variable<String>(entityType);
    if (!nullToAbsent || lastSyncedAt != null) {
      map['last_synced_at'] = Variable<DateTime>(lastSyncedAt);
    }
    if (!nullToAbsent || lastSyncToken != null) {
      map['last_sync_token'] = Variable<String>(lastSyncToken);
    }
    map['status'] = Variable<String>(status);
    return map;
  }

  SyncMetadataCompanion toCompanion(bool nullToAbsent) {
    return SyncMetadataCompanion(
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      id: Value(id),
      ownerUserId: ownerUserId == null && nullToAbsent
          ? const Value.absent()
          : Value(ownerUserId),
      entityType: Value(entityType),
      lastSyncedAt: lastSyncedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastSyncedAt),
      lastSyncToken: lastSyncToken == null && nullToAbsent
          ? const Value.absent()
          : Value(lastSyncToken),
      status: Value(status),
    );
  }

  factory SyncMetadataData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SyncMetadataData(
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      id: serializer.fromJson<int>(json['id']),
      ownerUserId: serializer.fromJson<String?>(json['ownerUserId']),
      entityType: serializer.fromJson<String>(json['entityType']),
      lastSyncedAt: serializer.fromJson<DateTime?>(json['lastSyncedAt']),
      lastSyncToken: serializer.fromJson<String?>(json['lastSyncToken']),
      status: serializer.fromJson<String>(json['status']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'id': serializer.toJson<int>(id),
      'ownerUserId': serializer.toJson<String?>(ownerUserId),
      'entityType': serializer.toJson<String>(entityType),
      'lastSyncedAt': serializer.toJson<DateTime?>(lastSyncedAt),
      'lastSyncToken': serializer.toJson<String?>(lastSyncToken),
      'status': serializer.toJson<String>(status),
    };
  }

  SyncMetadataData copyWith({
    DateTime? createdAt,
    DateTime? updatedAt,
    int? id,
    Value<String?> ownerUserId = const Value.absent(),
    String? entityType,
    Value<DateTime?> lastSyncedAt = const Value.absent(),
    Value<String?> lastSyncToken = const Value.absent(),
    String? status,
  }) => SyncMetadataData(
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    id: id ?? this.id,
    ownerUserId: ownerUserId.present ? ownerUserId.value : this.ownerUserId,
    entityType: entityType ?? this.entityType,
    lastSyncedAt: lastSyncedAt.present ? lastSyncedAt.value : this.lastSyncedAt,
    lastSyncToken: lastSyncToken.present
        ? lastSyncToken.value
        : this.lastSyncToken,
    status: status ?? this.status,
  );
  SyncMetadataData copyWithCompanion(SyncMetadataCompanion data) {
    return SyncMetadataData(
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      id: data.id.present ? data.id.value : this.id,
      ownerUserId: data.ownerUserId.present
          ? data.ownerUserId.value
          : this.ownerUserId,
      entityType: data.entityType.present
          ? data.entityType.value
          : this.entityType,
      lastSyncedAt: data.lastSyncedAt.present
          ? data.lastSyncedAt.value
          : this.lastSyncedAt,
      lastSyncToken: data.lastSyncToken.present
          ? data.lastSyncToken.value
          : this.lastSyncToken,
      status: data.status.present ? data.status.value : this.status,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SyncMetadataData(')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('id: $id, ')
          ..write('ownerUserId: $ownerUserId, ')
          ..write('entityType: $entityType, ')
          ..write('lastSyncedAt: $lastSyncedAt, ')
          ..write('lastSyncToken: $lastSyncToken, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    createdAt,
    updatedAt,
    id,
    ownerUserId,
    entityType,
    lastSyncedAt,
    lastSyncToken,
    status,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SyncMetadataData &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.id == this.id &&
          other.ownerUserId == this.ownerUserId &&
          other.entityType == this.entityType &&
          other.lastSyncedAt == this.lastSyncedAt &&
          other.lastSyncToken == this.lastSyncToken &&
          other.status == this.status);
}

class SyncMetadataCompanion extends UpdateCompanion<SyncMetadataData> {
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> id;
  final Value<String?> ownerUserId;
  final Value<String> entityType;
  final Value<DateTime?> lastSyncedAt;
  final Value<String?> lastSyncToken;
  final Value<String> status;
  const SyncMetadataCompanion({
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.id = const Value.absent(),
    this.ownerUserId = const Value.absent(),
    this.entityType = const Value.absent(),
    this.lastSyncedAt = const Value.absent(),
    this.lastSyncToken = const Value.absent(),
    this.status = const Value.absent(),
  });
  SyncMetadataCompanion.insert({
    required DateTime createdAt,
    required DateTime updatedAt,
    this.id = const Value.absent(),
    this.ownerUserId = const Value.absent(),
    required String entityType,
    this.lastSyncedAt = const Value.absent(),
    this.lastSyncToken = const Value.absent(),
    this.status = const Value.absent(),
  }) : createdAt = Value(createdAt),
       updatedAt = Value(updatedAt),
       entityType = Value(entityType);
  static Insertable<SyncMetadataData> custom({
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? id,
    Expression<String>? ownerUserId,
    Expression<String>? entityType,
    Expression<DateTime>? lastSyncedAt,
    Expression<String>? lastSyncToken,
    Expression<String>? status,
  }) {
    return RawValuesInsertable({
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (id != null) 'id': id,
      if (ownerUserId != null) 'owner_user_id': ownerUserId,
      if (entityType != null) 'entity_type': entityType,
      if (lastSyncedAt != null) 'last_synced_at': lastSyncedAt,
      if (lastSyncToken != null) 'last_sync_token': lastSyncToken,
      if (status != null) 'status': status,
    });
  }

  SyncMetadataCompanion copyWith({
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? id,
    Value<String?>? ownerUserId,
    Value<String>? entityType,
    Value<DateTime?>? lastSyncedAt,
    Value<String?>? lastSyncToken,
    Value<String>? status,
  }) {
    return SyncMetadataCompanion(
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      id: id ?? this.id,
      ownerUserId: ownerUserId ?? this.ownerUserId,
      entityType: entityType ?? this.entityType,
      lastSyncedAt: lastSyncedAt ?? this.lastSyncedAt,
      lastSyncToken: lastSyncToken ?? this.lastSyncToken,
      status: status ?? this.status,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (ownerUserId.present) {
      map['owner_user_id'] = Variable<String>(ownerUserId.value);
    }
    if (entityType.present) {
      map['entity_type'] = Variable<String>(entityType.value);
    }
    if (lastSyncedAt.present) {
      map['last_synced_at'] = Variable<DateTime>(lastSyncedAt.value);
    }
    if (lastSyncToken.present) {
      map['last_sync_token'] = Variable<String>(lastSyncToken.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SyncMetadataCompanion(')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('id: $id, ')
          ..write('ownerUserId: $ownerUserId, ')
          ..write('entityType: $entityType, ')
          ..write('lastSyncedAt: $lastSyncedAt, ')
          ..write('lastSyncToken: $lastSyncToken, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $UserProfileCachesTable userProfileCaches =
      $UserProfileCachesTable(this);
  late final $QuranChaptersCacheTable quranChaptersCache =
      $QuranChaptersCacheTable(this);
  late final $QuranVersesCacheTable quranVersesCache = $QuranVersesCacheTable(
    this,
  );
  late final $TafsirCachesTable tafsirCaches = $TafsirCachesTable(this);
  late final $AudioCacheMetadataTable audioCacheMetadata =
      $AudioCacheMetadataTable(this);
  late final $QuranRecitersCacheTable quranRecitersCache =
      $QuranRecitersCacheTable(this);
  late final $DailyAyahHistoryTable dailyAyahHistory = $DailyAyahHistoryTable(
    this,
  );
  late final $ReadingProgressTable readingProgress = $ReadingProgressTable(
    this,
  );
  late final $ReadingSessionsTable readingSessions = $ReadingSessionsTable(
    this,
  );
  late final $DailyGoalsTable dailyGoals = $DailyGoalsTable(this);
  late final $StreakRecordsTable streakRecords = $StreakRecordsTable(this);
  late final $ReflectionNotesTable reflectionNotes = $ReflectionNotesTable(
    this,
  );
  late final $FavoriteBookmarksTable favoriteBookmarks =
      $FavoriteBookmarksTable(this);
  late final $AdhkarCategoriesTable adhkarCategories = $AdhkarCategoriesTable(
    this,
  );
  late final $AdhkarItemsTable adhkarItems = $AdhkarItemsTable(this);
  late final $AdhkarProgressCountersTable adhkarProgressCounters =
      $AdhkarProgressCountersTable(this);
  late final $PrayerTimesCacheTable prayerTimesCache = $PrayerTimesCacheTable(
    this,
  );
  late final $NotificationSchedulesTable notificationSchedules =
      $NotificationSchedulesTable(this);
  late final $AppSettingsTable appSettings = $AppSettingsTable(this);
  late final $SyncQueueTable syncQueue = $SyncQueueTable(this);
  late final $SyncMetadataTable syncMetadata = $SyncMetadataTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    userProfileCaches,
    quranChaptersCache,
    quranVersesCache,
    tafsirCaches,
    audioCacheMetadata,
    quranRecitersCache,
    dailyAyahHistory,
    readingProgress,
    readingSessions,
    dailyGoals,
    streakRecords,
    reflectionNotes,
    favoriteBookmarks,
    adhkarCategories,
    adhkarItems,
    adhkarProgressCounters,
    prayerTimesCache,
    notificationSchedules,
    appSettings,
    syncQueue,
    syncMetadata,
  ];
}

typedef $$UserProfileCachesTableCreateCompanionBuilder =
    UserProfileCachesCompanion Function({
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<DateTime?> deletedAt,
      Value<String?> firebaseId,
      Value<String?> ownerUserId,
      Value<String> syncStatus,
      Value<int> id,
      Value<String?> displayName,
      Value<String?> email,
      Value<String> preferredLanguage,
    });
typedef $$UserProfileCachesTableUpdateCompanionBuilder =
    UserProfileCachesCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<String?> firebaseId,
      Value<String?> ownerUserId,
      Value<String> syncStatus,
      Value<int> id,
      Value<String?> displayName,
      Value<String?> email,
      Value<String> preferredLanguage,
    });

class $$UserProfileCachesTableFilterComposer
    extends Composer<_$AppDatabase, $UserProfileCachesTable> {
  $$UserProfileCachesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get firebaseId => $composableBuilder(
    column: $table.firebaseId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ownerUserId => $composableBuilder(
    column: $table.ownerUserId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get preferredLanguage => $composableBuilder(
    column: $table.preferredLanguage,
    builder: (column) => ColumnFilters(column),
  );
}

class $$UserProfileCachesTableOrderingComposer
    extends Composer<_$AppDatabase, $UserProfileCachesTable> {
  $$UserProfileCachesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get firebaseId => $composableBuilder(
    column: $table.firebaseId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ownerUserId => $composableBuilder(
    column: $table.ownerUserId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get preferredLanguage => $composableBuilder(
    column: $table.preferredLanguage,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UserProfileCachesTableAnnotationComposer
    extends Composer<_$AppDatabase, $UserProfileCachesTable> {
  $$UserProfileCachesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get firebaseId => $composableBuilder(
    column: $table.firebaseId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get ownerUserId => $composableBuilder(
    column: $table.ownerUserId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );

  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get preferredLanguage => $composableBuilder(
    column: $table.preferredLanguage,
    builder: (column) => column,
  );
}

class $$UserProfileCachesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UserProfileCachesTable,
          UserProfileCache,
          $$UserProfileCachesTableFilterComposer,
          $$UserProfileCachesTableOrderingComposer,
          $$UserProfileCachesTableAnnotationComposer,
          $$UserProfileCachesTableCreateCompanionBuilder,
          $$UserProfileCachesTableUpdateCompanionBuilder,
          (
            UserProfileCache,
            BaseReferences<
              _$AppDatabase,
              $UserProfileCachesTable,
              UserProfileCache
            >,
          ),
          UserProfileCache,
          PrefetchHooks Function()
        > {
  $$UserProfileCachesTableTableManager(
    _$AppDatabase db,
    $UserProfileCachesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserProfileCachesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserProfileCachesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserProfileCachesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String?> firebaseId = const Value.absent(),
                Value<String?> ownerUserId = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<int> id = const Value.absent(),
                Value<String?> displayName = const Value.absent(),
                Value<String?> email = const Value.absent(),
                Value<String> preferredLanguage = const Value.absent(),
              }) => UserProfileCachesCompanion(
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                firebaseId: firebaseId,
                ownerUserId: ownerUserId,
                syncStatus: syncStatus,
                id: id,
                displayName: displayName,
                email: email,
                preferredLanguage: preferredLanguage,
              ),
          createCompanionCallback:
              ({
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String?> firebaseId = const Value.absent(),
                Value<String?> ownerUserId = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<int> id = const Value.absent(),
                Value<String?> displayName = const Value.absent(),
                Value<String?> email = const Value.absent(),
                Value<String> preferredLanguage = const Value.absent(),
              }) => UserProfileCachesCompanion.insert(
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                firebaseId: firebaseId,
                ownerUserId: ownerUserId,
                syncStatus: syncStatus,
                id: id,
                displayName: displayName,
                email: email,
                preferredLanguage: preferredLanguage,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$UserProfileCachesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UserProfileCachesTable,
      UserProfileCache,
      $$UserProfileCachesTableFilterComposer,
      $$UserProfileCachesTableOrderingComposer,
      $$UserProfileCachesTableAnnotationComposer,
      $$UserProfileCachesTableCreateCompanionBuilder,
      $$UserProfileCachesTableUpdateCompanionBuilder,
      (
        UserProfileCache,
        BaseReferences<
          _$AppDatabase,
          $UserProfileCachesTable,
          UserProfileCache
        >,
      ),
      UserProfileCache,
      PrefetchHooks Function()
    >;
typedef $$QuranChaptersCacheTableCreateCompanionBuilder =
    QuranChaptersCacheCompanion Function({
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<int> id,
      required int chapterNumber,
      required String nameArabic,
      Value<String?> nameEnglish,
      required int versesCount,
      required String source,
    });
typedef $$QuranChaptersCacheTableUpdateCompanionBuilder =
    QuranChaptersCacheCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> id,
      Value<int> chapterNumber,
      Value<String> nameArabic,
      Value<String?> nameEnglish,
      Value<int> versesCount,
      Value<String> source,
    });

class $$QuranChaptersCacheTableFilterComposer
    extends Composer<_$AppDatabase, $QuranChaptersCacheTable> {
  $$QuranChaptersCacheTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get chapterNumber => $composableBuilder(
    column: $table.chapterNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nameArabic => $composableBuilder(
    column: $table.nameArabic,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nameEnglish => $composableBuilder(
    column: $table.nameEnglish,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get versesCount => $composableBuilder(
    column: $table.versesCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnFilters(column),
  );
}

class $$QuranChaptersCacheTableOrderingComposer
    extends Composer<_$AppDatabase, $QuranChaptersCacheTable> {
  $$QuranChaptersCacheTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get chapterNumber => $composableBuilder(
    column: $table.chapterNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nameArabic => $composableBuilder(
    column: $table.nameArabic,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nameEnglish => $composableBuilder(
    column: $table.nameEnglish,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get versesCount => $composableBuilder(
    column: $table.versesCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$QuranChaptersCacheTableAnnotationComposer
    extends Composer<_$AppDatabase, $QuranChaptersCacheTable> {
  $$QuranChaptersCacheTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get chapterNumber => $composableBuilder(
    column: $table.chapterNumber,
    builder: (column) => column,
  );

  GeneratedColumn<String> get nameArabic => $composableBuilder(
    column: $table.nameArabic,
    builder: (column) => column,
  );

  GeneratedColumn<String> get nameEnglish => $composableBuilder(
    column: $table.nameEnglish,
    builder: (column) => column,
  );

  GeneratedColumn<int> get versesCount => $composableBuilder(
    column: $table.versesCount,
    builder: (column) => column,
  );

  GeneratedColumn<String> get source =>
      $composableBuilder(column: $table.source, builder: (column) => column);
}

class $$QuranChaptersCacheTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $QuranChaptersCacheTable,
          QuranChaptersCacheData,
          $$QuranChaptersCacheTableFilterComposer,
          $$QuranChaptersCacheTableOrderingComposer,
          $$QuranChaptersCacheTableAnnotationComposer,
          $$QuranChaptersCacheTableCreateCompanionBuilder,
          $$QuranChaptersCacheTableUpdateCompanionBuilder,
          (
            QuranChaptersCacheData,
            BaseReferences<
              _$AppDatabase,
              $QuranChaptersCacheTable,
              QuranChaptersCacheData
            >,
          ),
          QuranChaptersCacheData,
          PrefetchHooks Function()
        > {
  $$QuranChaptersCacheTableTableManager(
    _$AppDatabase db,
    $QuranChaptersCacheTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$QuranChaptersCacheTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$QuranChaptersCacheTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$QuranChaptersCacheTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> id = const Value.absent(),
                Value<int> chapterNumber = const Value.absent(),
                Value<String> nameArabic = const Value.absent(),
                Value<String?> nameEnglish = const Value.absent(),
                Value<int> versesCount = const Value.absent(),
                Value<String> source = const Value.absent(),
              }) => QuranChaptersCacheCompanion(
                createdAt: createdAt,
                updatedAt: updatedAt,
                id: id,
                chapterNumber: chapterNumber,
                nameArabic: nameArabic,
                nameEnglish: nameEnglish,
                versesCount: versesCount,
                source: source,
              ),
          createCompanionCallback:
              ({
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<int> id = const Value.absent(),
                required int chapterNumber,
                required String nameArabic,
                Value<String?> nameEnglish = const Value.absent(),
                required int versesCount,
                required String source,
              }) => QuranChaptersCacheCompanion.insert(
                createdAt: createdAt,
                updatedAt: updatedAt,
                id: id,
                chapterNumber: chapterNumber,
                nameArabic: nameArabic,
                nameEnglish: nameEnglish,
                versesCount: versesCount,
                source: source,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$QuranChaptersCacheTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $QuranChaptersCacheTable,
      QuranChaptersCacheData,
      $$QuranChaptersCacheTableFilterComposer,
      $$QuranChaptersCacheTableOrderingComposer,
      $$QuranChaptersCacheTableAnnotationComposer,
      $$QuranChaptersCacheTableCreateCompanionBuilder,
      $$QuranChaptersCacheTableUpdateCompanionBuilder,
      (
        QuranChaptersCacheData,
        BaseReferences<
          _$AppDatabase,
          $QuranChaptersCacheTable,
          QuranChaptersCacheData
        >,
      ),
      QuranChaptersCacheData,
      PrefetchHooks Function()
    >;
typedef $$QuranVersesCacheTableCreateCompanionBuilder =
    QuranVersesCacheCompanion Function({
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<int> id,
      required int chapterNumber,
      required int verseNumber,
      required String verseKey,
      required String textArabic,
      Value<String?> translationText,
      Value<String?> translationSource,
      required String source,
    });
typedef $$QuranVersesCacheTableUpdateCompanionBuilder =
    QuranVersesCacheCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> id,
      Value<int> chapterNumber,
      Value<int> verseNumber,
      Value<String> verseKey,
      Value<String> textArabic,
      Value<String?> translationText,
      Value<String?> translationSource,
      Value<String> source,
    });

class $$QuranVersesCacheTableFilterComposer
    extends Composer<_$AppDatabase, $QuranVersesCacheTable> {
  $$QuranVersesCacheTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get chapterNumber => $composableBuilder(
    column: $table.chapterNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get verseNumber => $composableBuilder(
    column: $table.verseNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get verseKey => $composableBuilder(
    column: $table.verseKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get textArabic => $composableBuilder(
    column: $table.textArabic,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get translationText => $composableBuilder(
    column: $table.translationText,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get translationSource => $composableBuilder(
    column: $table.translationSource,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnFilters(column),
  );
}

class $$QuranVersesCacheTableOrderingComposer
    extends Composer<_$AppDatabase, $QuranVersesCacheTable> {
  $$QuranVersesCacheTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get chapterNumber => $composableBuilder(
    column: $table.chapterNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get verseNumber => $composableBuilder(
    column: $table.verseNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get verseKey => $composableBuilder(
    column: $table.verseKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get textArabic => $composableBuilder(
    column: $table.textArabic,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get translationText => $composableBuilder(
    column: $table.translationText,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get translationSource => $composableBuilder(
    column: $table.translationSource,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$QuranVersesCacheTableAnnotationComposer
    extends Composer<_$AppDatabase, $QuranVersesCacheTable> {
  $$QuranVersesCacheTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get chapterNumber => $composableBuilder(
    column: $table.chapterNumber,
    builder: (column) => column,
  );

  GeneratedColumn<int> get verseNumber => $composableBuilder(
    column: $table.verseNumber,
    builder: (column) => column,
  );

  GeneratedColumn<String> get verseKey =>
      $composableBuilder(column: $table.verseKey, builder: (column) => column);

  GeneratedColumn<String> get textArabic => $composableBuilder(
    column: $table.textArabic,
    builder: (column) => column,
  );

  GeneratedColumn<String> get translationText => $composableBuilder(
    column: $table.translationText,
    builder: (column) => column,
  );

  GeneratedColumn<String> get translationSource => $composableBuilder(
    column: $table.translationSource,
    builder: (column) => column,
  );

  GeneratedColumn<String> get source =>
      $composableBuilder(column: $table.source, builder: (column) => column);
}

class $$QuranVersesCacheTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $QuranVersesCacheTable,
          QuranVersesCacheData,
          $$QuranVersesCacheTableFilterComposer,
          $$QuranVersesCacheTableOrderingComposer,
          $$QuranVersesCacheTableAnnotationComposer,
          $$QuranVersesCacheTableCreateCompanionBuilder,
          $$QuranVersesCacheTableUpdateCompanionBuilder,
          (
            QuranVersesCacheData,
            BaseReferences<
              _$AppDatabase,
              $QuranVersesCacheTable,
              QuranVersesCacheData
            >,
          ),
          QuranVersesCacheData,
          PrefetchHooks Function()
        > {
  $$QuranVersesCacheTableTableManager(
    _$AppDatabase db,
    $QuranVersesCacheTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$QuranVersesCacheTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$QuranVersesCacheTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$QuranVersesCacheTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> id = const Value.absent(),
                Value<int> chapterNumber = const Value.absent(),
                Value<int> verseNumber = const Value.absent(),
                Value<String> verseKey = const Value.absent(),
                Value<String> textArabic = const Value.absent(),
                Value<String?> translationText = const Value.absent(),
                Value<String?> translationSource = const Value.absent(),
                Value<String> source = const Value.absent(),
              }) => QuranVersesCacheCompanion(
                createdAt: createdAt,
                updatedAt: updatedAt,
                id: id,
                chapterNumber: chapterNumber,
                verseNumber: verseNumber,
                verseKey: verseKey,
                textArabic: textArabic,
                translationText: translationText,
                translationSource: translationSource,
                source: source,
              ),
          createCompanionCallback:
              ({
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<int> id = const Value.absent(),
                required int chapterNumber,
                required int verseNumber,
                required String verseKey,
                required String textArabic,
                Value<String?> translationText = const Value.absent(),
                Value<String?> translationSource = const Value.absent(),
                required String source,
              }) => QuranVersesCacheCompanion.insert(
                createdAt: createdAt,
                updatedAt: updatedAt,
                id: id,
                chapterNumber: chapterNumber,
                verseNumber: verseNumber,
                verseKey: verseKey,
                textArabic: textArabic,
                translationText: translationText,
                translationSource: translationSource,
                source: source,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$QuranVersesCacheTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $QuranVersesCacheTable,
      QuranVersesCacheData,
      $$QuranVersesCacheTableFilterComposer,
      $$QuranVersesCacheTableOrderingComposer,
      $$QuranVersesCacheTableAnnotationComposer,
      $$QuranVersesCacheTableCreateCompanionBuilder,
      $$QuranVersesCacheTableUpdateCompanionBuilder,
      (
        QuranVersesCacheData,
        BaseReferences<
          _$AppDatabase,
          $QuranVersesCacheTable,
          QuranVersesCacheData
        >,
      ),
      QuranVersesCacheData,
      PrefetchHooks Function()
    >;
typedef $$TafsirCachesTableCreateCompanionBuilder =
    TafsirCachesCompanion Function({
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<int> id,
      required String verseKey,
      required String tafsirId,
      required String languageCode,
      required String tafsirText,
      required String source,
    });
typedef $$TafsirCachesTableUpdateCompanionBuilder =
    TafsirCachesCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> id,
      Value<String> verseKey,
      Value<String> tafsirId,
      Value<String> languageCode,
      Value<String> tafsirText,
      Value<String> source,
    });

class $$TafsirCachesTableFilterComposer
    extends Composer<_$AppDatabase, $TafsirCachesTable> {
  $$TafsirCachesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get verseKey => $composableBuilder(
    column: $table.verseKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tafsirId => $composableBuilder(
    column: $table.tafsirId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get languageCode => $composableBuilder(
    column: $table.languageCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tafsirText => $composableBuilder(
    column: $table.tafsirText,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnFilters(column),
  );
}

class $$TafsirCachesTableOrderingComposer
    extends Composer<_$AppDatabase, $TafsirCachesTable> {
  $$TafsirCachesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get verseKey => $composableBuilder(
    column: $table.verseKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tafsirId => $composableBuilder(
    column: $table.tafsirId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get languageCode => $composableBuilder(
    column: $table.languageCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tafsirText => $composableBuilder(
    column: $table.tafsirText,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TafsirCachesTableAnnotationComposer
    extends Composer<_$AppDatabase, $TafsirCachesTable> {
  $$TafsirCachesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get verseKey =>
      $composableBuilder(column: $table.verseKey, builder: (column) => column);

  GeneratedColumn<String> get tafsirId =>
      $composableBuilder(column: $table.tafsirId, builder: (column) => column);

  GeneratedColumn<String> get languageCode => $composableBuilder(
    column: $table.languageCode,
    builder: (column) => column,
  );

  GeneratedColumn<String> get tafsirText => $composableBuilder(
    column: $table.tafsirText,
    builder: (column) => column,
  );

  GeneratedColumn<String> get source =>
      $composableBuilder(column: $table.source, builder: (column) => column);
}

class $$TafsirCachesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TafsirCachesTable,
          TafsirCache,
          $$TafsirCachesTableFilterComposer,
          $$TafsirCachesTableOrderingComposer,
          $$TafsirCachesTableAnnotationComposer,
          $$TafsirCachesTableCreateCompanionBuilder,
          $$TafsirCachesTableUpdateCompanionBuilder,
          (
            TafsirCache,
            BaseReferences<_$AppDatabase, $TafsirCachesTable, TafsirCache>,
          ),
          TafsirCache,
          PrefetchHooks Function()
        > {
  $$TafsirCachesTableTableManager(_$AppDatabase db, $TafsirCachesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TafsirCachesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TafsirCachesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TafsirCachesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> id = const Value.absent(),
                Value<String> verseKey = const Value.absent(),
                Value<String> tafsirId = const Value.absent(),
                Value<String> languageCode = const Value.absent(),
                Value<String> tafsirText = const Value.absent(),
                Value<String> source = const Value.absent(),
              }) => TafsirCachesCompanion(
                createdAt: createdAt,
                updatedAt: updatedAt,
                id: id,
                verseKey: verseKey,
                tafsirId: tafsirId,
                languageCode: languageCode,
                tafsirText: tafsirText,
                source: source,
              ),
          createCompanionCallback:
              ({
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<int> id = const Value.absent(),
                required String verseKey,
                required String tafsirId,
                required String languageCode,
                required String tafsirText,
                required String source,
              }) => TafsirCachesCompanion.insert(
                createdAt: createdAt,
                updatedAt: updatedAt,
                id: id,
                verseKey: verseKey,
                tafsirId: tafsirId,
                languageCode: languageCode,
                tafsirText: tafsirText,
                source: source,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$TafsirCachesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TafsirCachesTable,
      TafsirCache,
      $$TafsirCachesTableFilterComposer,
      $$TafsirCachesTableOrderingComposer,
      $$TafsirCachesTableAnnotationComposer,
      $$TafsirCachesTableCreateCompanionBuilder,
      $$TafsirCachesTableUpdateCompanionBuilder,
      (
        TafsirCache,
        BaseReferences<_$AppDatabase, $TafsirCachesTable, TafsirCache>,
      ),
      TafsirCache,
      PrefetchHooks Function()
    >;
typedef $$AudioCacheMetadataTableCreateCompanionBuilder =
    AudioCacheMetadataCompanion Function({
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<int> id,
      Value<String?> verseKey,
      required String reciterId,
      required String remoteUrl,
      Value<String?> localPath,
      required String source,
      Value<bool> isDownloaded,
    });
typedef $$AudioCacheMetadataTableUpdateCompanionBuilder =
    AudioCacheMetadataCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> id,
      Value<String?> verseKey,
      Value<String> reciterId,
      Value<String> remoteUrl,
      Value<String?> localPath,
      Value<String> source,
      Value<bool> isDownloaded,
    });

class $$AudioCacheMetadataTableFilterComposer
    extends Composer<_$AppDatabase, $AudioCacheMetadataTable> {
  $$AudioCacheMetadataTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get verseKey => $composableBuilder(
    column: $table.verseKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get reciterId => $composableBuilder(
    column: $table.reciterId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get remoteUrl => $composableBuilder(
    column: $table.remoteUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get localPath => $composableBuilder(
    column: $table.localPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isDownloaded => $composableBuilder(
    column: $table.isDownloaded,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AudioCacheMetadataTableOrderingComposer
    extends Composer<_$AppDatabase, $AudioCacheMetadataTable> {
  $$AudioCacheMetadataTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get verseKey => $composableBuilder(
    column: $table.verseKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get reciterId => $composableBuilder(
    column: $table.reciterId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get remoteUrl => $composableBuilder(
    column: $table.remoteUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get localPath => $composableBuilder(
    column: $table.localPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isDownloaded => $composableBuilder(
    column: $table.isDownloaded,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AudioCacheMetadataTableAnnotationComposer
    extends Composer<_$AppDatabase, $AudioCacheMetadataTable> {
  $$AudioCacheMetadataTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get verseKey =>
      $composableBuilder(column: $table.verseKey, builder: (column) => column);

  GeneratedColumn<String> get reciterId =>
      $composableBuilder(column: $table.reciterId, builder: (column) => column);

  GeneratedColumn<String> get remoteUrl =>
      $composableBuilder(column: $table.remoteUrl, builder: (column) => column);

  GeneratedColumn<String> get localPath =>
      $composableBuilder(column: $table.localPath, builder: (column) => column);

  GeneratedColumn<String> get source =>
      $composableBuilder(column: $table.source, builder: (column) => column);

  GeneratedColumn<bool> get isDownloaded => $composableBuilder(
    column: $table.isDownloaded,
    builder: (column) => column,
  );
}

class $$AudioCacheMetadataTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AudioCacheMetadataTable,
          AudioCacheMetadataData,
          $$AudioCacheMetadataTableFilterComposer,
          $$AudioCacheMetadataTableOrderingComposer,
          $$AudioCacheMetadataTableAnnotationComposer,
          $$AudioCacheMetadataTableCreateCompanionBuilder,
          $$AudioCacheMetadataTableUpdateCompanionBuilder,
          (
            AudioCacheMetadataData,
            BaseReferences<
              _$AppDatabase,
              $AudioCacheMetadataTable,
              AudioCacheMetadataData
            >,
          ),
          AudioCacheMetadataData,
          PrefetchHooks Function()
        > {
  $$AudioCacheMetadataTableTableManager(
    _$AppDatabase db,
    $AudioCacheMetadataTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AudioCacheMetadataTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AudioCacheMetadataTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AudioCacheMetadataTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> id = const Value.absent(),
                Value<String?> verseKey = const Value.absent(),
                Value<String> reciterId = const Value.absent(),
                Value<String> remoteUrl = const Value.absent(),
                Value<String?> localPath = const Value.absent(),
                Value<String> source = const Value.absent(),
                Value<bool> isDownloaded = const Value.absent(),
              }) => AudioCacheMetadataCompanion(
                createdAt: createdAt,
                updatedAt: updatedAt,
                id: id,
                verseKey: verseKey,
                reciterId: reciterId,
                remoteUrl: remoteUrl,
                localPath: localPath,
                source: source,
                isDownloaded: isDownloaded,
              ),
          createCompanionCallback:
              ({
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<int> id = const Value.absent(),
                Value<String?> verseKey = const Value.absent(),
                required String reciterId,
                required String remoteUrl,
                Value<String?> localPath = const Value.absent(),
                required String source,
                Value<bool> isDownloaded = const Value.absent(),
              }) => AudioCacheMetadataCompanion.insert(
                createdAt: createdAt,
                updatedAt: updatedAt,
                id: id,
                verseKey: verseKey,
                reciterId: reciterId,
                remoteUrl: remoteUrl,
                localPath: localPath,
                source: source,
                isDownloaded: isDownloaded,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AudioCacheMetadataTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AudioCacheMetadataTable,
      AudioCacheMetadataData,
      $$AudioCacheMetadataTableFilterComposer,
      $$AudioCacheMetadataTableOrderingComposer,
      $$AudioCacheMetadataTableAnnotationComposer,
      $$AudioCacheMetadataTableCreateCompanionBuilder,
      $$AudioCacheMetadataTableUpdateCompanionBuilder,
      (
        AudioCacheMetadataData,
        BaseReferences<
          _$AppDatabase,
          $AudioCacheMetadataTable,
          AudioCacheMetadataData
        >,
      ),
      AudioCacheMetadataData,
      PrefetchHooks Function()
    >;
typedef $$QuranRecitersCacheTableCreateCompanionBuilder =
    QuranRecitersCacheCompanion Function({
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<int> id,
      required String reciterId,
      Value<String?> nameArabic,
      Value<String?> nameEnglish,
      Value<String?> style,
      required String source,
    });
typedef $$QuranRecitersCacheTableUpdateCompanionBuilder =
    QuranRecitersCacheCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> id,
      Value<String> reciterId,
      Value<String?> nameArabic,
      Value<String?> nameEnglish,
      Value<String?> style,
      Value<String> source,
    });

class $$QuranRecitersCacheTableFilterComposer
    extends Composer<_$AppDatabase, $QuranRecitersCacheTable> {
  $$QuranRecitersCacheTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get reciterId => $composableBuilder(
    column: $table.reciterId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nameArabic => $composableBuilder(
    column: $table.nameArabic,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nameEnglish => $composableBuilder(
    column: $table.nameEnglish,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get style => $composableBuilder(
    column: $table.style,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnFilters(column),
  );
}

class $$QuranRecitersCacheTableOrderingComposer
    extends Composer<_$AppDatabase, $QuranRecitersCacheTable> {
  $$QuranRecitersCacheTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get reciterId => $composableBuilder(
    column: $table.reciterId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nameArabic => $composableBuilder(
    column: $table.nameArabic,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nameEnglish => $composableBuilder(
    column: $table.nameEnglish,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get style => $composableBuilder(
    column: $table.style,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$QuranRecitersCacheTableAnnotationComposer
    extends Composer<_$AppDatabase, $QuranRecitersCacheTable> {
  $$QuranRecitersCacheTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get reciterId =>
      $composableBuilder(column: $table.reciterId, builder: (column) => column);

  GeneratedColumn<String> get nameArabic => $composableBuilder(
    column: $table.nameArabic,
    builder: (column) => column,
  );

  GeneratedColumn<String> get nameEnglish => $composableBuilder(
    column: $table.nameEnglish,
    builder: (column) => column,
  );

  GeneratedColumn<String> get style =>
      $composableBuilder(column: $table.style, builder: (column) => column);

  GeneratedColumn<String> get source =>
      $composableBuilder(column: $table.source, builder: (column) => column);
}

class $$QuranRecitersCacheTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $QuranRecitersCacheTable,
          QuranRecitersCacheData,
          $$QuranRecitersCacheTableFilterComposer,
          $$QuranRecitersCacheTableOrderingComposer,
          $$QuranRecitersCacheTableAnnotationComposer,
          $$QuranRecitersCacheTableCreateCompanionBuilder,
          $$QuranRecitersCacheTableUpdateCompanionBuilder,
          (
            QuranRecitersCacheData,
            BaseReferences<
              _$AppDatabase,
              $QuranRecitersCacheTable,
              QuranRecitersCacheData
            >,
          ),
          QuranRecitersCacheData,
          PrefetchHooks Function()
        > {
  $$QuranRecitersCacheTableTableManager(
    _$AppDatabase db,
    $QuranRecitersCacheTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$QuranRecitersCacheTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$QuranRecitersCacheTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$QuranRecitersCacheTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> id = const Value.absent(),
                Value<String> reciterId = const Value.absent(),
                Value<String?> nameArabic = const Value.absent(),
                Value<String?> nameEnglish = const Value.absent(),
                Value<String?> style = const Value.absent(),
                Value<String> source = const Value.absent(),
              }) => QuranRecitersCacheCompanion(
                createdAt: createdAt,
                updatedAt: updatedAt,
                id: id,
                reciterId: reciterId,
                nameArabic: nameArabic,
                nameEnglish: nameEnglish,
                style: style,
                source: source,
              ),
          createCompanionCallback:
              ({
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<int> id = const Value.absent(),
                required String reciterId,
                Value<String?> nameArabic = const Value.absent(),
                Value<String?> nameEnglish = const Value.absent(),
                Value<String?> style = const Value.absent(),
                required String source,
              }) => QuranRecitersCacheCompanion.insert(
                createdAt: createdAt,
                updatedAt: updatedAt,
                id: id,
                reciterId: reciterId,
                nameArabic: nameArabic,
                nameEnglish: nameEnglish,
                style: style,
                source: source,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$QuranRecitersCacheTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $QuranRecitersCacheTable,
      QuranRecitersCacheData,
      $$QuranRecitersCacheTableFilterComposer,
      $$QuranRecitersCacheTableOrderingComposer,
      $$QuranRecitersCacheTableAnnotationComposer,
      $$QuranRecitersCacheTableCreateCompanionBuilder,
      $$QuranRecitersCacheTableUpdateCompanionBuilder,
      (
        QuranRecitersCacheData,
        BaseReferences<
          _$AppDatabase,
          $QuranRecitersCacheTable,
          QuranRecitersCacheData
        >,
      ),
      QuranRecitersCacheData,
      PrefetchHooks Function()
    >;
typedef $$DailyAyahHistoryTableCreateCompanionBuilder =
    DailyAyahHistoryCompanion Function({
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<DateTime?> deletedAt,
      Value<String?> firebaseId,
      Value<String?> ownerUserId,
      Value<String> syncStatus,
      Value<int> id,
      required String verseKey,
      required DateTime selectedDate,
      Value<bool> wasRead,
    });
typedef $$DailyAyahHistoryTableUpdateCompanionBuilder =
    DailyAyahHistoryCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<String?> firebaseId,
      Value<String?> ownerUserId,
      Value<String> syncStatus,
      Value<int> id,
      Value<String> verseKey,
      Value<DateTime> selectedDate,
      Value<bool> wasRead,
    });

class $$DailyAyahHistoryTableFilterComposer
    extends Composer<_$AppDatabase, $DailyAyahHistoryTable> {
  $$DailyAyahHistoryTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get firebaseId => $composableBuilder(
    column: $table.firebaseId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ownerUserId => $composableBuilder(
    column: $table.ownerUserId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get verseKey => $composableBuilder(
    column: $table.verseKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get selectedDate => $composableBuilder(
    column: $table.selectedDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get wasRead => $composableBuilder(
    column: $table.wasRead,
    builder: (column) => ColumnFilters(column),
  );
}

class $$DailyAyahHistoryTableOrderingComposer
    extends Composer<_$AppDatabase, $DailyAyahHistoryTable> {
  $$DailyAyahHistoryTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get firebaseId => $composableBuilder(
    column: $table.firebaseId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ownerUserId => $composableBuilder(
    column: $table.ownerUserId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get verseKey => $composableBuilder(
    column: $table.verseKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get selectedDate => $composableBuilder(
    column: $table.selectedDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get wasRead => $composableBuilder(
    column: $table.wasRead,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DailyAyahHistoryTableAnnotationComposer
    extends Composer<_$AppDatabase, $DailyAyahHistoryTable> {
  $$DailyAyahHistoryTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get firebaseId => $composableBuilder(
    column: $table.firebaseId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get ownerUserId => $composableBuilder(
    column: $table.ownerUserId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );

  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get verseKey =>
      $composableBuilder(column: $table.verseKey, builder: (column) => column);

  GeneratedColumn<DateTime> get selectedDate => $composableBuilder(
    column: $table.selectedDate,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get wasRead =>
      $composableBuilder(column: $table.wasRead, builder: (column) => column);
}

class $$DailyAyahHistoryTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DailyAyahHistoryTable,
          DailyAyahHistoryData,
          $$DailyAyahHistoryTableFilterComposer,
          $$DailyAyahHistoryTableOrderingComposer,
          $$DailyAyahHistoryTableAnnotationComposer,
          $$DailyAyahHistoryTableCreateCompanionBuilder,
          $$DailyAyahHistoryTableUpdateCompanionBuilder,
          (
            DailyAyahHistoryData,
            BaseReferences<
              _$AppDatabase,
              $DailyAyahHistoryTable,
              DailyAyahHistoryData
            >,
          ),
          DailyAyahHistoryData,
          PrefetchHooks Function()
        > {
  $$DailyAyahHistoryTableTableManager(
    _$AppDatabase db,
    $DailyAyahHistoryTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DailyAyahHistoryTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DailyAyahHistoryTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DailyAyahHistoryTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String?> firebaseId = const Value.absent(),
                Value<String?> ownerUserId = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<int> id = const Value.absent(),
                Value<String> verseKey = const Value.absent(),
                Value<DateTime> selectedDate = const Value.absent(),
                Value<bool> wasRead = const Value.absent(),
              }) => DailyAyahHistoryCompanion(
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                firebaseId: firebaseId,
                ownerUserId: ownerUserId,
                syncStatus: syncStatus,
                id: id,
                verseKey: verseKey,
                selectedDate: selectedDate,
                wasRead: wasRead,
              ),
          createCompanionCallback:
              ({
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String?> firebaseId = const Value.absent(),
                Value<String?> ownerUserId = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<int> id = const Value.absent(),
                required String verseKey,
                required DateTime selectedDate,
                Value<bool> wasRead = const Value.absent(),
              }) => DailyAyahHistoryCompanion.insert(
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                firebaseId: firebaseId,
                ownerUserId: ownerUserId,
                syncStatus: syncStatus,
                id: id,
                verseKey: verseKey,
                selectedDate: selectedDate,
                wasRead: wasRead,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$DailyAyahHistoryTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DailyAyahHistoryTable,
      DailyAyahHistoryData,
      $$DailyAyahHistoryTableFilterComposer,
      $$DailyAyahHistoryTableOrderingComposer,
      $$DailyAyahHistoryTableAnnotationComposer,
      $$DailyAyahHistoryTableCreateCompanionBuilder,
      $$DailyAyahHistoryTableUpdateCompanionBuilder,
      (
        DailyAyahHistoryData,
        BaseReferences<
          _$AppDatabase,
          $DailyAyahHistoryTable,
          DailyAyahHistoryData
        >,
      ),
      DailyAyahHistoryData,
      PrefetchHooks Function()
    >;
typedef $$ReadingProgressTableCreateCompanionBuilder =
    ReadingProgressCompanion Function({
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<DateTime?> deletedAt,
      Value<String?> firebaseId,
      Value<String?> ownerUserId,
      Value<String> syncStatus,
      Value<int> id,
      required String verseKey,
      required int chapterNumber,
      required int verseNumber,
      Value<DateTime?> lastReadAt,
    });
typedef $$ReadingProgressTableUpdateCompanionBuilder =
    ReadingProgressCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<String?> firebaseId,
      Value<String?> ownerUserId,
      Value<String> syncStatus,
      Value<int> id,
      Value<String> verseKey,
      Value<int> chapterNumber,
      Value<int> verseNumber,
      Value<DateTime?> lastReadAt,
    });

class $$ReadingProgressTableFilterComposer
    extends Composer<_$AppDatabase, $ReadingProgressTable> {
  $$ReadingProgressTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get firebaseId => $composableBuilder(
    column: $table.firebaseId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ownerUserId => $composableBuilder(
    column: $table.ownerUserId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get verseKey => $composableBuilder(
    column: $table.verseKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get chapterNumber => $composableBuilder(
    column: $table.chapterNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get verseNumber => $composableBuilder(
    column: $table.verseNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastReadAt => $composableBuilder(
    column: $table.lastReadAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ReadingProgressTableOrderingComposer
    extends Composer<_$AppDatabase, $ReadingProgressTable> {
  $$ReadingProgressTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get firebaseId => $composableBuilder(
    column: $table.firebaseId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ownerUserId => $composableBuilder(
    column: $table.ownerUserId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get verseKey => $composableBuilder(
    column: $table.verseKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get chapterNumber => $composableBuilder(
    column: $table.chapterNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get verseNumber => $composableBuilder(
    column: $table.verseNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastReadAt => $composableBuilder(
    column: $table.lastReadAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ReadingProgressTableAnnotationComposer
    extends Composer<_$AppDatabase, $ReadingProgressTable> {
  $$ReadingProgressTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get firebaseId => $composableBuilder(
    column: $table.firebaseId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get ownerUserId => $composableBuilder(
    column: $table.ownerUserId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );

  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get verseKey =>
      $composableBuilder(column: $table.verseKey, builder: (column) => column);

  GeneratedColumn<int> get chapterNumber => $composableBuilder(
    column: $table.chapterNumber,
    builder: (column) => column,
  );

  GeneratedColumn<int> get verseNumber => $composableBuilder(
    column: $table.verseNumber,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get lastReadAt => $composableBuilder(
    column: $table.lastReadAt,
    builder: (column) => column,
  );
}

class $$ReadingProgressTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ReadingProgressTable,
          ReadingProgressData,
          $$ReadingProgressTableFilterComposer,
          $$ReadingProgressTableOrderingComposer,
          $$ReadingProgressTableAnnotationComposer,
          $$ReadingProgressTableCreateCompanionBuilder,
          $$ReadingProgressTableUpdateCompanionBuilder,
          (
            ReadingProgressData,
            BaseReferences<
              _$AppDatabase,
              $ReadingProgressTable,
              ReadingProgressData
            >,
          ),
          ReadingProgressData,
          PrefetchHooks Function()
        > {
  $$ReadingProgressTableTableManager(
    _$AppDatabase db,
    $ReadingProgressTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ReadingProgressTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ReadingProgressTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ReadingProgressTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String?> firebaseId = const Value.absent(),
                Value<String?> ownerUserId = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<int> id = const Value.absent(),
                Value<String> verseKey = const Value.absent(),
                Value<int> chapterNumber = const Value.absent(),
                Value<int> verseNumber = const Value.absent(),
                Value<DateTime?> lastReadAt = const Value.absent(),
              }) => ReadingProgressCompanion(
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                firebaseId: firebaseId,
                ownerUserId: ownerUserId,
                syncStatus: syncStatus,
                id: id,
                verseKey: verseKey,
                chapterNumber: chapterNumber,
                verseNumber: verseNumber,
                lastReadAt: lastReadAt,
              ),
          createCompanionCallback:
              ({
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String?> firebaseId = const Value.absent(),
                Value<String?> ownerUserId = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<int> id = const Value.absent(),
                required String verseKey,
                required int chapterNumber,
                required int verseNumber,
                Value<DateTime?> lastReadAt = const Value.absent(),
              }) => ReadingProgressCompanion.insert(
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                firebaseId: firebaseId,
                ownerUserId: ownerUserId,
                syncStatus: syncStatus,
                id: id,
                verseKey: verseKey,
                chapterNumber: chapterNumber,
                verseNumber: verseNumber,
                lastReadAt: lastReadAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ReadingProgressTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ReadingProgressTable,
      ReadingProgressData,
      $$ReadingProgressTableFilterComposer,
      $$ReadingProgressTableOrderingComposer,
      $$ReadingProgressTableAnnotationComposer,
      $$ReadingProgressTableCreateCompanionBuilder,
      $$ReadingProgressTableUpdateCompanionBuilder,
      (
        ReadingProgressData,
        BaseReferences<
          _$AppDatabase,
          $ReadingProgressTable,
          ReadingProgressData
        >,
      ),
      ReadingProgressData,
      PrefetchHooks Function()
    >;
typedef $$ReadingSessionsTableCreateCompanionBuilder =
    ReadingSessionsCompanion Function({
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<DateTime?> deletedAt,
      Value<String?> firebaseId,
      Value<String?> ownerUserId,
      Value<String> syncStatus,
      Value<int> id,
      required DateTime sessionDate,
      required DateTime startedAt,
      Value<DateTime?> endedAt,
      Value<int> ayahCount,
      Value<int> pageCount,
      Value<int> durationMinutes,
      Value<String?> startVerseKey,
      Value<String?> endVerseKey,
    });
typedef $$ReadingSessionsTableUpdateCompanionBuilder =
    ReadingSessionsCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<String?> firebaseId,
      Value<String?> ownerUserId,
      Value<String> syncStatus,
      Value<int> id,
      Value<DateTime> sessionDate,
      Value<DateTime> startedAt,
      Value<DateTime?> endedAt,
      Value<int> ayahCount,
      Value<int> pageCount,
      Value<int> durationMinutes,
      Value<String?> startVerseKey,
      Value<String?> endVerseKey,
    });

class $$ReadingSessionsTableFilterComposer
    extends Composer<_$AppDatabase, $ReadingSessionsTable> {
  $$ReadingSessionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get firebaseId => $composableBuilder(
    column: $table.firebaseId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ownerUserId => $composableBuilder(
    column: $table.ownerUserId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get sessionDate => $composableBuilder(
    column: $table.sessionDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startedAt => $composableBuilder(
    column: $table.startedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get endedAt => $composableBuilder(
    column: $table.endedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get ayahCount => $composableBuilder(
    column: $table.ayahCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get pageCount => $composableBuilder(
    column: $table.pageCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get durationMinutes => $composableBuilder(
    column: $table.durationMinutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get startVerseKey => $composableBuilder(
    column: $table.startVerseKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get endVerseKey => $composableBuilder(
    column: $table.endVerseKey,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ReadingSessionsTableOrderingComposer
    extends Composer<_$AppDatabase, $ReadingSessionsTable> {
  $$ReadingSessionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get firebaseId => $composableBuilder(
    column: $table.firebaseId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ownerUserId => $composableBuilder(
    column: $table.ownerUserId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get sessionDate => $composableBuilder(
    column: $table.sessionDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startedAt => $composableBuilder(
    column: $table.startedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get endedAt => $composableBuilder(
    column: $table.endedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get ayahCount => $composableBuilder(
    column: $table.ayahCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get pageCount => $composableBuilder(
    column: $table.pageCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get durationMinutes => $composableBuilder(
    column: $table.durationMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get startVerseKey => $composableBuilder(
    column: $table.startVerseKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get endVerseKey => $composableBuilder(
    column: $table.endVerseKey,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ReadingSessionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ReadingSessionsTable> {
  $$ReadingSessionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get firebaseId => $composableBuilder(
    column: $table.firebaseId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get ownerUserId => $composableBuilder(
    column: $table.ownerUserId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );

  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get sessionDate => $composableBuilder(
    column: $table.sessionDate,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get startedAt =>
      $composableBuilder(column: $table.startedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get endedAt =>
      $composableBuilder(column: $table.endedAt, builder: (column) => column);

  GeneratedColumn<int> get ayahCount =>
      $composableBuilder(column: $table.ayahCount, builder: (column) => column);

  GeneratedColumn<int> get pageCount =>
      $composableBuilder(column: $table.pageCount, builder: (column) => column);

  GeneratedColumn<int> get durationMinutes => $composableBuilder(
    column: $table.durationMinutes,
    builder: (column) => column,
  );

  GeneratedColumn<String> get startVerseKey => $composableBuilder(
    column: $table.startVerseKey,
    builder: (column) => column,
  );

  GeneratedColumn<String> get endVerseKey => $composableBuilder(
    column: $table.endVerseKey,
    builder: (column) => column,
  );
}

class $$ReadingSessionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ReadingSessionsTable,
          ReadingSession,
          $$ReadingSessionsTableFilterComposer,
          $$ReadingSessionsTableOrderingComposer,
          $$ReadingSessionsTableAnnotationComposer,
          $$ReadingSessionsTableCreateCompanionBuilder,
          $$ReadingSessionsTableUpdateCompanionBuilder,
          (
            ReadingSession,
            BaseReferences<
              _$AppDatabase,
              $ReadingSessionsTable,
              ReadingSession
            >,
          ),
          ReadingSession,
          PrefetchHooks Function()
        > {
  $$ReadingSessionsTableTableManager(
    _$AppDatabase db,
    $ReadingSessionsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ReadingSessionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ReadingSessionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ReadingSessionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String?> firebaseId = const Value.absent(),
                Value<String?> ownerUserId = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<int> id = const Value.absent(),
                Value<DateTime> sessionDate = const Value.absent(),
                Value<DateTime> startedAt = const Value.absent(),
                Value<DateTime?> endedAt = const Value.absent(),
                Value<int> ayahCount = const Value.absent(),
                Value<int> pageCount = const Value.absent(),
                Value<int> durationMinutes = const Value.absent(),
                Value<String?> startVerseKey = const Value.absent(),
                Value<String?> endVerseKey = const Value.absent(),
              }) => ReadingSessionsCompanion(
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                firebaseId: firebaseId,
                ownerUserId: ownerUserId,
                syncStatus: syncStatus,
                id: id,
                sessionDate: sessionDate,
                startedAt: startedAt,
                endedAt: endedAt,
                ayahCount: ayahCount,
                pageCount: pageCount,
                durationMinutes: durationMinutes,
                startVerseKey: startVerseKey,
                endVerseKey: endVerseKey,
              ),
          createCompanionCallback:
              ({
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String?> firebaseId = const Value.absent(),
                Value<String?> ownerUserId = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<int> id = const Value.absent(),
                required DateTime sessionDate,
                required DateTime startedAt,
                Value<DateTime?> endedAt = const Value.absent(),
                Value<int> ayahCount = const Value.absent(),
                Value<int> pageCount = const Value.absent(),
                Value<int> durationMinutes = const Value.absent(),
                Value<String?> startVerseKey = const Value.absent(),
                Value<String?> endVerseKey = const Value.absent(),
              }) => ReadingSessionsCompanion.insert(
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                firebaseId: firebaseId,
                ownerUserId: ownerUserId,
                syncStatus: syncStatus,
                id: id,
                sessionDate: sessionDate,
                startedAt: startedAt,
                endedAt: endedAt,
                ayahCount: ayahCount,
                pageCount: pageCount,
                durationMinutes: durationMinutes,
                startVerseKey: startVerseKey,
                endVerseKey: endVerseKey,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ReadingSessionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ReadingSessionsTable,
      ReadingSession,
      $$ReadingSessionsTableFilterComposer,
      $$ReadingSessionsTableOrderingComposer,
      $$ReadingSessionsTableAnnotationComposer,
      $$ReadingSessionsTableCreateCompanionBuilder,
      $$ReadingSessionsTableUpdateCompanionBuilder,
      (
        ReadingSession,
        BaseReferences<_$AppDatabase, $ReadingSessionsTable, ReadingSession>,
      ),
      ReadingSession,
      PrefetchHooks Function()
    >;
typedef $$DailyGoalsTableCreateCompanionBuilder =
    DailyGoalsCompanion Function({
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<DateTime?> deletedAt,
      Value<String?> firebaseId,
      Value<String?> ownerUserId,
      Value<String> syncStatus,
      Value<int> id,
      required DateTime goalDate,
      Value<String> goalType,
      Value<int> targetVerses,
      Value<int> completedVerses,
      Value<int> targetPages,
      Value<int> completedPages,
      Value<int> targetMinutes,
      Value<int> completedMinutes,
      Value<bool> isCompleted,
    });
typedef $$DailyGoalsTableUpdateCompanionBuilder =
    DailyGoalsCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<String?> firebaseId,
      Value<String?> ownerUserId,
      Value<String> syncStatus,
      Value<int> id,
      Value<DateTime> goalDate,
      Value<String> goalType,
      Value<int> targetVerses,
      Value<int> completedVerses,
      Value<int> targetPages,
      Value<int> completedPages,
      Value<int> targetMinutes,
      Value<int> completedMinutes,
      Value<bool> isCompleted,
    });

class $$DailyGoalsTableFilterComposer
    extends Composer<_$AppDatabase, $DailyGoalsTable> {
  $$DailyGoalsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get firebaseId => $composableBuilder(
    column: $table.firebaseId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ownerUserId => $composableBuilder(
    column: $table.ownerUserId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get goalDate => $composableBuilder(
    column: $table.goalDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get goalType => $composableBuilder(
    column: $table.goalType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get targetVerses => $composableBuilder(
    column: $table.targetVerses,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get completedVerses => $composableBuilder(
    column: $table.completedVerses,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get targetPages => $composableBuilder(
    column: $table.targetPages,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get completedPages => $composableBuilder(
    column: $table.completedPages,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get targetMinutes => $composableBuilder(
    column: $table.targetMinutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get completedMinutes => $composableBuilder(
    column: $table.completedMinutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isCompleted => $composableBuilder(
    column: $table.isCompleted,
    builder: (column) => ColumnFilters(column),
  );
}

class $$DailyGoalsTableOrderingComposer
    extends Composer<_$AppDatabase, $DailyGoalsTable> {
  $$DailyGoalsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get firebaseId => $composableBuilder(
    column: $table.firebaseId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ownerUserId => $composableBuilder(
    column: $table.ownerUserId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get goalDate => $composableBuilder(
    column: $table.goalDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get goalType => $composableBuilder(
    column: $table.goalType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get targetVerses => $composableBuilder(
    column: $table.targetVerses,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get completedVerses => $composableBuilder(
    column: $table.completedVerses,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get targetPages => $composableBuilder(
    column: $table.targetPages,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get completedPages => $composableBuilder(
    column: $table.completedPages,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get targetMinutes => $composableBuilder(
    column: $table.targetMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get completedMinutes => $composableBuilder(
    column: $table.completedMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isCompleted => $composableBuilder(
    column: $table.isCompleted,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DailyGoalsTableAnnotationComposer
    extends Composer<_$AppDatabase, $DailyGoalsTable> {
  $$DailyGoalsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get firebaseId => $composableBuilder(
    column: $table.firebaseId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get ownerUserId => $composableBuilder(
    column: $table.ownerUserId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );

  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get goalDate =>
      $composableBuilder(column: $table.goalDate, builder: (column) => column);

  GeneratedColumn<String> get goalType =>
      $composableBuilder(column: $table.goalType, builder: (column) => column);

  GeneratedColumn<int> get targetVerses => $composableBuilder(
    column: $table.targetVerses,
    builder: (column) => column,
  );

  GeneratedColumn<int> get completedVerses => $composableBuilder(
    column: $table.completedVerses,
    builder: (column) => column,
  );

  GeneratedColumn<int> get targetPages => $composableBuilder(
    column: $table.targetPages,
    builder: (column) => column,
  );

  GeneratedColumn<int> get completedPages => $composableBuilder(
    column: $table.completedPages,
    builder: (column) => column,
  );

  GeneratedColumn<int> get targetMinutes => $composableBuilder(
    column: $table.targetMinutes,
    builder: (column) => column,
  );

  GeneratedColumn<int> get completedMinutes => $composableBuilder(
    column: $table.completedMinutes,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isCompleted => $composableBuilder(
    column: $table.isCompleted,
    builder: (column) => column,
  );
}

class $$DailyGoalsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DailyGoalsTable,
          DailyGoal,
          $$DailyGoalsTableFilterComposer,
          $$DailyGoalsTableOrderingComposer,
          $$DailyGoalsTableAnnotationComposer,
          $$DailyGoalsTableCreateCompanionBuilder,
          $$DailyGoalsTableUpdateCompanionBuilder,
          (
            DailyGoal,
            BaseReferences<_$AppDatabase, $DailyGoalsTable, DailyGoal>,
          ),
          DailyGoal,
          PrefetchHooks Function()
        > {
  $$DailyGoalsTableTableManager(_$AppDatabase db, $DailyGoalsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DailyGoalsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DailyGoalsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DailyGoalsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String?> firebaseId = const Value.absent(),
                Value<String?> ownerUserId = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<int> id = const Value.absent(),
                Value<DateTime> goalDate = const Value.absent(),
                Value<String> goalType = const Value.absent(),
                Value<int> targetVerses = const Value.absent(),
                Value<int> completedVerses = const Value.absent(),
                Value<int> targetPages = const Value.absent(),
                Value<int> completedPages = const Value.absent(),
                Value<int> targetMinutes = const Value.absent(),
                Value<int> completedMinutes = const Value.absent(),
                Value<bool> isCompleted = const Value.absent(),
              }) => DailyGoalsCompanion(
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                firebaseId: firebaseId,
                ownerUserId: ownerUserId,
                syncStatus: syncStatus,
                id: id,
                goalDate: goalDate,
                goalType: goalType,
                targetVerses: targetVerses,
                completedVerses: completedVerses,
                targetPages: targetPages,
                completedPages: completedPages,
                targetMinutes: targetMinutes,
                completedMinutes: completedMinutes,
                isCompleted: isCompleted,
              ),
          createCompanionCallback:
              ({
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String?> firebaseId = const Value.absent(),
                Value<String?> ownerUserId = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<int> id = const Value.absent(),
                required DateTime goalDate,
                Value<String> goalType = const Value.absent(),
                Value<int> targetVerses = const Value.absent(),
                Value<int> completedVerses = const Value.absent(),
                Value<int> targetPages = const Value.absent(),
                Value<int> completedPages = const Value.absent(),
                Value<int> targetMinutes = const Value.absent(),
                Value<int> completedMinutes = const Value.absent(),
                Value<bool> isCompleted = const Value.absent(),
              }) => DailyGoalsCompanion.insert(
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                firebaseId: firebaseId,
                ownerUserId: ownerUserId,
                syncStatus: syncStatus,
                id: id,
                goalDate: goalDate,
                goalType: goalType,
                targetVerses: targetVerses,
                completedVerses: completedVerses,
                targetPages: targetPages,
                completedPages: completedPages,
                targetMinutes: targetMinutes,
                completedMinutes: completedMinutes,
                isCompleted: isCompleted,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$DailyGoalsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DailyGoalsTable,
      DailyGoal,
      $$DailyGoalsTableFilterComposer,
      $$DailyGoalsTableOrderingComposer,
      $$DailyGoalsTableAnnotationComposer,
      $$DailyGoalsTableCreateCompanionBuilder,
      $$DailyGoalsTableUpdateCompanionBuilder,
      (DailyGoal, BaseReferences<_$AppDatabase, $DailyGoalsTable, DailyGoal>),
      DailyGoal,
      PrefetchHooks Function()
    >;
typedef $$StreakRecordsTableCreateCompanionBuilder =
    StreakRecordsCompanion Function({
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<DateTime?> deletedAt,
      Value<String?> firebaseId,
      Value<String?> ownerUserId,
      Value<String> syncStatus,
      Value<int> id,
      required DateTime streakDate,
      Value<bool> isCompleted,
      Value<bool> isMissed,
    });
typedef $$StreakRecordsTableUpdateCompanionBuilder =
    StreakRecordsCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<String?> firebaseId,
      Value<String?> ownerUserId,
      Value<String> syncStatus,
      Value<int> id,
      Value<DateTime> streakDate,
      Value<bool> isCompleted,
      Value<bool> isMissed,
    });

class $$StreakRecordsTableFilterComposer
    extends Composer<_$AppDatabase, $StreakRecordsTable> {
  $$StreakRecordsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get firebaseId => $composableBuilder(
    column: $table.firebaseId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ownerUserId => $composableBuilder(
    column: $table.ownerUserId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get streakDate => $composableBuilder(
    column: $table.streakDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isCompleted => $composableBuilder(
    column: $table.isCompleted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isMissed => $composableBuilder(
    column: $table.isMissed,
    builder: (column) => ColumnFilters(column),
  );
}

class $$StreakRecordsTableOrderingComposer
    extends Composer<_$AppDatabase, $StreakRecordsTable> {
  $$StreakRecordsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get firebaseId => $composableBuilder(
    column: $table.firebaseId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ownerUserId => $composableBuilder(
    column: $table.ownerUserId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get streakDate => $composableBuilder(
    column: $table.streakDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isCompleted => $composableBuilder(
    column: $table.isCompleted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isMissed => $composableBuilder(
    column: $table.isMissed,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$StreakRecordsTableAnnotationComposer
    extends Composer<_$AppDatabase, $StreakRecordsTable> {
  $$StreakRecordsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get firebaseId => $composableBuilder(
    column: $table.firebaseId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get ownerUserId => $composableBuilder(
    column: $table.ownerUserId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );

  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get streakDate => $composableBuilder(
    column: $table.streakDate,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isCompleted => $composableBuilder(
    column: $table.isCompleted,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isMissed =>
      $composableBuilder(column: $table.isMissed, builder: (column) => column);
}

class $$StreakRecordsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $StreakRecordsTable,
          StreakRecord,
          $$StreakRecordsTableFilterComposer,
          $$StreakRecordsTableOrderingComposer,
          $$StreakRecordsTableAnnotationComposer,
          $$StreakRecordsTableCreateCompanionBuilder,
          $$StreakRecordsTableUpdateCompanionBuilder,
          (
            StreakRecord,
            BaseReferences<_$AppDatabase, $StreakRecordsTable, StreakRecord>,
          ),
          StreakRecord,
          PrefetchHooks Function()
        > {
  $$StreakRecordsTableTableManager(_$AppDatabase db, $StreakRecordsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StreakRecordsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StreakRecordsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StreakRecordsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String?> firebaseId = const Value.absent(),
                Value<String?> ownerUserId = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<int> id = const Value.absent(),
                Value<DateTime> streakDate = const Value.absent(),
                Value<bool> isCompleted = const Value.absent(),
                Value<bool> isMissed = const Value.absent(),
              }) => StreakRecordsCompanion(
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                firebaseId: firebaseId,
                ownerUserId: ownerUserId,
                syncStatus: syncStatus,
                id: id,
                streakDate: streakDate,
                isCompleted: isCompleted,
                isMissed: isMissed,
              ),
          createCompanionCallback:
              ({
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String?> firebaseId = const Value.absent(),
                Value<String?> ownerUserId = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<int> id = const Value.absent(),
                required DateTime streakDate,
                Value<bool> isCompleted = const Value.absent(),
                Value<bool> isMissed = const Value.absent(),
              }) => StreakRecordsCompanion.insert(
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                firebaseId: firebaseId,
                ownerUserId: ownerUserId,
                syncStatus: syncStatus,
                id: id,
                streakDate: streakDate,
                isCompleted: isCompleted,
                isMissed: isMissed,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$StreakRecordsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $StreakRecordsTable,
      StreakRecord,
      $$StreakRecordsTableFilterComposer,
      $$StreakRecordsTableOrderingComposer,
      $$StreakRecordsTableAnnotationComposer,
      $$StreakRecordsTableCreateCompanionBuilder,
      $$StreakRecordsTableUpdateCompanionBuilder,
      (
        StreakRecord,
        BaseReferences<_$AppDatabase, $StreakRecordsTable, StreakRecord>,
      ),
      StreakRecord,
      PrefetchHooks Function()
    >;
typedef $$ReflectionNotesTableCreateCompanionBuilder =
    ReflectionNotesCompanion Function({
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<DateTime?> deletedAt,
      Value<String?> firebaseId,
      Value<String?> ownerUserId,
      Value<String> syncStatus,
      Value<int> id,
      Value<String?> verseKey,
      Value<String> sourceType,
      Value<String?> title,
      required String body,
    });
typedef $$ReflectionNotesTableUpdateCompanionBuilder =
    ReflectionNotesCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<String?> firebaseId,
      Value<String?> ownerUserId,
      Value<String> syncStatus,
      Value<int> id,
      Value<String?> verseKey,
      Value<String> sourceType,
      Value<String?> title,
      Value<String> body,
    });

class $$ReflectionNotesTableFilterComposer
    extends Composer<_$AppDatabase, $ReflectionNotesTable> {
  $$ReflectionNotesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get firebaseId => $composableBuilder(
    column: $table.firebaseId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ownerUserId => $composableBuilder(
    column: $table.ownerUserId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get verseKey => $composableBuilder(
    column: $table.verseKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sourceType => $composableBuilder(
    column: $table.sourceType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get body => $composableBuilder(
    column: $table.body,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ReflectionNotesTableOrderingComposer
    extends Composer<_$AppDatabase, $ReflectionNotesTable> {
  $$ReflectionNotesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get firebaseId => $composableBuilder(
    column: $table.firebaseId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ownerUserId => $composableBuilder(
    column: $table.ownerUserId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get verseKey => $composableBuilder(
    column: $table.verseKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sourceType => $composableBuilder(
    column: $table.sourceType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get body => $composableBuilder(
    column: $table.body,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ReflectionNotesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ReflectionNotesTable> {
  $$ReflectionNotesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get firebaseId => $composableBuilder(
    column: $table.firebaseId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get ownerUserId => $composableBuilder(
    column: $table.ownerUserId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );

  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get verseKey =>
      $composableBuilder(column: $table.verseKey, builder: (column) => column);

  GeneratedColumn<String> get sourceType => $composableBuilder(
    column: $table.sourceType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get body =>
      $composableBuilder(column: $table.body, builder: (column) => column);
}

class $$ReflectionNotesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ReflectionNotesTable,
          ReflectionNote,
          $$ReflectionNotesTableFilterComposer,
          $$ReflectionNotesTableOrderingComposer,
          $$ReflectionNotesTableAnnotationComposer,
          $$ReflectionNotesTableCreateCompanionBuilder,
          $$ReflectionNotesTableUpdateCompanionBuilder,
          (
            ReflectionNote,
            BaseReferences<
              _$AppDatabase,
              $ReflectionNotesTable,
              ReflectionNote
            >,
          ),
          ReflectionNote,
          PrefetchHooks Function()
        > {
  $$ReflectionNotesTableTableManager(
    _$AppDatabase db,
    $ReflectionNotesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ReflectionNotesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ReflectionNotesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ReflectionNotesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String?> firebaseId = const Value.absent(),
                Value<String?> ownerUserId = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<int> id = const Value.absent(),
                Value<String?> verseKey = const Value.absent(),
                Value<String> sourceType = const Value.absent(),
                Value<String?> title = const Value.absent(),
                Value<String> body = const Value.absent(),
              }) => ReflectionNotesCompanion(
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                firebaseId: firebaseId,
                ownerUserId: ownerUserId,
                syncStatus: syncStatus,
                id: id,
                verseKey: verseKey,
                sourceType: sourceType,
                title: title,
                body: body,
              ),
          createCompanionCallback:
              ({
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String?> firebaseId = const Value.absent(),
                Value<String?> ownerUserId = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<int> id = const Value.absent(),
                Value<String?> verseKey = const Value.absent(),
                Value<String> sourceType = const Value.absent(),
                Value<String?> title = const Value.absent(),
                required String body,
              }) => ReflectionNotesCompanion.insert(
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                firebaseId: firebaseId,
                ownerUserId: ownerUserId,
                syncStatus: syncStatus,
                id: id,
                verseKey: verseKey,
                sourceType: sourceType,
                title: title,
                body: body,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ReflectionNotesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ReflectionNotesTable,
      ReflectionNote,
      $$ReflectionNotesTableFilterComposer,
      $$ReflectionNotesTableOrderingComposer,
      $$ReflectionNotesTableAnnotationComposer,
      $$ReflectionNotesTableCreateCompanionBuilder,
      $$ReflectionNotesTableUpdateCompanionBuilder,
      (
        ReflectionNote,
        BaseReferences<_$AppDatabase, $ReflectionNotesTable, ReflectionNote>,
      ),
      ReflectionNote,
      PrefetchHooks Function()
    >;
typedef $$FavoriteBookmarksTableCreateCompanionBuilder =
    FavoriteBookmarksCompanion Function({
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<DateTime?> deletedAt,
      Value<String?> firebaseId,
      Value<String?> ownerUserId,
      Value<String> syncStatus,
      Value<int> id,
      required String itemType,
      required String itemKey,
      Value<String?> label,
    });
typedef $$FavoriteBookmarksTableUpdateCompanionBuilder =
    FavoriteBookmarksCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<String?> firebaseId,
      Value<String?> ownerUserId,
      Value<String> syncStatus,
      Value<int> id,
      Value<String> itemType,
      Value<String> itemKey,
      Value<String?> label,
    });

class $$FavoriteBookmarksTableFilterComposer
    extends Composer<_$AppDatabase, $FavoriteBookmarksTable> {
  $$FavoriteBookmarksTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get firebaseId => $composableBuilder(
    column: $table.firebaseId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ownerUserId => $composableBuilder(
    column: $table.ownerUserId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get itemType => $composableBuilder(
    column: $table.itemType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get itemKey => $composableBuilder(
    column: $table.itemKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get label => $composableBuilder(
    column: $table.label,
    builder: (column) => ColumnFilters(column),
  );
}

class $$FavoriteBookmarksTableOrderingComposer
    extends Composer<_$AppDatabase, $FavoriteBookmarksTable> {
  $$FavoriteBookmarksTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get firebaseId => $composableBuilder(
    column: $table.firebaseId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ownerUserId => $composableBuilder(
    column: $table.ownerUserId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get itemType => $composableBuilder(
    column: $table.itemType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get itemKey => $composableBuilder(
    column: $table.itemKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get label => $composableBuilder(
    column: $table.label,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$FavoriteBookmarksTableAnnotationComposer
    extends Composer<_$AppDatabase, $FavoriteBookmarksTable> {
  $$FavoriteBookmarksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get firebaseId => $composableBuilder(
    column: $table.firebaseId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get ownerUserId => $composableBuilder(
    column: $table.ownerUserId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );

  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get itemType =>
      $composableBuilder(column: $table.itemType, builder: (column) => column);

  GeneratedColumn<String> get itemKey =>
      $composableBuilder(column: $table.itemKey, builder: (column) => column);

  GeneratedColumn<String> get label =>
      $composableBuilder(column: $table.label, builder: (column) => column);
}

class $$FavoriteBookmarksTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FavoriteBookmarksTable,
          FavoriteBookmark,
          $$FavoriteBookmarksTableFilterComposer,
          $$FavoriteBookmarksTableOrderingComposer,
          $$FavoriteBookmarksTableAnnotationComposer,
          $$FavoriteBookmarksTableCreateCompanionBuilder,
          $$FavoriteBookmarksTableUpdateCompanionBuilder,
          (
            FavoriteBookmark,
            BaseReferences<
              _$AppDatabase,
              $FavoriteBookmarksTable,
              FavoriteBookmark
            >,
          ),
          FavoriteBookmark,
          PrefetchHooks Function()
        > {
  $$FavoriteBookmarksTableTableManager(
    _$AppDatabase db,
    $FavoriteBookmarksTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FavoriteBookmarksTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FavoriteBookmarksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FavoriteBookmarksTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String?> firebaseId = const Value.absent(),
                Value<String?> ownerUserId = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<int> id = const Value.absent(),
                Value<String> itemType = const Value.absent(),
                Value<String> itemKey = const Value.absent(),
                Value<String?> label = const Value.absent(),
              }) => FavoriteBookmarksCompanion(
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                firebaseId: firebaseId,
                ownerUserId: ownerUserId,
                syncStatus: syncStatus,
                id: id,
                itemType: itemType,
                itemKey: itemKey,
                label: label,
              ),
          createCompanionCallback:
              ({
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String?> firebaseId = const Value.absent(),
                Value<String?> ownerUserId = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<int> id = const Value.absent(),
                required String itemType,
                required String itemKey,
                Value<String?> label = const Value.absent(),
              }) => FavoriteBookmarksCompanion.insert(
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                firebaseId: firebaseId,
                ownerUserId: ownerUserId,
                syncStatus: syncStatus,
                id: id,
                itemType: itemType,
                itemKey: itemKey,
                label: label,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$FavoriteBookmarksTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FavoriteBookmarksTable,
      FavoriteBookmark,
      $$FavoriteBookmarksTableFilterComposer,
      $$FavoriteBookmarksTableOrderingComposer,
      $$FavoriteBookmarksTableAnnotationComposer,
      $$FavoriteBookmarksTableCreateCompanionBuilder,
      $$FavoriteBookmarksTableUpdateCompanionBuilder,
      (
        FavoriteBookmark,
        BaseReferences<
          _$AppDatabase,
          $FavoriteBookmarksTable,
          FavoriteBookmark
        >,
      ),
      FavoriteBookmark,
      PrefetchHooks Function()
    >;
typedef $$AdhkarCategoriesTableCreateCompanionBuilder =
    AdhkarCategoriesCompanion Function({
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<int> id,
      required String categoryKey,
      required String titleArabic,
      Value<String?> titleEnglish,
      required String source,
    });
typedef $$AdhkarCategoriesTableUpdateCompanionBuilder =
    AdhkarCategoriesCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> id,
      Value<String> categoryKey,
      Value<String> titleArabic,
      Value<String?> titleEnglish,
      Value<String> source,
    });

class $$AdhkarCategoriesTableFilterComposer
    extends Composer<_$AppDatabase, $AdhkarCategoriesTable> {
  $$AdhkarCategoriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get categoryKey => $composableBuilder(
    column: $table.categoryKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get titleArabic => $composableBuilder(
    column: $table.titleArabic,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get titleEnglish => $composableBuilder(
    column: $table.titleEnglish,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AdhkarCategoriesTableOrderingComposer
    extends Composer<_$AppDatabase, $AdhkarCategoriesTable> {
  $$AdhkarCategoriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get categoryKey => $composableBuilder(
    column: $table.categoryKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get titleArabic => $composableBuilder(
    column: $table.titleArabic,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get titleEnglish => $composableBuilder(
    column: $table.titleEnglish,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AdhkarCategoriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $AdhkarCategoriesTable> {
  $$AdhkarCategoriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get categoryKey => $composableBuilder(
    column: $table.categoryKey,
    builder: (column) => column,
  );

  GeneratedColumn<String> get titleArabic => $composableBuilder(
    column: $table.titleArabic,
    builder: (column) => column,
  );

  GeneratedColumn<String> get titleEnglish => $composableBuilder(
    column: $table.titleEnglish,
    builder: (column) => column,
  );

  GeneratedColumn<String> get source =>
      $composableBuilder(column: $table.source, builder: (column) => column);
}

class $$AdhkarCategoriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AdhkarCategoriesTable,
          AdhkarCategory,
          $$AdhkarCategoriesTableFilterComposer,
          $$AdhkarCategoriesTableOrderingComposer,
          $$AdhkarCategoriesTableAnnotationComposer,
          $$AdhkarCategoriesTableCreateCompanionBuilder,
          $$AdhkarCategoriesTableUpdateCompanionBuilder,
          (
            AdhkarCategory,
            BaseReferences<
              _$AppDatabase,
              $AdhkarCategoriesTable,
              AdhkarCategory
            >,
          ),
          AdhkarCategory,
          PrefetchHooks Function()
        > {
  $$AdhkarCategoriesTableTableManager(
    _$AppDatabase db,
    $AdhkarCategoriesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AdhkarCategoriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AdhkarCategoriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AdhkarCategoriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> id = const Value.absent(),
                Value<String> categoryKey = const Value.absent(),
                Value<String> titleArabic = const Value.absent(),
                Value<String?> titleEnglish = const Value.absent(),
                Value<String> source = const Value.absent(),
              }) => AdhkarCategoriesCompanion(
                createdAt: createdAt,
                updatedAt: updatedAt,
                id: id,
                categoryKey: categoryKey,
                titleArabic: titleArabic,
                titleEnglish: titleEnglish,
                source: source,
              ),
          createCompanionCallback:
              ({
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<int> id = const Value.absent(),
                required String categoryKey,
                required String titleArabic,
                Value<String?> titleEnglish = const Value.absent(),
                required String source,
              }) => AdhkarCategoriesCompanion.insert(
                createdAt: createdAt,
                updatedAt: updatedAt,
                id: id,
                categoryKey: categoryKey,
                titleArabic: titleArabic,
                titleEnglish: titleEnglish,
                source: source,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AdhkarCategoriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AdhkarCategoriesTable,
      AdhkarCategory,
      $$AdhkarCategoriesTableFilterComposer,
      $$AdhkarCategoriesTableOrderingComposer,
      $$AdhkarCategoriesTableAnnotationComposer,
      $$AdhkarCategoriesTableCreateCompanionBuilder,
      $$AdhkarCategoriesTableUpdateCompanionBuilder,
      (
        AdhkarCategory,
        BaseReferences<_$AppDatabase, $AdhkarCategoriesTable, AdhkarCategory>,
      ),
      AdhkarCategory,
      PrefetchHooks Function()
    >;
typedef $$AdhkarItemsTableCreateCompanionBuilder =
    AdhkarItemsCompanion Function({
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<int> id,
      required String itemKey,
      required String categoryKey,
      required String textArabic,
      Value<String?> textEnglish,
      Value<int> repeatCount,
      required String source,
      required String sourceReference,
    });
typedef $$AdhkarItemsTableUpdateCompanionBuilder =
    AdhkarItemsCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> id,
      Value<String> itemKey,
      Value<String> categoryKey,
      Value<String> textArabic,
      Value<String?> textEnglish,
      Value<int> repeatCount,
      Value<String> source,
      Value<String> sourceReference,
    });

class $$AdhkarItemsTableFilterComposer
    extends Composer<_$AppDatabase, $AdhkarItemsTable> {
  $$AdhkarItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get itemKey => $composableBuilder(
    column: $table.itemKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get categoryKey => $composableBuilder(
    column: $table.categoryKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get textArabic => $composableBuilder(
    column: $table.textArabic,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get textEnglish => $composableBuilder(
    column: $table.textEnglish,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get repeatCount => $composableBuilder(
    column: $table.repeatCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sourceReference => $composableBuilder(
    column: $table.sourceReference,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AdhkarItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $AdhkarItemsTable> {
  $$AdhkarItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get itemKey => $composableBuilder(
    column: $table.itemKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get categoryKey => $composableBuilder(
    column: $table.categoryKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get textArabic => $composableBuilder(
    column: $table.textArabic,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get textEnglish => $composableBuilder(
    column: $table.textEnglish,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get repeatCount => $composableBuilder(
    column: $table.repeatCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sourceReference => $composableBuilder(
    column: $table.sourceReference,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AdhkarItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AdhkarItemsTable> {
  $$AdhkarItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get itemKey =>
      $composableBuilder(column: $table.itemKey, builder: (column) => column);

  GeneratedColumn<String> get categoryKey => $composableBuilder(
    column: $table.categoryKey,
    builder: (column) => column,
  );

  GeneratedColumn<String> get textArabic => $composableBuilder(
    column: $table.textArabic,
    builder: (column) => column,
  );

  GeneratedColumn<String> get textEnglish => $composableBuilder(
    column: $table.textEnglish,
    builder: (column) => column,
  );

  GeneratedColumn<int> get repeatCount => $composableBuilder(
    column: $table.repeatCount,
    builder: (column) => column,
  );

  GeneratedColumn<String> get source =>
      $composableBuilder(column: $table.source, builder: (column) => column);

  GeneratedColumn<String> get sourceReference => $composableBuilder(
    column: $table.sourceReference,
    builder: (column) => column,
  );
}

class $$AdhkarItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AdhkarItemsTable,
          AdhkarItem,
          $$AdhkarItemsTableFilterComposer,
          $$AdhkarItemsTableOrderingComposer,
          $$AdhkarItemsTableAnnotationComposer,
          $$AdhkarItemsTableCreateCompanionBuilder,
          $$AdhkarItemsTableUpdateCompanionBuilder,
          (
            AdhkarItem,
            BaseReferences<_$AppDatabase, $AdhkarItemsTable, AdhkarItem>,
          ),
          AdhkarItem,
          PrefetchHooks Function()
        > {
  $$AdhkarItemsTableTableManager(_$AppDatabase db, $AdhkarItemsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AdhkarItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AdhkarItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AdhkarItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> id = const Value.absent(),
                Value<String> itemKey = const Value.absent(),
                Value<String> categoryKey = const Value.absent(),
                Value<String> textArabic = const Value.absent(),
                Value<String?> textEnglish = const Value.absent(),
                Value<int> repeatCount = const Value.absent(),
                Value<String> source = const Value.absent(),
                Value<String> sourceReference = const Value.absent(),
              }) => AdhkarItemsCompanion(
                createdAt: createdAt,
                updatedAt: updatedAt,
                id: id,
                itemKey: itemKey,
                categoryKey: categoryKey,
                textArabic: textArabic,
                textEnglish: textEnglish,
                repeatCount: repeatCount,
                source: source,
                sourceReference: sourceReference,
              ),
          createCompanionCallback:
              ({
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<int> id = const Value.absent(),
                required String itemKey,
                required String categoryKey,
                required String textArabic,
                Value<String?> textEnglish = const Value.absent(),
                Value<int> repeatCount = const Value.absent(),
                required String source,
                required String sourceReference,
              }) => AdhkarItemsCompanion.insert(
                createdAt: createdAt,
                updatedAt: updatedAt,
                id: id,
                itemKey: itemKey,
                categoryKey: categoryKey,
                textArabic: textArabic,
                textEnglish: textEnglish,
                repeatCount: repeatCount,
                source: source,
                sourceReference: sourceReference,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AdhkarItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AdhkarItemsTable,
      AdhkarItem,
      $$AdhkarItemsTableFilterComposer,
      $$AdhkarItemsTableOrderingComposer,
      $$AdhkarItemsTableAnnotationComposer,
      $$AdhkarItemsTableCreateCompanionBuilder,
      $$AdhkarItemsTableUpdateCompanionBuilder,
      (
        AdhkarItem,
        BaseReferences<_$AppDatabase, $AdhkarItemsTable, AdhkarItem>,
      ),
      AdhkarItem,
      PrefetchHooks Function()
    >;
typedef $$AdhkarProgressCountersTableCreateCompanionBuilder =
    AdhkarProgressCountersCompanion Function({
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<DateTime?> deletedAt,
      Value<String?> firebaseId,
      Value<String?> ownerUserId,
      Value<String> syncStatus,
      Value<int> id,
      required String itemKey,
      required DateTime progressDate,
      Value<int> currentCount,
      Value<bool> isCompleted,
    });
typedef $$AdhkarProgressCountersTableUpdateCompanionBuilder =
    AdhkarProgressCountersCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<String?> firebaseId,
      Value<String?> ownerUserId,
      Value<String> syncStatus,
      Value<int> id,
      Value<String> itemKey,
      Value<DateTime> progressDate,
      Value<int> currentCount,
      Value<bool> isCompleted,
    });

class $$AdhkarProgressCountersTableFilterComposer
    extends Composer<_$AppDatabase, $AdhkarProgressCountersTable> {
  $$AdhkarProgressCountersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get firebaseId => $composableBuilder(
    column: $table.firebaseId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ownerUserId => $composableBuilder(
    column: $table.ownerUserId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get itemKey => $composableBuilder(
    column: $table.itemKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get progressDate => $composableBuilder(
    column: $table.progressDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get currentCount => $composableBuilder(
    column: $table.currentCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isCompleted => $composableBuilder(
    column: $table.isCompleted,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AdhkarProgressCountersTableOrderingComposer
    extends Composer<_$AppDatabase, $AdhkarProgressCountersTable> {
  $$AdhkarProgressCountersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get firebaseId => $composableBuilder(
    column: $table.firebaseId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ownerUserId => $composableBuilder(
    column: $table.ownerUserId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get itemKey => $composableBuilder(
    column: $table.itemKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get progressDate => $composableBuilder(
    column: $table.progressDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get currentCount => $composableBuilder(
    column: $table.currentCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isCompleted => $composableBuilder(
    column: $table.isCompleted,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AdhkarProgressCountersTableAnnotationComposer
    extends Composer<_$AppDatabase, $AdhkarProgressCountersTable> {
  $$AdhkarProgressCountersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get firebaseId => $composableBuilder(
    column: $table.firebaseId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get ownerUserId => $composableBuilder(
    column: $table.ownerUserId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );

  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get itemKey =>
      $composableBuilder(column: $table.itemKey, builder: (column) => column);

  GeneratedColumn<DateTime> get progressDate => $composableBuilder(
    column: $table.progressDate,
    builder: (column) => column,
  );

  GeneratedColumn<int> get currentCount => $composableBuilder(
    column: $table.currentCount,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isCompleted => $composableBuilder(
    column: $table.isCompleted,
    builder: (column) => column,
  );
}

class $$AdhkarProgressCountersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AdhkarProgressCountersTable,
          AdhkarProgressCounter,
          $$AdhkarProgressCountersTableFilterComposer,
          $$AdhkarProgressCountersTableOrderingComposer,
          $$AdhkarProgressCountersTableAnnotationComposer,
          $$AdhkarProgressCountersTableCreateCompanionBuilder,
          $$AdhkarProgressCountersTableUpdateCompanionBuilder,
          (
            AdhkarProgressCounter,
            BaseReferences<
              _$AppDatabase,
              $AdhkarProgressCountersTable,
              AdhkarProgressCounter
            >,
          ),
          AdhkarProgressCounter,
          PrefetchHooks Function()
        > {
  $$AdhkarProgressCountersTableTableManager(
    _$AppDatabase db,
    $AdhkarProgressCountersTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AdhkarProgressCountersTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$AdhkarProgressCountersTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$AdhkarProgressCountersTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String?> firebaseId = const Value.absent(),
                Value<String?> ownerUserId = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<int> id = const Value.absent(),
                Value<String> itemKey = const Value.absent(),
                Value<DateTime> progressDate = const Value.absent(),
                Value<int> currentCount = const Value.absent(),
                Value<bool> isCompleted = const Value.absent(),
              }) => AdhkarProgressCountersCompanion(
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                firebaseId: firebaseId,
                ownerUserId: ownerUserId,
                syncStatus: syncStatus,
                id: id,
                itemKey: itemKey,
                progressDate: progressDate,
                currentCount: currentCount,
                isCompleted: isCompleted,
              ),
          createCompanionCallback:
              ({
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String?> firebaseId = const Value.absent(),
                Value<String?> ownerUserId = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<int> id = const Value.absent(),
                required String itemKey,
                required DateTime progressDate,
                Value<int> currentCount = const Value.absent(),
                Value<bool> isCompleted = const Value.absent(),
              }) => AdhkarProgressCountersCompanion.insert(
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                firebaseId: firebaseId,
                ownerUserId: ownerUserId,
                syncStatus: syncStatus,
                id: id,
                itemKey: itemKey,
                progressDate: progressDate,
                currentCount: currentCount,
                isCompleted: isCompleted,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AdhkarProgressCountersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AdhkarProgressCountersTable,
      AdhkarProgressCounter,
      $$AdhkarProgressCountersTableFilterComposer,
      $$AdhkarProgressCountersTableOrderingComposer,
      $$AdhkarProgressCountersTableAnnotationComposer,
      $$AdhkarProgressCountersTableCreateCompanionBuilder,
      $$AdhkarProgressCountersTableUpdateCompanionBuilder,
      (
        AdhkarProgressCounter,
        BaseReferences<
          _$AppDatabase,
          $AdhkarProgressCountersTable,
          AdhkarProgressCounter
        >,
      ),
      AdhkarProgressCounter,
      PrefetchHooks Function()
    >;
typedef $$PrayerTimesCacheTableCreateCompanionBuilder =
    PrayerTimesCacheCompanion Function({
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<int> id,
      required DateTime prayerDate,
      required String locationKey,
      Value<String?> calculationMethod,
      Value<String?> madhab,
      required String timingsJson,
      required String source,
    });
typedef $$PrayerTimesCacheTableUpdateCompanionBuilder =
    PrayerTimesCacheCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> id,
      Value<DateTime> prayerDate,
      Value<String> locationKey,
      Value<String?> calculationMethod,
      Value<String?> madhab,
      Value<String> timingsJson,
      Value<String> source,
    });

class $$PrayerTimesCacheTableFilterComposer
    extends Composer<_$AppDatabase, $PrayerTimesCacheTable> {
  $$PrayerTimesCacheTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get prayerDate => $composableBuilder(
    column: $table.prayerDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get locationKey => $composableBuilder(
    column: $table.locationKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get calculationMethod => $composableBuilder(
    column: $table.calculationMethod,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get madhab => $composableBuilder(
    column: $table.madhab,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get timingsJson => $composableBuilder(
    column: $table.timingsJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PrayerTimesCacheTableOrderingComposer
    extends Composer<_$AppDatabase, $PrayerTimesCacheTable> {
  $$PrayerTimesCacheTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get prayerDate => $composableBuilder(
    column: $table.prayerDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get locationKey => $composableBuilder(
    column: $table.locationKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get calculationMethod => $composableBuilder(
    column: $table.calculationMethod,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get madhab => $composableBuilder(
    column: $table.madhab,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get timingsJson => $composableBuilder(
    column: $table.timingsJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PrayerTimesCacheTableAnnotationComposer
    extends Composer<_$AppDatabase, $PrayerTimesCacheTable> {
  $$PrayerTimesCacheTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get prayerDate => $composableBuilder(
    column: $table.prayerDate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get locationKey => $composableBuilder(
    column: $table.locationKey,
    builder: (column) => column,
  );

  GeneratedColumn<String> get calculationMethod => $composableBuilder(
    column: $table.calculationMethod,
    builder: (column) => column,
  );

  GeneratedColumn<String> get madhab =>
      $composableBuilder(column: $table.madhab, builder: (column) => column);

  GeneratedColumn<String> get timingsJson => $composableBuilder(
    column: $table.timingsJson,
    builder: (column) => column,
  );

  GeneratedColumn<String> get source =>
      $composableBuilder(column: $table.source, builder: (column) => column);
}

class $$PrayerTimesCacheTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PrayerTimesCacheTable,
          PrayerTimesCacheData,
          $$PrayerTimesCacheTableFilterComposer,
          $$PrayerTimesCacheTableOrderingComposer,
          $$PrayerTimesCacheTableAnnotationComposer,
          $$PrayerTimesCacheTableCreateCompanionBuilder,
          $$PrayerTimesCacheTableUpdateCompanionBuilder,
          (
            PrayerTimesCacheData,
            BaseReferences<
              _$AppDatabase,
              $PrayerTimesCacheTable,
              PrayerTimesCacheData
            >,
          ),
          PrayerTimesCacheData,
          PrefetchHooks Function()
        > {
  $$PrayerTimesCacheTableTableManager(
    _$AppDatabase db,
    $PrayerTimesCacheTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PrayerTimesCacheTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PrayerTimesCacheTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PrayerTimesCacheTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> id = const Value.absent(),
                Value<DateTime> prayerDate = const Value.absent(),
                Value<String> locationKey = const Value.absent(),
                Value<String?> calculationMethod = const Value.absent(),
                Value<String?> madhab = const Value.absent(),
                Value<String> timingsJson = const Value.absent(),
                Value<String> source = const Value.absent(),
              }) => PrayerTimesCacheCompanion(
                createdAt: createdAt,
                updatedAt: updatedAt,
                id: id,
                prayerDate: prayerDate,
                locationKey: locationKey,
                calculationMethod: calculationMethod,
                madhab: madhab,
                timingsJson: timingsJson,
                source: source,
              ),
          createCompanionCallback:
              ({
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<int> id = const Value.absent(),
                required DateTime prayerDate,
                required String locationKey,
                Value<String?> calculationMethod = const Value.absent(),
                Value<String?> madhab = const Value.absent(),
                required String timingsJson,
                required String source,
              }) => PrayerTimesCacheCompanion.insert(
                createdAt: createdAt,
                updatedAt: updatedAt,
                id: id,
                prayerDate: prayerDate,
                locationKey: locationKey,
                calculationMethod: calculationMethod,
                madhab: madhab,
                timingsJson: timingsJson,
                source: source,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PrayerTimesCacheTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PrayerTimesCacheTable,
      PrayerTimesCacheData,
      $$PrayerTimesCacheTableFilterComposer,
      $$PrayerTimesCacheTableOrderingComposer,
      $$PrayerTimesCacheTableAnnotationComposer,
      $$PrayerTimesCacheTableCreateCompanionBuilder,
      $$PrayerTimesCacheTableUpdateCompanionBuilder,
      (
        PrayerTimesCacheData,
        BaseReferences<
          _$AppDatabase,
          $PrayerTimesCacheTable,
          PrayerTimesCacheData
        >,
      ),
      PrayerTimesCacheData,
      PrefetchHooks Function()
    >;
typedef $$NotificationSchedulesTableCreateCompanionBuilder =
    NotificationSchedulesCompanion Function({
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<DateTime?> deletedAt,
      Value<String?> firebaseId,
      Value<String?> ownerUserId,
      Value<String> syncStatus,
      Value<int> id,
      required String notificationKey,
      required String notificationType,
      required DateTime scheduledAt,
      Value<bool> isEnabled,
      Value<String?> payloadJson,
    });
typedef $$NotificationSchedulesTableUpdateCompanionBuilder =
    NotificationSchedulesCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<String?> firebaseId,
      Value<String?> ownerUserId,
      Value<String> syncStatus,
      Value<int> id,
      Value<String> notificationKey,
      Value<String> notificationType,
      Value<DateTime> scheduledAt,
      Value<bool> isEnabled,
      Value<String?> payloadJson,
    });

class $$NotificationSchedulesTableFilterComposer
    extends Composer<_$AppDatabase, $NotificationSchedulesTable> {
  $$NotificationSchedulesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get firebaseId => $composableBuilder(
    column: $table.firebaseId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ownerUserId => $composableBuilder(
    column: $table.ownerUserId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notificationKey => $composableBuilder(
    column: $table.notificationKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notificationType => $composableBuilder(
    column: $table.notificationType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get scheduledAt => $composableBuilder(
    column: $table.scheduledAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isEnabled => $composableBuilder(
    column: $table.isEnabled,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get payloadJson => $composableBuilder(
    column: $table.payloadJson,
    builder: (column) => ColumnFilters(column),
  );
}

class $$NotificationSchedulesTableOrderingComposer
    extends Composer<_$AppDatabase, $NotificationSchedulesTable> {
  $$NotificationSchedulesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get firebaseId => $composableBuilder(
    column: $table.firebaseId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ownerUserId => $composableBuilder(
    column: $table.ownerUserId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notificationKey => $composableBuilder(
    column: $table.notificationKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notificationType => $composableBuilder(
    column: $table.notificationType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get scheduledAt => $composableBuilder(
    column: $table.scheduledAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isEnabled => $composableBuilder(
    column: $table.isEnabled,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get payloadJson => $composableBuilder(
    column: $table.payloadJson,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$NotificationSchedulesTableAnnotationComposer
    extends Composer<_$AppDatabase, $NotificationSchedulesTable> {
  $$NotificationSchedulesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get firebaseId => $composableBuilder(
    column: $table.firebaseId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get ownerUserId => $composableBuilder(
    column: $table.ownerUserId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );

  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get notificationKey => $composableBuilder(
    column: $table.notificationKey,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notificationType => $composableBuilder(
    column: $table.notificationType,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get scheduledAt => $composableBuilder(
    column: $table.scheduledAt,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isEnabled =>
      $composableBuilder(column: $table.isEnabled, builder: (column) => column);

  GeneratedColumn<String> get payloadJson => $composableBuilder(
    column: $table.payloadJson,
    builder: (column) => column,
  );
}

class $$NotificationSchedulesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $NotificationSchedulesTable,
          NotificationSchedule,
          $$NotificationSchedulesTableFilterComposer,
          $$NotificationSchedulesTableOrderingComposer,
          $$NotificationSchedulesTableAnnotationComposer,
          $$NotificationSchedulesTableCreateCompanionBuilder,
          $$NotificationSchedulesTableUpdateCompanionBuilder,
          (
            NotificationSchedule,
            BaseReferences<
              _$AppDatabase,
              $NotificationSchedulesTable,
              NotificationSchedule
            >,
          ),
          NotificationSchedule,
          PrefetchHooks Function()
        > {
  $$NotificationSchedulesTableTableManager(
    _$AppDatabase db,
    $NotificationSchedulesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$NotificationSchedulesTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$NotificationSchedulesTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$NotificationSchedulesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String?> firebaseId = const Value.absent(),
                Value<String?> ownerUserId = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<int> id = const Value.absent(),
                Value<String> notificationKey = const Value.absent(),
                Value<String> notificationType = const Value.absent(),
                Value<DateTime> scheduledAt = const Value.absent(),
                Value<bool> isEnabled = const Value.absent(),
                Value<String?> payloadJson = const Value.absent(),
              }) => NotificationSchedulesCompanion(
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                firebaseId: firebaseId,
                ownerUserId: ownerUserId,
                syncStatus: syncStatus,
                id: id,
                notificationKey: notificationKey,
                notificationType: notificationType,
                scheduledAt: scheduledAt,
                isEnabled: isEnabled,
                payloadJson: payloadJson,
              ),
          createCompanionCallback:
              ({
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String?> firebaseId = const Value.absent(),
                Value<String?> ownerUserId = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<int> id = const Value.absent(),
                required String notificationKey,
                required String notificationType,
                required DateTime scheduledAt,
                Value<bool> isEnabled = const Value.absent(),
                Value<String?> payloadJson = const Value.absent(),
              }) => NotificationSchedulesCompanion.insert(
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                firebaseId: firebaseId,
                ownerUserId: ownerUserId,
                syncStatus: syncStatus,
                id: id,
                notificationKey: notificationKey,
                notificationType: notificationType,
                scheduledAt: scheduledAt,
                isEnabled: isEnabled,
                payloadJson: payloadJson,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$NotificationSchedulesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $NotificationSchedulesTable,
      NotificationSchedule,
      $$NotificationSchedulesTableFilterComposer,
      $$NotificationSchedulesTableOrderingComposer,
      $$NotificationSchedulesTableAnnotationComposer,
      $$NotificationSchedulesTableCreateCompanionBuilder,
      $$NotificationSchedulesTableUpdateCompanionBuilder,
      (
        NotificationSchedule,
        BaseReferences<
          _$AppDatabase,
          $NotificationSchedulesTable,
          NotificationSchedule
        >,
      ),
      NotificationSchedule,
      PrefetchHooks Function()
    >;
typedef $$AppSettingsTableCreateCompanionBuilder =
    AppSettingsCompanion Function({
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<String?> firebaseId,
      Value<String?> ownerUserId,
      Value<String> syncStatus,
      Value<int> id,
      required String settingKey,
      required String settingValue,
      Value<String> valueType,
    });
typedef $$AppSettingsTableUpdateCompanionBuilder =
    AppSettingsCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<String?> firebaseId,
      Value<String?> ownerUserId,
      Value<String> syncStatus,
      Value<int> id,
      Value<String> settingKey,
      Value<String> settingValue,
      Value<String> valueType,
    });

class $$AppSettingsTableFilterComposer
    extends Composer<_$AppDatabase, $AppSettingsTable> {
  $$AppSettingsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get firebaseId => $composableBuilder(
    column: $table.firebaseId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ownerUserId => $composableBuilder(
    column: $table.ownerUserId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get settingKey => $composableBuilder(
    column: $table.settingKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get settingValue => $composableBuilder(
    column: $table.settingValue,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get valueType => $composableBuilder(
    column: $table.valueType,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AppSettingsTableOrderingComposer
    extends Composer<_$AppDatabase, $AppSettingsTable> {
  $$AppSettingsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get firebaseId => $composableBuilder(
    column: $table.firebaseId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ownerUserId => $composableBuilder(
    column: $table.ownerUserId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get settingKey => $composableBuilder(
    column: $table.settingKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get settingValue => $composableBuilder(
    column: $table.settingValue,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get valueType => $composableBuilder(
    column: $table.valueType,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AppSettingsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AppSettingsTable> {
  $$AppSettingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get firebaseId => $composableBuilder(
    column: $table.firebaseId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get ownerUserId => $composableBuilder(
    column: $table.ownerUserId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );

  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get settingKey => $composableBuilder(
    column: $table.settingKey,
    builder: (column) => column,
  );

  GeneratedColumn<String> get settingValue => $composableBuilder(
    column: $table.settingValue,
    builder: (column) => column,
  );

  GeneratedColumn<String> get valueType =>
      $composableBuilder(column: $table.valueType, builder: (column) => column);
}

class $$AppSettingsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AppSettingsTable,
          AppSetting,
          $$AppSettingsTableFilterComposer,
          $$AppSettingsTableOrderingComposer,
          $$AppSettingsTableAnnotationComposer,
          $$AppSettingsTableCreateCompanionBuilder,
          $$AppSettingsTableUpdateCompanionBuilder,
          (
            AppSetting,
            BaseReferences<_$AppDatabase, $AppSettingsTable, AppSetting>,
          ),
          AppSetting,
          PrefetchHooks Function()
        > {
  $$AppSettingsTableTableManager(_$AppDatabase db, $AppSettingsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AppSettingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AppSettingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AppSettingsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String?> firebaseId = const Value.absent(),
                Value<String?> ownerUserId = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<int> id = const Value.absent(),
                Value<String> settingKey = const Value.absent(),
                Value<String> settingValue = const Value.absent(),
                Value<String> valueType = const Value.absent(),
              }) => AppSettingsCompanion(
                createdAt: createdAt,
                updatedAt: updatedAt,
                firebaseId: firebaseId,
                ownerUserId: ownerUserId,
                syncStatus: syncStatus,
                id: id,
                settingKey: settingKey,
                settingValue: settingValue,
                valueType: valueType,
              ),
          createCompanionCallback:
              ({
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<String?> firebaseId = const Value.absent(),
                Value<String?> ownerUserId = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<int> id = const Value.absent(),
                required String settingKey,
                required String settingValue,
                Value<String> valueType = const Value.absent(),
              }) => AppSettingsCompanion.insert(
                createdAt: createdAt,
                updatedAt: updatedAt,
                firebaseId: firebaseId,
                ownerUserId: ownerUserId,
                syncStatus: syncStatus,
                id: id,
                settingKey: settingKey,
                settingValue: settingValue,
                valueType: valueType,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AppSettingsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AppSettingsTable,
      AppSetting,
      $$AppSettingsTableFilterComposer,
      $$AppSettingsTableOrderingComposer,
      $$AppSettingsTableAnnotationComposer,
      $$AppSettingsTableCreateCompanionBuilder,
      $$AppSettingsTableUpdateCompanionBuilder,
      (
        AppSetting,
        BaseReferences<_$AppDatabase, $AppSettingsTable, AppSetting>,
      ),
      AppSetting,
      PrefetchHooks Function()
    >;
typedef $$SyncQueueTableCreateCompanionBuilder =
    SyncQueueCompanion Function({
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<int> id,
      Value<String?> ownerUserId,
      required String entityType,
      required int localEntityId,
      required String operation,
      required String payloadJson,
      Value<String> status,
      Value<int> retryCount,
      Value<DateTime?> lastAttemptAt,
    });
typedef $$SyncQueueTableUpdateCompanionBuilder =
    SyncQueueCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> id,
      Value<String?> ownerUserId,
      Value<String> entityType,
      Value<int> localEntityId,
      Value<String> operation,
      Value<String> payloadJson,
      Value<String> status,
      Value<int> retryCount,
      Value<DateTime?> lastAttemptAt,
    });

class $$SyncQueueTableFilterComposer
    extends Composer<_$AppDatabase, $SyncQueueTable> {
  $$SyncQueueTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ownerUserId => $composableBuilder(
    column: $table.ownerUserId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get localEntityId => $composableBuilder(
    column: $table.localEntityId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get operation => $composableBuilder(
    column: $table.operation,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get payloadJson => $composableBuilder(
    column: $table.payloadJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get retryCount => $composableBuilder(
    column: $table.retryCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastAttemptAt => $composableBuilder(
    column: $table.lastAttemptAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SyncQueueTableOrderingComposer
    extends Composer<_$AppDatabase, $SyncQueueTable> {
  $$SyncQueueTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ownerUserId => $composableBuilder(
    column: $table.ownerUserId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get localEntityId => $composableBuilder(
    column: $table.localEntityId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get operation => $composableBuilder(
    column: $table.operation,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get payloadJson => $composableBuilder(
    column: $table.payloadJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get retryCount => $composableBuilder(
    column: $table.retryCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastAttemptAt => $composableBuilder(
    column: $table.lastAttemptAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SyncQueueTableAnnotationComposer
    extends Composer<_$AppDatabase, $SyncQueueTable> {
  $$SyncQueueTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get ownerUserId => $composableBuilder(
    column: $table.ownerUserId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => column,
  );

  GeneratedColumn<int> get localEntityId => $composableBuilder(
    column: $table.localEntityId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get operation =>
      $composableBuilder(column: $table.operation, builder: (column) => column);

  GeneratedColumn<String> get payloadJson => $composableBuilder(
    column: $table.payloadJson,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<int> get retryCount => $composableBuilder(
    column: $table.retryCount,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get lastAttemptAt => $composableBuilder(
    column: $table.lastAttemptAt,
    builder: (column) => column,
  );
}

class $$SyncQueueTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SyncQueueTable,
          SyncQueueData,
          $$SyncQueueTableFilterComposer,
          $$SyncQueueTableOrderingComposer,
          $$SyncQueueTableAnnotationComposer,
          $$SyncQueueTableCreateCompanionBuilder,
          $$SyncQueueTableUpdateCompanionBuilder,
          (
            SyncQueueData,
            BaseReferences<_$AppDatabase, $SyncQueueTable, SyncQueueData>,
          ),
          SyncQueueData,
          PrefetchHooks Function()
        > {
  $$SyncQueueTableTableManager(_$AppDatabase db, $SyncQueueTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SyncQueueTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SyncQueueTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SyncQueueTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> id = const Value.absent(),
                Value<String?> ownerUserId = const Value.absent(),
                Value<String> entityType = const Value.absent(),
                Value<int> localEntityId = const Value.absent(),
                Value<String> operation = const Value.absent(),
                Value<String> payloadJson = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<int> retryCount = const Value.absent(),
                Value<DateTime?> lastAttemptAt = const Value.absent(),
              }) => SyncQueueCompanion(
                createdAt: createdAt,
                updatedAt: updatedAt,
                id: id,
                ownerUserId: ownerUserId,
                entityType: entityType,
                localEntityId: localEntityId,
                operation: operation,
                payloadJson: payloadJson,
                status: status,
                retryCount: retryCount,
                lastAttemptAt: lastAttemptAt,
              ),
          createCompanionCallback:
              ({
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<int> id = const Value.absent(),
                Value<String?> ownerUserId = const Value.absent(),
                required String entityType,
                required int localEntityId,
                required String operation,
                required String payloadJson,
                Value<String> status = const Value.absent(),
                Value<int> retryCount = const Value.absent(),
                Value<DateTime?> lastAttemptAt = const Value.absent(),
              }) => SyncQueueCompanion.insert(
                createdAt: createdAt,
                updatedAt: updatedAt,
                id: id,
                ownerUserId: ownerUserId,
                entityType: entityType,
                localEntityId: localEntityId,
                operation: operation,
                payloadJson: payloadJson,
                status: status,
                retryCount: retryCount,
                lastAttemptAt: lastAttemptAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SyncQueueTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SyncQueueTable,
      SyncQueueData,
      $$SyncQueueTableFilterComposer,
      $$SyncQueueTableOrderingComposer,
      $$SyncQueueTableAnnotationComposer,
      $$SyncQueueTableCreateCompanionBuilder,
      $$SyncQueueTableUpdateCompanionBuilder,
      (
        SyncQueueData,
        BaseReferences<_$AppDatabase, $SyncQueueTable, SyncQueueData>,
      ),
      SyncQueueData,
      PrefetchHooks Function()
    >;
typedef $$SyncMetadataTableCreateCompanionBuilder =
    SyncMetadataCompanion Function({
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<int> id,
      Value<String?> ownerUserId,
      required String entityType,
      Value<DateTime?> lastSyncedAt,
      Value<String?> lastSyncToken,
      Value<String> status,
    });
typedef $$SyncMetadataTableUpdateCompanionBuilder =
    SyncMetadataCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> id,
      Value<String?> ownerUserId,
      Value<String> entityType,
      Value<DateTime?> lastSyncedAt,
      Value<String?> lastSyncToken,
      Value<String> status,
    });

class $$SyncMetadataTableFilterComposer
    extends Composer<_$AppDatabase, $SyncMetadataTable> {
  $$SyncMetadataTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ownerUserId => $composableBuilder(
    column: $table.ownerUserId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastSyncedAt => $composableBuilder(
    column: $table.lastSyncedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lastSyncToken => $composableBuilder(
    column: $table.lastSyncToken,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SyncMetadataTableOrderingComposer
    extends Composer<_$AppDatabase, $SyncMetadataTable> {
  $$SyncMetadataTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ownerUserId => $composableBuilder(
    column: $table.ownerUserId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastSyncedAt => $composableBuilder(
    column: $table.lastSyncedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lastSyncToken => $composableBuilder(
    column: $table.lastSyncToken,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SyncMetadataTableAnnotationComposer
    extends Composer<_$AppDatabase, $SyncMetadataTable> {
  $$SyncMetadataTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get ownerUserId => $composableBuilder(
    column: $table.ownerUserId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get lastSyncedAt => $composableBuilder(
    column: $table.lastSyncedAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get lastSyncToken => $composableBuilder(
    column: $table.lastSyncToken,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);
}

class $$SyncMetadataTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SyncMetadataTable,
          SyncMetadataData,
          $$SyncMetadataTableFilterComposer,
          $$SyncMetadataTableOrderingComposer,
          $$SyncMetadataTableAnnotationComposer,
          $$SyncMetadataTableCreateCompanionBuilder,
          $$SyncMetadataTableUpdateCompanionBuilder,
          (
            SyncMetadataData,
            BaseReferences<_$AppDatabase, $SyncMetadataTable, SyncMetadataData>,
          ),
          SyncMetadataData,
          PrefetchHooks Function()
        > {
  $$SyncMetadataTableTableManager(_$AppDatabase db, $SyncMetadataTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SyncMetadataTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SyncMetadataTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SyncMetadataTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> id = const Value.absent(),
                Value<String?> ownerUserId = const Value.absent(),
                Value<String> entityType = const Value.absent(),
                Value<DateTime?> lastSyncedAt = const Value.absent(),
                Value<String?> lastSyncToken = const Value.absent(),
                Value<String> status = const Value.absent(),
              }) => SyncMetadataCompanion(
                createdAt: createdAt,
                updatedAt: updatedAt,
                id: id,
                ownerUserId: ownerUserId,
                entityType: entityType,
                lastSyncedAt: lastSyncedAt,
                lastSyncToken: lastSyncToken,
                status: status,
              ),
          createCompanionCallback:
              ({
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<int> id = const Value.absent(),
                Value<String?> ownerUserId = const Value.absent(),
                required String entityType,
                Value<DateTime?> lastSyncedAt = const Value.absent(),
                Value<String?> lastSyncToken = const Value.absent(),
                Value<String> status = const Value.absent(),
              }) => SyncMetadataCompanion.insert(
                createdAt: createdAt,
                updatedAt: updatedAt,
                id: id,
                ownerUserId: ownerUserId,
                entityType: entityType,
                lastSyncedAt: lastSyncedAt,
                lastSyncToken: lastSyncToken,
                status: status,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SyncMetadataTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SyncMetadataTable,
      SyncMetadataData,
      $$SyncMetadataTableFilterComposer,
      $$SyncMetadataTableOrderingComposer,
      $$SyncMetadataTableAnnotationComposer,
      $$SyncMetadataTableCreateCompanionBuilder,
      $$SyncMetadataTableUpdateCompanionBuilder,
      (
        SyncMetadataData,
        BaseReferences<_$AppDatabase, $SyncMetadataTable, SyncMetadataData>,
      ),
      SyncMetadataData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$UserProfileCachesTableTableManager get userProfileCaches =>
      $$UserProfileCachesTableTableManager(_db, _db.userProfileCaches);
  $$QuranChaptersCacheTableTableManager get quranChaptersCache =>
      $$QuranChaptersCacheTableTableManager(_db, _db.quranChaptersCache);
  $$QuranVersesCacheTableTableManager get quranVersesCache =>
      $$QuranVersesCacheTableTableManager(_db, _db.quranVersesCache);
  $$TafsirCachesTableTableManager get tafsirCaches =>
      $$TafsirCachesTableTableManager(_db, _db.tafsirCaches);
  $$AudioCacheMetadataTableTableManager get audioCacheMetadata =>
      $$AudioCacheMetadataTableTableManager(_db, _db.audioCacheMetadata);
  $$QuranRecitersCacheTableTableManager get quranRecitersCache =>
      $$QuranRecitersCacheTableTableManager(_db, _db.quranRecitersCache);
  $$DailyAyahHistoryTableTableManager get dailyAyahHistory =>
      $$DailyAyahHistoryTableTableManager(_db, _db.dailyAyahHistory);
  $$ReadingProgressTableTableManager get readingProgress =>
      $$ReadingProgressTableTableManager(_db, _db.readingProgress);
  $$ReadingSessionsTableTableManager get readingSessions =>
      $$ReadingSessionsTableTableManager(_db, _db.readingSessions);
  $$DailyGoalsTableTableManager get dailyGoals =>
      $$DailyGoalsTableTableManager(_db, _db.dailyGoals);
  $$StreakRecordsTableTableManager get streakRecords =>
      $$StreakRecordsTableTableManager(_db, _db.streakRecords);
  $$ReflectionNotesTableTableManager get reflectionNotes =>
      $$ReflectionNotesTableTableManager(_db, _db.reflectionNotes);
  $$FavoriteBookmarksTableTableManager get favoriteBookmarks =>
      $$FavoriteBookmarksTableTableManager(_db, _db.favoriteBookmarks);
  $$AdhkarCategoriesTableTableManager get adhkarCategories =>
      $$AdhkarCategoriesTableTableManager(_db, _db.adhkarCategories);
  $$AdhkarItemsTableTableManager get adhkarItems =>
      $$AdhkarItemsTableTableManager(_db, _db.adhkarItems);
  $$AdhkarProgressCountersTableTableManager get adhkarProgressCounters =>
      $$AdhkarProgressCountersTableTableManager(
        _db,
        _db.adhkarProgressCounters,
      );
  $$PrayerTimesCacheTableTableManager get prayerTimesCache =>
      $$PrayerTimesCacheTableTableManager(_db, _db.prayerTimesCache);
  $$NotificationSchedulesTableTableManager get notificationSchedules =>
      $$NotificationSchedulesTableTableManager(_db, _db.notificationSchedules);
  $$AppSettingsTableTableManager get appSettings =>
      $$AppSettingsTableTableManager(_db, _db.appSettings);
  $$SyncQueueTableTableManager get syncQueue =>
      $$SyncQueueTableTableManager(_db, _db.syncQueue);
  $$SyncMetadataTableTableManager get syncMetadata =>
      $$SyncMetadataTableTableManager(_db, _db.syncMetadata);
}
