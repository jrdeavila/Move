import 'package:mevo/lib.dart';

abstract class IUpdateProfileUseCase {
  Future<AppUser> updateProfile(UpdateProfileRequest updateProfileRequest);
}
