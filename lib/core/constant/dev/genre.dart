class GenreNames {
  static Map<String, String> genreMap = {
    'Action': "assets/images/genre/485103.jpg",
    'Storyline': "assets/images/genre/466085.jpg",
    'Racing': "assets/images/genre/106388.jpg",
    'Hero\'s': "assets/images/genre/108741.jpg",
    'Romantic': "assets/images/genre/75034.jpg",
    'Fairy Tales': "assets/images/genre/5.jpg",
    'Animation': "assets/images/genre/718156.jpg",
    'TV Series': "assets/images/genre/61boFr6SYZL._SL1000_.jpg",
    'Cartoon': "assets/images/genre/112462.jpg",
    'Sci-Fi': "assets/images/genre/573474.jpg",
    'Drama': "assets/images/genre/57394.jpg",
    'Adventure': "assets/images/genre/60858.jpg",
  };

  static Map<String, String> getGenreMap() {
    // Map<String, String> genreMap = new Map();

    return genreMap;
  }

  static getItem(int i) {
    List<String> keys = genreMap.keys.toList();
    return genreMap[keys[i % keys.length]];
  }

  static getKey(int i) {
    List<String> keys = genreMap.keys.toList();
    return keys[i % keys.length];
  }

  static int getLen() {
    List<String> keys = genreMap.keys.toList();
    return keys.length;
  }
}
