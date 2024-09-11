import 'package:flutter/material.dart';

List<TextSpan> highlightOccurrences(
    {required TextStyle normalStyle,
    required TextStyle highLightStyle,
    required String source,
    required String query}) {
  if (query.isEmpty || !source.toLowerCase().contains(query.toLowerCase())) {
    return [TextSpan(text: source, style: normalStyle)];
  }
  final matches = query.toLowerCase().allMatches(source.toLowerCase());

  int lastMatchEnd = 0;

  final List<TextSpan> children = [];
  for (var i = 0; i < matches.length; i++) {
    final match = matches.elementAt(i);

    if (match.start != lastMatchEnd) {
      children.add(TextSpan(
        text: source.substring(lastMatchEnd, match.start),
        style: normalStyle,
      ));
    }

    children.add(TextSpan(
      text: source.substring(match.start, match.end),
      style: highLightStyle,
    ));

    if (i == matches.length - 1 && match.end != source.length) {
      children.add(TextSpan(
        text: source.substring(match.end, source.length),
        style: normalStyle,
      ));
    }

    lastMatchEnd = match.end;
  }
  return children;
}
