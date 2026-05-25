import 'package:flutter/services.dart';

import '../../logic/entity/adhkar_collection.dart';
import '../models/adhkar_json_model.dart';

abstract class AdhkarAssetDatasource {
  Future<AdhkarCollection> loadCollection();
}

class RootBundleAdhkarAssetDatasource implements AdhkarAssetDatasource {
  const RootBundleAdhkarAssetDatasource({
    AssetBundle? bundle,
    this.assetPath = 'assets/data/adhkar/adhkar_ar_en.json',
  }) : _bundle = bundle;

  final AssetBundle? _bundle;
  final String assetPath;

  @override
  Future<AdhkarCollection> loadCollection() async {
    final jsonText = await (_bundle ?? rootBundle).loadString(assetPath);
    return AdhkarJsonModel.parse(jsonText);
  }
}
