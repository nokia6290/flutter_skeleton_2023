class ImagePath {
  final String _name;

  const ImagePath._url(this._name);

  final String _imageBasePath = "assets/images/";
  String get imgUrl => _imageBasePath + _name;

  /// PNG
  static const ImagePath logo1 = ImagePath._url("png/logo_1.png");

  static const ImagePath logo2 = ImagePath._url("png/logo_2.png");

  /// SVG

  /// GIF
}
