import 'dart:async';

class EmailBloc {
  var _textStreamController = StreamController<String>();

  Stream<String> get textStream => _textStreamController.stream;

  checkText(String teks) {
    bool isEmailCorrect = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(teks);

    (teks == null || teks == "")
        ? _textStreamController.sink.addError("Email masih kosong")
        : (isEmailCorrect)
            ? _textStreamController.sink.add(teks)
            : _textStreamController.sink.addError("Koreksi email anda");
  }

  dispose() {
    _textStreamController.close();
  }
}
