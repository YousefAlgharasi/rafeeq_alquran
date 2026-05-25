import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repository/repo_impl/share_ayah_repository_impl.dart';
import '../repository/share_ayah_repository.dart';

final shareAyahRepositoryProvider = Provider<ShareAyahRepository>((ref) {
  return ShareAyahRepositoryImpl();
});
