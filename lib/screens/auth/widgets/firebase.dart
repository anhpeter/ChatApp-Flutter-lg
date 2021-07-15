
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';

final firebaseInitialize = Firebase.initializeApp();
final auth = FirebaseAuth.instance;
final firestore = FirebaseStorage.instance;