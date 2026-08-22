import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'network_providers.dart';
import 'upload_api_service.dart';
import 'upload_repository.dart';

part 'upload_providers.g.dart';

@Riverpod(keepAlive: true)
UploadApiService uploadApiService(UploadApiServiceRef ref) {
  return UploadApiService(ref.watch(dioProvider));
}

@Riverpod(keepAlive: true)
UploadRepository uploadRepository(UploadRepositoryRef ref) {
  return UploadRepository(ref.watch(uploadApiServiceProvider));
}