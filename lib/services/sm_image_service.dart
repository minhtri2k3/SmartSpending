
import 'dart:io';

import 'package:gallery_picker/gallery_picker.dart';
import 'package:gallery_picker/models/media_file.dart';

import '../core/export.dart';

class SMImage {
   Future<File?> singleMedia( BuildContext context) async{
     try{
        List<MediaFile>? singleData  = await GalleryPicker.pickMedia(context : context , singleMedia : true);
        return singleData?.first.getFile();
     }catch(e){

     }
     return null;
   }
}