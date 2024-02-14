// Rot 13 (or more) but made in Dart!

import 'dart:html';

String rot(String text, int step) {
  const String alpha = 'abcdefghijklmnopqrstuvwxyz';
  final String ALPHA = alpha.toUpperCase();
  String result = '';
  for (final char in text.split('')) {
    if (alpha.contains(char)) {
      int index = alpha.indexOf(char);
      result += alpha[(index + step) % alpha.length];
    } else if (ALPHA.contains(char)) {
      int index = ALPHA.indexOf(char);
      result += ALPHA[(index + step) % ALPHA.length];
    } else {
      result += char;
    }
  }
  return result;
}

void main() {
  window.console.log('Hello, world!');
  final TextAreaElement input =
      window.document.querySelector('#input')! as TextAreaElement;
  final Element output = window.document.querySelector('#output')!;
  final NumberInputElement offset =
      window.document.querySelector('#offset')! as NumberInputElement;
  input.onInput.listen((event) {
    output.text = rot(input.value!, offset.valueAsNumber!.toInt());
  });
  offset.onChange.listen((event) {
    output.text = rot(input.value!, offset.valueAsNumber!.toInt());
  });
}
