import 'package:get/get.dart';

textFormFieldaValidate(String type,int maxlenth,int minlength,String val){
  
  if(val.isEmpty){
     return 'Can\'t be Empty';
  }
  if(type=='email'){
    if(!GetUtils.isEmail(val)){
      return 'the input not email type';
    }
  }
  if(type=='username'){
   if(!GetUtils.isUsername(val)){
    return 'the input not username type';
   }
  }
  if(val.length < minlength){
    return 'can\'t be less than $minlength';
  }
  if(val.length>maxlenth){
    return 'can\'t be more than than $maxlenth';
  }
}