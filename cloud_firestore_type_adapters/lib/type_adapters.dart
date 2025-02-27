library sembast_cloud_firestore_type_adapters;

import 'dart:convert';

import 'package:sembast/sembast.dart';
import 'package:sembast/src/json_encodable_codec.dart'; // ignore: implementation_imports
import 'package:sembast_cloud_firestore_type_adapters/src/blob.dart';
import 'package:sembast_cloud_firestore_type_adapters/src/geo_point.dart';
import 'package:sembast_cloud_firestore_type_adapters/src/timestamp.dart';
import 'package:sembast_cloud_firestore_type_adapters/src/datetime.dart';

export 'src/blob.dart' show sembastFirestoreBlobAdapter;
export 'src/datetime.dart' show sembastFirestoreDateTimeAdapter;
export 'src/geo_point.dart' show sembastFirestoreGeoPointAdapter;
export 'src/timestamp.dart' show sembastFirestoreTimestampAdapter;

/// Support Timestamp, Blob and GeoPoint
final sembastFirestoreDefaultTypeAdapters = [
  sembastFirestoreTimestampAdapter,
  sembastFirestoreDateTimeAdapter,
  sembastFirestoreBlobAdapter,
  sembastFirestoreGeoPointAdapter
];

/// Default Firestore types jsonEncodableCodec
final sembastFirestoreDefaultJsonEncodableCodec =
    JsonEncodableCodec(adapters: sembastFirestoreDefaultTypeAdapters);

/// Firestore types support codec for sembast to use when opening the database.
final sembastFirestoreCodec = SembastCodec(
    signature: 'firestore',
    codec: json,
    jsonEncodableCodec: sembastFirestoreDefaultJsonEncodableCodec);
