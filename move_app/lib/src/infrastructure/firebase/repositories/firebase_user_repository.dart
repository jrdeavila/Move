import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:move_app/lib.dart';

@Injectable(as: IUserRepository)
class FirebaseUserRepository implements IUserRepository {
  final FirebaseFirestore _firestore;

  FirebaseUserRepository({required FirebaseFirestore firestore})
      : _firestore = firestore;

  @override
  Future<AppUser> createUser(AppUser user) {
    return _firestore
        .collection('users')
        .doc(user.uid)
        .set(userToJson(user))
        .then((value) => user);
  }

  @override
  Future<void> deleteUser(AppUser user) {
    return _firestore.collection('users').doc(user.uid).delete();
  }

  @override
  Future<AppUser> getUser(String uuid) {
    return _firestore
        .collection('users')
        .doc(uuid)
        .get()
        .then((snapshot) => userFromJson(snapshot.data()!));
  }

  @override
  Future<AppUser> updateUser(AppUser user) {
    return _firestore
        .collection('users')
        .doc(user.uid)
        .update(userToJson(user))
        .then((value) => user);
  }
}

Map<String, dynamic> userToJson(AppUser user) => <String, dynamic>{
      'uid': user.uid,
      'name': user.name,
      'email': user.email,
      'roles': user.roles.map((e) => e.toString().split('.').last).toList(),
    };

AppUser userFromJson(Map<String, dynamic> json) => AppUser(
      uid: json['uid'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      roles: (json['roles'] as List<dynamic>)
          .map((e) => AppUserRole.values.firstWhere(
                (role) => role.toString() == 'AppUserRole.$e',
              ))
          .toList(),
    );
