import 'package:injectable/injectable.dart';
import 'package:move_app/lib.dart';
import 'package:url_launcher/url_launcher.dart';

@LazySingleton(as: ICallService)
class UrlLauncherCallService implements ICallService {
  @override
  Future<void> callService(String phoneNumber) async {
    final uri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(uri);
  }
}
