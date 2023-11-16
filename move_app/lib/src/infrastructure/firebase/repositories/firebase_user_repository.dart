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
        .doc(user.uuid)
        .set(userToJson(user))
        .then((value) => user);
  }

  @override
  Future<void> deleteUser(AppUser user) {
    return _firestore.collection('users').doc(user.uuid).delete();
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
  Future<AppUser> updateUser(AppUser user) async {
    await _firestore
        .collection('users')
        .doc(user.uuid)
        .update(userToJson(user));

    return getUser(user.uuid);
  }

  @override
  Future<bool> isUserExists(String uuid) {
    return _firestore
        .collection('users')
        .doc(uuid)
        .get()
        .then((snapshot) => snapshot.exists);
  }
}

Map<String, dynamic> userToJson(AppUser user) => <String, dynamic>{
      'uuid': user.uuid,
      'firstname': user.firstname,
      'lastname': user.lastname,
      'phone': user.phone,
      'email': user.email,
      'roles': user.roles.map((e) => e.toString().split('.').last).toList(),
    };

AppUser userFromJson(Map<String, dynamic> json) => AppUser(
      uuid: json['uuid'] as String,
      firstname: json['firstname'] as String,
      lastname: json['lastname'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String,
      roles: (json['roles'] as List<dynamic>)
          .map((e) => AppUserRole.values.firstWhere(
                (element) => element.toString().split('.').last == e,
              ))
          .toList(),
    );
