import 'package:dartz/dartz.dart';
import 'package:example_app/core/const/api_constants.dart';
import 'package:example_app/core/const/string_constants.dart';
import 'package:example_app/features/get_api/data/data_sorce/user_data_source.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../../../../core/api/data_source/network_info/network_info.dart';
import '../../../../core/api/model/failure.dart';
import '../../../../core/api/model/success.dart';
import '../../domain/repositories/social_login_repo.dart';

class SocialLoginRepoImpl extends SocialLoginRepo {
  late final UserDataSource userDataSource;
  late final NetworkInfo networkInfo;

  SocialLoginRepoImpl(this.userDataSource, this.networkInfo)
      : super(networkInfo);

  @override
  Future<Either<Failure, Success>> signWithApple() =>
      baseApiMethod(() => (signWithAppleHandler()));

  @override
  Future<Either<Failure, Success>> signWithGoogle() =>
      baseApiMethod(() => (signWithGoogleHandler()));

  /// Below method id used for manage google sign in with firebase authentication
  Future<Either<Failure, Success>> signWithGoogleHandler() async {
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
      ],
    );
    GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    if (googleUser == null) {
      /// return failure object
      return Left(
        ServerFailure(
          errorMessage: LABEL_SOMETHING_WENT_WRONG,
          statusCode: LOCAL_ERROR_CODE,
        ),
      );
    } else {
      /// firebase sign in with credential implementation
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final GoogleAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      ) as GoogleAuthCredential;
      final UserCredential authResult =
          await FirebaseAuth.instance.signInWithCredential(credential);

      /// return success object
      return Right(Success(data: authResult));
    }
  }

  /// Below method id used for manage app sign in with firebase authentication

  Future<Either<Failure, Success>> signWithAppleHandler() async {
    AuthorizationCredentialAppleID? credentialApple =
        await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
    );
    if (credentialApple == null) {
      /// return failure object
      return Left(
        ServerFailure(
          errorMessage: LABEL_SOMETHING_WENT_WRONG,
          statusCode: LOCAL_ERROR_CODE,
        ),
      );
    } else {
      /// firebase sign in with credential implementation

      final authCredential = OAuthProvider("apple.com").credential(
        idToken: credentialApple.identityToken,
      );
      final UserCredential authResult =
          await FirebaseAuth.instance.signInWithCredential(authCredential);

      /// return success object

      return Right(Success(data: authResult));
    }
  }
}
