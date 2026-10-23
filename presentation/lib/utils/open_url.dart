import 'package:url_launcher/url_launcher.dart';

/// Opens [url] in a new browser tab (or the matching app for mailto:/tel:).
Future<void> openUrl(String url) => launchUrl(Uri.parse(url), webOnlyWindowName: '_blank');
