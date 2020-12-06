enum ValidatorType{
  email,
  password,
  phone,
  firstName,
  lastName 
}

bool validator(ValidatorType type,String value){
  switch(type){
    case ValidatorType.email:{
      if(RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value))return true;
      return false;
    }
    break;

    case ValidatorType.password:{
      if(value.length>=6) return true;
      return false;
    }
    break;

    case ValidatorType.phone:{
      if(double.parse(value).isFinite)return true;
      return false;
    }
    break;

    case ValidatorType.firstName:{
      if(value.length>3) return true;
      return false;
    }
    break;

    case ValidatorType.lastName:{
      if(value.length>3) return true;
      return false;
    }
    break;
  }
}