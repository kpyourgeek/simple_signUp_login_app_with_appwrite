import 'package:appwrite/appwrite.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:kp/core/core.dart';

final authAPIProvider = Provider((ref) {
  final account = ref.watch(appwriteAccountProvider);
  return AuthApi(account: account);
});

abstract class IAuthApi {
  FutureEither<String> signUp(
      {required String email, required String password});
  FutureEither<String> logIn({required String email, required String password});
}

class AuthApi implements IAuthApi {
  final Account _account;
  AuthApi({required account}) : _account = account;

  @override
  FutureEither<String> signUp(
      {required String email, required String password}) async {
    try {
      final userAccount = await _account.create(
          userId: ID.unique(), email: email, password: password);
      return right(userAccount.email.toString());
    } on AppwriteException catch (e, stackTrace) {
      return left(Failure(e.message ?? 'Something went wrong', stackTrace));
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }

  @override
  FutureEither<String> logIn(
      {required String email, required String password}) async {
    try {
      final userAccount =
          await _account.createEmailSession(email: email, password: password);
      return right(userAccount.$createdAt.toString());
    } on AppwriteException catch (e, stackTrace) {
      return left(Failure(e.message.toString(), stackTrace));
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }
}
