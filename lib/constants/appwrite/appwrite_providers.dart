import 'package:appwrite/appwrite.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kp/constants/appwrite/appwrite_constants.dart';

// service provider

final appwriteClientProvider = Provider((ref) {
  final Client client = Client();
  return client
      .setEndpoint(AppwriteConstants.appwriteUrl)
      .setProject(AppwriteConstants.appwriteProjectId)
      .setSelfSigned(status: true);
});

// Account provider
final appwriteAccountProvider = Provider((ref) {
  final client = ref.watch(appwriteClientProvider);
  return Account(client);
});
