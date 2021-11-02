int hexColor(String hex) {
  int color;
  color = int.parse("0xff" + hex.replaceAll('#', ''));
  return color;
}
