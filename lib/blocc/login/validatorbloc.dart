import 'dart:async';

mixin Validators {
  var emailValidator = StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink) {
      if (email.isEmpty) {
        return sink.addError("This Filed can't be empty");
      }
      if (email.length > 32) {
        return sink.addError("email cannot be more than 32 characters");
      }
      if (email.length < 6) {
        return sink.addError("email cannot be less than 6 characters");
      } else {
        sink.add(email);
      }
    },
  );
  var loginpasswordValidator = StreamTransformer<String, String>.fromHandlers(
    handleData: (password, sink) {
      if (password.isEmpty) {
        return sink.addError("This Filed can't be empty");
      }
      if (password.length < 8) {
        return sink.addError("password cannot be less than 8 characters");
      } else {
        sink.add(password);
      }
    },
  );
  var nameValidator = StreamTransformer<String, String>.fromHandlers(
    handleData: (NAME, sink) {
      if (NAME.isEmpty) {
        return sink.addError("This Filed can't be empty");
      }
      if (NAME.length > 32) {
        return sink.addError("NAME cannot be more than 32 characters");
      }
      if (NAME.length < 6) {
        return sink.addError("NAME cannot be less than 6 characters");
      } else {
        sink.add(NAME);
      }
    },
  );
  var phoneValidator = StreamTransformer<String, String>.fromHandlers(
    handleData: (NAME, sink) {
      if (NAME.isEmpty) {
        return sink.addError("This Filed can't be empty");
      }
      if (NAME.length > 10) {
        return sink.addError("Number cannot be more than 32 digits");
      }
      if (NAME.length < 10) {
        return sink.addError("Number cannot be less than 6 digits");
      } else {
        sink.add(NAME);
      }
    },
  );

  var passwordValidator = StreamTransformer<String, String>.fromHandlers(
    handleData: (pass, sink) {
      if (pass.isEmpty) {
        return sink.addError("This Filed can't be empty");
      }
      if (pass.length > 32) {
        return sink.addError("Password cannot be more than 6 characters");
      }
      if (pass.length < 8) {
        return sink.addError("Password cannot be less than 6 characters");
      } else {
        sink.add(pass);
      }
    },
  );
// var conformpasswordValidator = StreamTransformer<String, String>.fromHandlers(
//   handleData: (conformpassword, sink) {
//     if (conformpassword.isEmpty) {
//       return sink.addError("This Filed can't be empty");
//     }
//
//     if (conformpassword.length < 8) {
//       return sink
//           .addError("conformpassword cannot be less than 6 characters");
//     }
//   },
// );
}
