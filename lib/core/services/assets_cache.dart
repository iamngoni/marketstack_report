import 'package:flutter/material.dart';

List<String> imageAssets = [];

void cacheAssets(BuildContext context) {
  for (final assetPath in imageAssets) {
    precacheImage(AssetImage(assetPath), context);
  }
}
