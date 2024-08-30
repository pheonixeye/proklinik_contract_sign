import 'dart:typed_data';
import 'dart:html' as html; // ignore: avoid_web_libraries_in_flutter

void downloadContract(Uint8List bytes, String fileName) {
  final html.Blob blob = html.Blob([bytes], 'application/pdf');

  final String url = html.Url.createObjectUrlFromBlob(blob);

  html.AnchorElement(href: url)
    ..setAttribute('download', fileName)
    ..click();

  html.Url.revokeObjectUrl(url);
}
