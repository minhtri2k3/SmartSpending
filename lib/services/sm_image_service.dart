
import 'dart:io';

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