import 'package:injectable/injectable.dart';
import 'package:mevo/lib.dart';

@Injectable(as: IUpdateProfileUseCase)
class UpdateProfileUseCase implements IUpdateProfileUseCase {
  final IUserRepository _userRepository;

  UpdateProfileUseCase({required IUserRepository userRepository})
      : _userRepository = userRepository;

  @override
  Future<AppUser> updateProfile(UpdateProfileRequest updateProfileRequest) {
    final user = AppUser(
      uuid: updateProfileRequest.uuid,
      firstname: updateProfileRequest.firstname,
      lastname: updateProfileRequest.lastname,
      phone: updateProfileRequest.phone,
      email: updateProfileRequest.email,
      roles: updateProfileRequest.roles,
    );

    return _userRepository.updateUser(user);
  }
}
