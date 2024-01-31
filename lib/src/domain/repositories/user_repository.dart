import 'package:mevo/lib.dart';

abstract class IUserRepository {
  Future<AppUser?> getUser(String uuid);
  Future<AppUser> createUser(AppUser user);
  Future<AppUser> updateUser(AppUser user);
  Future<void> deleteUser(AppUser user);
  Future<bool> isUserExists(String uuid);
}
