import 'dart:async';

class EmailBloc {
  var _textController = StreamController<String>();

  Stream<String> get textStream => _textController.stream;

  checkText(String teks) {
    bool isEmailCorrect = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(teks);

    (teks == null || teks == "")
        ? _textController.sink.addError("Email masih kosong")
        : (isEmailCorrect)
            ? _textController.sink.add(teks)
            : _textController.sink.addError("Koreksi email anda");
  }

  dispose() {
    _textController.close();
  }
}
