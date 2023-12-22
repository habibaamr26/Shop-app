

import 'model_class.dart';
import '../register/regester_model.dart';

abstract class states{}


class initialstate extends states{}


class securitylogin extends states{}


class loadinglogin extends states{}


class successlogin extends states{
  loginModel x;
  successlogin(this.x);
}


class faillogin extends states{}



class loadingreg extends states{}


class successreg extends states{
  regestModel x;
  successreg(this.x);
}


class failreg extends states{}




