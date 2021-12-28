import 'dart:html';

import 'package:file_picker/_internal/file_picker_web.dart';
import 'package:file_picker/file_picker.dart';

class Filepick {
  File? file;

 
  
  Future selectfile() async {
    final result = await FilePickerWeb.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: ['pdf']
    );

    if (result == null) return;
    final path = result.files.single.path;
 
    
  }

}