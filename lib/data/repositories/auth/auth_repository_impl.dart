import 'dart:developer';

import 'package:cinebox_app/core/result/result.dart';
import 'package:cinebox_app/data/exceptions/data_exception.dart';
import 'package:cinebox_app/data/services/google_signin/google_signin_service.dart';
import 'package:cinebox_app/data/services/local_storage/local_storage_service.dart';

import './auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final LocalStorageService _localStorageService;
  final GoogleSigninService _googleSigninService;

  AuthRepositoryImpl({
    required LocalStorageService localStorageService,
    required GoogleSigninService googleSigninService,
  }) : _localStorageService = localStorageService,
       _googleSigninService = googleSigninService;

  @override
  Future<Result<bool>> isLogged() async {
    final resultToken = await _localStorageService.getIdToken();

    switch (resultToken) {
      case Success<String>():
        return Success(true);
      case Failure<String>():
        return Success(false);
    }
  }

  @override
  Future<Result<Unit>> signIn() async {
    final result = await _googleSigninService.signIn();
    switch (result) {
      case Success<String>(:final value):
        await _localStorageService.saveIdToken(value);
        return successOfUnit();
      case Failure<String>(:final error):
        log('Erro ao realizar Login', name: 'AuthRepository', error: error);
        return Failure(
          DataException(message: 'Erro ao realizar Login com a Google'),
        );
    }
  }

  @override
  Future<Result<Unit>> signOut() async {
    final result = await _googleSigninService.signOut();
    switch (result) {
      case Success<Unit>():
        final removeResult = await _localStorageService.removeIdToken();
        switch (removeResult) {
          case Success<Unit>():
            return successOfUnit();
          case Failure<Unit>(:final error):
            log('Erro ao realizar logout ID token');
            return Failure(error);
        }
      case Failure<Unit>(:final error):
        return Failure(error);
    }
  }
}
