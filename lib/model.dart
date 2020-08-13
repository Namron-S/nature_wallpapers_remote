class Photo {
  int id, width, height;
  String url, photographer, photographerUrl;
  int photographerId;
  Source source;

  Photo(
      {this.id,
      this.width,
      this.height,
      this.url,
      this.photographer,
      this.photographerUrl,
      this.photographerId,
      this.source});

  factory Photo.fromMap(Map<String, dynamic> jsonMap) {
    return Photo(
        id: jsonMap['id'],
        width: jsonMap['width'],
        height: jsonMap['height'],
        url: jsonMap['url'],
        photographer: jsonMap['photographer'],
        photographerUrl: jsonMap['photographer_url'],
        photographerId: jsonMap['photographer_id'],
        source: Source.fromMap(jsonMap['src']));
  }
}

class Source {
  Source(
      {this.original,
      this.large2x,
      this.large,
      this.medium,
      this.small,
      this.portrait,
      this.landscape,
      this.tiny});

  factory Source.fromMap(Map<String, dynamic> jsonMap) {
    return Source(
        original: jsonMap['original'],
        large2x: jsonMap['large2x'],
        large: jsonMap['large'],
        medium: jsonMap['medium'],
        small: jsonMap['small'],
        portrait: jsonMap['portrait'],
        landscape: jsonMap['landscape'],
        tiny: jsonMap['tiny']);
  }

  String original, large2x, large, medium, small, portrait, landscape, tiny;
}
