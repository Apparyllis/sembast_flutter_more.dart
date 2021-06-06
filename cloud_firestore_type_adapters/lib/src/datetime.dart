import 'package:cloud_firestore_platform_interface/cloud_firestore_platform_interface.dart';
import 'package:sembast_cloud_firestore_type_adapters/src/mixin.dart';

// ignore: implementation_imports
import 'package:sembast/src/type_adapter_impl.dart';

class _FirestoreDateTimeAdapter
    extends SembastTypeAdapter<DateTime, Map<String, int>>
    with TypeAdapterCodecMixin<DateTime, Map<String, int>> {
  _FirestoreDateTimeAdapter() {
    // Encode to map
    encoder = TypeAdapterConverter<DateTime, Map<String, int>>(
        (dateTime) => <String, int>{
              'microseconds':
                  Timestamp.fromDate(dateTime).microsecondsSinceEpoch,
              'nanoseconds': Timestamp.fromDate(dateTime).nanoseconds
            });
    // Decode from map
    decoder = TypeAdapterConverter<Map<String, int>, DateTime>((map) =>
        DateTime.fromMicrosecondsSinceEpoch(map['microseconds'] as int));
  }

  @override
  String get name => 'FirestoreDateTime';
}

/// Firestore DateTime adapter.
///
/// Convert a DateTime to a map with microseconds and nanoseconds information.
final SembastTypeAdapter<DateTime, Map<String, int>>
    sembastFirestoreDateTimeAdapter = _FirestoreDateTimeAdapter();
