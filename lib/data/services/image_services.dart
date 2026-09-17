import 'dart:typed_data';

import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ImageUploadService {
  static final _picker = ImagePicker();
  static final _supabase = Supabase.instance.client;

  static Future<String?> pickCompressAndUpload(String businessId) async {
    final XFile? file = await _picker.pickImage(source: ImageSource.gallery);
    if (file == null) return null;

    final Uint8List rawBytes = await file.readAsBytes();
    final img.Image? decoded = img.decodeImage(rawBytes);
    if (decoded == null) return null;

    final img.Image resized = img.copyResize(decoded, width: 450);
    final Uint8List compressedBytes = Uint8List.fromList(img.encodeJpg(resized, quality: 70));

    final path = '$businessId/${DateTime.now().millisecondsSinceEpoch}.jpg';
    await _supabase.storage
        .from('product-images')
        .uploadBinary(path, compressedBytes, fileOptions: const FileOptions(contentType: 'image/jpeg', upsert: true));

    return _supabase.storage.from('product-images').getPublicUrl(path);
  }
}
