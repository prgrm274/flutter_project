import 'dart:async';

class PasswordBloc {
  var _textController = StreamController<String>();

  Stream<String> get textStream => _textController.stream;

  checkText(String teks) {
    bool isPasswordCorrect = RegExp(
            r"^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&-+=()])(?=\\S+$).{8, 20}$")
        .hasMatch(teks);

    (teks == null || teks == "")
        ? _textController.sink.addError("Password masih kosong")
        : (isPasswordCorrect)
            ? _textController.sink.add(teks)
            : _textController.sink.addError("Koreksi format password anda");
  }

  dispose() {
    _textController.close();
  }
}
