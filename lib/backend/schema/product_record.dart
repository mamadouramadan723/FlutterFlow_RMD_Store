import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProductRecord extends FirestoreRecord {
  ProductRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  bool hasId() => _id != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "marques" field.
  List<String>? _marques;
  List<String> get marques => _marques ?? const [];
  bool hasMarques() => _marques != null;

  // "moreImages" field.
  List<String>? _moreImages;
  List<String> get moreImages => _moreImages ?? const [];
  bool hasMoreImages() => _moreImages != null;

  // "subCategoryRef" field.
  DocumentReference? _subCategoryRef;
  DocumentReference? get subCategoryRef => _subCategoryRef;
  bool hasSubCategoryRef() => _subCategoryRef != null;

  // "quantity" field.
  int? _quantity;
  int get quantity => _quantity ?? 0;
  bool hasQuantity() => _quantity != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "onSale" field.
  bool? _onSale;
  bool get onSale => _onSale ?? false;
  bool hasOnSale() => _onSale != null;

  // "onSalePrice" field.
  double? _onSalePrice;
  double get onSalePrice => _onSalePrice ?? 0.0;
  bool hasOnSalePrice() => _onSalePrice != null;

  // "rating" field.
  RatingStruct? _rating;
  RatingStruct get rating => _rating ?? RatingStruct();
  bool hasRating() => _rating != null;

  // "storePlace" field.
  PlaceStruct? _storePlace;
  PlaceStruct get storePlace => _storePlace ?? PlaceStruct();
  bool hasStorePlace() => _storePlace != null;

  // "savedBy" field.
  List<String>? _savedBy;
  List<String> get savedBy => _savedBy ?? const [];
  bool hasSavedBy() => _savedBy != null;

  // "imageUrl" field.
  String? _imageUrl;
  String get imageUrl => _imageUrl ?? '';
  bool hasImageUrl() => _imageUrl != null;

  // "creationDate" field.
  DateTime? _creationDate;
  DateTime? get creationDate => _creationDate;
  bool hasCreationDate() => _creationDate != null;

  // "modificationDate" field.
  DateTime? _modificationDate;
  DateTime? get modificationDate => _modificationDate;
  bool hasModificationDate() => _modificationDate != null;

  void _initializeFields() {
    _id = castToType<int>(snapshotData['id']);
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _marques = getDataList(snapshotData['marques']);
    _moreImages = getDataList(snapshotData['moreImages']);
    _subCategoryRef = snapshotData['subCategoryRef'] as DocumentReference?;
    _quantity = castToType<int>(snapshotData['quantity']);
    _price = castToType<double>(snapshotData['price']);
    _onSale = snapshotData['onSale'] as bool?;
    _onSalePrice = castToType<double>(snapshotData['onSalePrice']);
    _rating = RatingStruct.maybeFromMap(snapshotData['rating']);
    _storePlace = PlaceStruct.maybeFromMap(snapshotData['storePlace']);
    _savedBy = getDataList(snapshotData['savedBy']);
    _imageUrl = snapshotData['imageUrl'] as String?;
    _creationDate = snapshotData['creationDate'] as DateTime?;
    _modificationDate = snapshotData['modificationDate'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('product');

  static Stream<ProductRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProductRecord.fromSnapshot(s));

  static Future<ProductRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProductRecord.fromSnapshot(s));

  static ProductRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProductRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProductRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProductRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProductRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProductRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProductRecordData({
  int? id,
  String? name,
  String? description,
  DocumentReference? subCategoryRef,
  int? quantity,
  double? price,
  bool? onSale,
  double? onSalePrice,
  RatingStruct? rating,
  PlaceStruct? storePlace,
  String? imageUrl,
  DateTime? creationDate,
  DateTime? modificationDate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'subCategoryRef': subCategoryRef,
      'quantity': quantity,
      'price': price,
      'onSale': onSale,
      'onSalePrice': onSalePrice,
      'rating': RatingStruct().toMap(),
      'storePlace': PlaceStruct().toMap(),
      'imageUrl': imageUrl,
      'creationDate': creationDate,
      'modificationDate': modificationDate,
    }.withoutNulls,
  );

  // Handle nested data for "rating" field.
  addRatingStructData(firestoreData, rating, 'rating');

  // Handle nested data for "storePlace" field.
  addPlaceStructData(firestoreData, storePlace, 'storePlace');

  return firestoreData;
}

class ProductRecordDocumentEquality implements Equality<ProductRecord> {
  const ProductRecordDocumentEquality();

  @override
  bool equals(ProductRecord? e1, ProductRecord? e2) {
    const listEquality = ListEquality();
    return e1?.id == e2?.id &&
        e1?.name == e2?.name &&
        e1?.description == e2?.description &&
        listEquality.equals(e1?.marques, e2?.marques) &&
        listEquality.equals(e1?.moreImages, e2?.moreImages) &&
        e1?.subCategoryRef == e2?.subCategoryRef &&
        e1?.quantity == e2?.quantity &&
        e1?.price == e2?.price &&
        e1?.onSale == e2?.onSale &&
        e1?.onSalePrice == e2?.onSalePrice &&
        e1?.rating == e2?.rating &&
        e1?.storePlace == e2?.storePlace &&
        listEquality.equals(e1?.savedBy, e2?.savedBy) &&
        e1?.imageUrl == e2?.imageUrl &&
        e1?.creationDate == e2?.creationDate &&
        e1?.modificationDate == e2?.modificationDate;
  }

  @override
  int hash(ProductRecord? e) => const ListEquality().hash([
        e?.id,
        e?.name,
        e?.description,
        e?.marques,
        e?.moreImages,
        e?.subCategoryRef,
        e?.quantity,
        e?.price,
        e?.onSale,
        e?.onSalePrice,
        e?.rating,
        e?.storePlace,
        e?.savedBy,
        e?.imageUrl,
        e?.creationDate,
        e?.modificationDate
      ]);

  @override
  bool isValidKey(Object? o) => o is ProductRecord;
}
