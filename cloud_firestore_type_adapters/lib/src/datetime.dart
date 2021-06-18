import 'package:cloud_firestore_platform_interface/cloud_firestore_platform_interface.dart';
import 'package:sembast_cloud_firestore_type_adapters/src/mixin.dart';

// ignore: implementation_imports
import 'package:sembast/src/type_adapter_impl.dart';

class _FirestoreDateTimeAdapter extends SembastTypeAdapter<DateTime, int>
    with TypeAdapterCodecMixin<DateTime, int> {
  _FirestoreDateTimeAdapter() {
    // Encode to map
    encoder = TypeAdapterConverter<DateTime, int>(
        (dateTime) => Timestamp.fromDate(dateTime).microsecondsSinceEpoch);
    // Decode from map
    decoder = TypeAdapterConverter<int, DateTime>(
        (value) => DateTime.fromMicrosecondsSinceEpoch(value));
  }

  @override
  String get name => 'FirestoreDateTime';
}

/// Firestore DateTime adapter.
///
/// Convert a DateTime to a map with microseconds and nanoseconds information.
final SembastTypeAdapter<DateTime, int> sembastFirestoreDateTimeAdapter =
    _FirestoreDateTimeAdapter();
