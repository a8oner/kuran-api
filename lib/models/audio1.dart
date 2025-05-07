class Audio {
  String? mp3;
  int? duration;

  Audio({
    this.mp3,
    this.duration,
  });

  Audio copyWith({
    String? mp3,
    int? duration,
  }) {
    return Audio(
      mp3: mp3 ?? this.mp3,
      duration: duration ?? this.duration,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'mp3': mp3,
      'duration': duration,
    };
  }

  factory Audio.fromJson(Map<String, dynamic> json) {
    return Audio(
      mp3: json['mp3'] as String?,
      duration: json['duration'] as int?,
    );
  }
}
