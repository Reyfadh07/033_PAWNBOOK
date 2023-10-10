import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pawn_book/model/user_model.dart';

///Ini adalah inisialisasi objek Firebase Authentication dan objek Firebase Firestore untuk mengakses autentikasi dan koleksi pengguna.
class AuthController {
  final auth = FirebaseAuth.instance;
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

///: Ini adalah getter yang mengembalikan nilai boolean false. Tidak ada logika khusus yang terkait dengan ini, jadi ini bisa diabaikan.
  bool get success => false;

///Ini adalah metode untuk masuk dengan email dan kata sandi. Metode ini mengambil email dan kata sandi sebagai argumen, mencoba untuk masuk menggunakan Firebase Authentication, dan mengembalikan UserModel jika berhasil. Jika gagal, akan mencetak pesan kesalahan.
  Future<UserModel?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final UserCredential userCredential = await auth
          .signInWithEmailAndPassword(email: email, password: password);
      final User? user = userCredential.user;

      if (user != null) {
        final DocumentSnapshot snapshot =
            await userCollection.doc(user.uid).get();

        final UserModel currentUser = UserModel(
          uID: user.uid,
          email: user.email ?? '',
          name: snapshot['name'] ?? '',
        );

        return currentUser;
      }
    } catch (e) {
      //print('Error signIn user: $e');
    }

    return null;
  }
///Ini adalah metode untuk mendaftar dengan email, kata sandi, dan nama pengguna. Metode ini mencoba membuat pengguna baru menggunakan Firebase Authentication, membuat UserModel baru, dan menyimpannya ke Firestore jika berhasil. Jika gagal, akan mencetak pesan kesalahan.
  Future<UserModel?> registerWithEmailAndPassword(
      String email, String password, String name) async {
    try {
      final UserCredential userCredential = await auth
          .createUserWithEmailAndPassword(email: email, password: password);
      final User? user = userCredential.user;

      if (user != null) {
        final UserModel newUser =
            UserModel(uID: user.uid, email: user.email ?? '', name: name);

        await userCollection.doc(newUser.uID).set(newUser.toMap());

        return newUser;
      }
    } catch (e) {
      print('Error registering user: $e');
    }

    return null;
  }

///Ini adalah metode untuk mendapatkan pengguna saat ini yang telah masuk. Metode ini akan mengembalikan UserModel jika ada pengguna yang masuk, atau null jika tidak ada.

  UserModel? getCurrentUser() {
    final User? user = auth.currentUser;
    if (user != null) {
      return UserModel.fromFirebaseUser(user);
    }
    return null;
  }

///Ini adalah metode untuk keluar dari sesi pengguna saat ini
  Future<void> signOut() async {
    await auth.signOut();
  }
}
