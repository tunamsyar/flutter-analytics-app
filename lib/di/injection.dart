import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../services/auth_service.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async {
  // Firebase instances
  getIt.registerSingleton<FirebaseAuth>(FirebaseAuth.instance);
  getIt.registerSingleton<FirebaseFirestore>(FirebaseFirestore.instance);
  final googleSignIn = kIsWeb
      ? GoogleSignIn(
          clientId:
              '510235655608-hikphg9mrf1lidsm1h5hb73ga3d08l87.apps.googleusercontent.com',
        )
      : GoogleSignIn();

  getIt.registerSingleton<GoogleSignIn>(googleSignIn);

  // Services
  getIt.registerSingleton<AuthService>(AuthServiceImpl(getIt(), getIt()));
}
