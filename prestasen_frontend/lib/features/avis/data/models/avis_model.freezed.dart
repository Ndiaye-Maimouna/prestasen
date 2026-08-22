// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'avis_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AvisModel _$AvisModelFromJson(Map<String, dynamic> json) {
  return _AvisModel.fromJson(json);
}

/// @nodoc
mixin _$AvisModel {
  String get id => throw _privateConstructorUsedError;
  String get auteurId => throw _privateConstructorUsedError;
  String get auteurNom => throw _privateConstructorUsedError;
  int get note => throw _privateConstructorUsedError;
  String? get commentaire => throw _privateConstructorUsedError;
  String? get reponseProfessionnel => throw _privateConstructorUsedError;
  DateTime? get dateReponse => throw _privateConstructorUsedError;
  DateTime get dateCreation => throw _privateConstructorUsedError;

  /// Serializes this AvisModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AvisModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AvisModelCopyWith<AvisModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AvisModelCopyWith<$Res> {
  factory $AvisModelCopyWith(AvisModel value, $Res Function(AvisModel) then) =
      _$AvisModelCopyWithImpl<$Res, AvisModel>;
  @useResult
  $Res call({
    String id,
    String auteurId,
    String auteurNom,
    int note,
    String? commentaire,
    String? reponseProfessionnel,
    DateTime? dateReponse,
    DateTime dateCreation,
  });
}

/// @nodoc
class _$AvisModelCopyWithImpl<$Res, $Val extends AvisModel>
    implements $AvisModelCopyWith<$Res> {
  _$AvisModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AvisModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? auteurId = null,
    Object? auteurNom = null,
    Object? note = null,
    Object? commentaire = freezed,
    Object? reponseProfessionnel = freezed,
    Object? dateReponse = freezed,
    Object? dateCreation = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            auteurId: null == auteurId
                ? _value.auteurId
                : auteurId // ignore: cast_nullable_to_non_nullable
                      as String,
            auteurNom: null == auteurNom
                ? _value.auteurNom
                : auteurNom // ignore: cast_nullable_to_non_nullable
                      as String,
            note: null == note
                ? _value.note
                : note // ignore: cast_nullable_to_non_nullable
                      as int,
            commentaire: freezed == commentaire
                ? _value.commentaire
                : commentaire // ignore: cast_nullable_to_non_nullable
                      as String?,
            reponseProfessionnel: freezed == reponseProfessionnel
                ? _value.reponseProfessionnel
                : reponseProfessionnel // ignore: cast_nullable_to_non_nullable
                      as String?,
            dateReponse: freezed == dateReponse
                ? _value.dateReponse
                : dateReponse // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            dateCreation: null == dateCreation
                ? _value.dateCreation
                : dateCreation // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AvisModelImplCopyWith<$Res>
    implements $AvisModelCopyWith<$Res> {
  factory _$$AvisModelImplCopyWith(
    _$AvisModelImpl value,
    $Res Function(_$AvisModelImpl) then,
  ) = __$$AvisModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String auteurId,
    String auteurNom,
    int note,
    String? commentaire,
    String? reponseProfessionnel,
    DateTime? dateReponse,
    DateTime dateCreation,
  });
}

/// @nodoc
class __$$AvisModelImplCopyWithImpl<$Res>
    extends _$AvisModelCopyWithImpl<$Res, _$AvisModelImpl>
    implements _$$AvisModelImplCopyWith<$Res> {
  __$$AvisModelImplCopyWithImpl(
    _$AvisModelImpl _value,
    $Res Function(_$AvisModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AvisModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? auteurId = null,
    Object? auteurNom = null,
    Object? note = null,
    Object? commentaire = freezed,
    Object? reponseProfessionnel = freezed,
    Object? dateReponse = freezed,
    Object? dateCreation = null,
  }) {
    return _then(
      _$AvisModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        auteurId: null == auteurId
            ? _value.auteurId
            : auteurId // ignore: cast_nullable_to_non_nullable
                  as String,
        auteurNom: null == auteurNom
            ? _value.auteurNom
            : auteurNom // ignore: cast_nullable_to_non_nullable
                  as String,
        note: null == note
            ? _value.note
            : note // ignore: cast_nullable_to_non_nullable
                  as int,
        commentaire: freezed == commentaire
            ? _value.commentaire
            : commentaire // ignore: cast_nullable_to_non_nullable
                  as String?,
        reponseProfessionnel: freezed == reponseProfessionnel
            ? _value.reponseProfessionnel
            : reponseProfessionnel // ignore: cast_nullable_to_non_nullable
                  as String?,
        dateReponse: freezed == dateReponse
            ? _value.dateReponse
            : dateReponse // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        dateCreation: null == dateCreation
            ? _value.dateCreation
            : dateCreation // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AvisModelImpl implements _AvisModel {
  const _$AvisModelImpl({
    required this.id,
    required this.auteurId,
    required this.auteurNom,
    required this.note,
    this.commentaire,
    this.reponseProfessionnel,
    this.dateReponse,
    required this.dateCreation,
  });

  factory _$AvisModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AvisModelImplFromJson(json);

  @override
  final String id;
  @override
  final String auteurId;
  @override
  final String auteurNom;
  @override
  final int note;
  @override
  final String? commentaire;
  @override
  final String? reponseProfessionnel;
  @override
  final DateTime? dateReponse;
  @override
  final DateTime dateCreation;

  @override
  String toString() {
    return 'AvisModel(id: $id, auteurId: $auteurId, auteurNom: $auteurNom, note: $note, commentaire: $commentaire, reponseProfessionnel: $reponseProfessionnel, dateReponse: $dateReponse, dateCreation: $dateCreation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AvisModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.auteurId, auteurId) ||
                other.auteurId == auteurId) &&
            (identical(other.auteurNom, auteurNom) ||
                other.auteurNom == auteurNom) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.commentaire, commentaire) ||
                other.commentaire == commentaire) &&
            (identical(other.reponseProfessionnel, reponseProfessionnel) ||
                other.reponseProfessionnel == reponseProfessionnel) &&
            (identical(other.dateReponse, dateReponse) ||
                other.dateReponse == dateReponse) &&
            (identical(other.dateCreation, dateCreation) ||
                other.dateCreation == dateCreation));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    auteurId,
    auteurNom,
    note,
    commentaire,
    reponseProfessionnel,
    dateReponse,
    dateCreation,
  );

  /// Create a copy of AvisModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AvisModelImplCopyWith<_$AvisModelImpl> get copyWith =>
      __$$AvisModelImplCopyWithImpl<_$AvisModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AvisModelImplToJson(this);
  }
}

abstract class _AvisModel implements AvisModel {
  const factory _AvisModel({
    required final String id,
    required final String auteurId,
    required final String auteurNom,
    required final int note,
    final String? commentaire,
    final String? reponseProfessionnel,
    final DateTime? dateReponse,
    required final DateTime dateCreation,
  }) = _$AvisModelImpl;

  factory _AvisModel.fromJson(Map<String, dynamic> json) =
      _$AvisModelImpl.fromJson;

  @override
  String get id;
  @override
  String get auteurId;
  @override
  String get auteurNom;
  @override
  int get note;
  @override
  String? get commentaire;
  @override
  String? get reponseProfessionnel;
  @override
  DateTime? get dateReponse;
  @override
  DateTime get dateCreation;

  /// Create a copy of AvisModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AvisModelImplCopyWith<_$AvisModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
