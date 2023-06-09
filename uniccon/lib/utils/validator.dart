
import 'package:form_field_validator/form_field_validator.dart';

final passwordValidator = MultiValidator([
  RequiredValidator(errorText: 'Password is required'),
  MinLengthValidator(8, errorText: 'Password must be at least 8 digits long'),
  
]);

final pinValidator = MultiValidator([
  RequiredValidator(errorText: 'Password is required'),
  MinLengthValidator(4, errorText: 'Password must be at least 4 digits long'),
]);

passwordMatchValidator(String? val, String password, String confirmPassword) {
  MatchValidator(errorText: 'Passwords do not match')
      .validateMatch(val!, password);
}
final emailValidator = MultiValidator([
  RequiredValidator(errorText: 'Email address is required'),
  EmailValidator(errorText: 'Enter a valid email address'),
]);

final requiredField = RequiredValidator(errorText: 'This field is required');


final phoneValidator =
    MinLengthValidator(6, errorText: 'phone number must be more than 6 digits long');
