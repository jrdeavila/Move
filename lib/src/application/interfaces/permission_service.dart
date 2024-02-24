enum Permission {
  camera,
  storage,
  location,
  sound,
}

abstract interface class IPermissionService {
  Future<bool> hasPermission(Permission permission);
  Future<bool> requestPermission(Permission permission);

  Future<bool> requestPermissions(List<Permission> permissions);
  Future<bool> hasPermissions(List<Permission> permissions);
}
