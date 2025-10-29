class PrakrutiResult {
  final int? id;
  final int userId;
  final int vataScore;
  final int pittaScore;
  final int kaphaScore;
  final String dominantPrakruti;

  PrakrutiResult({
    this.id,
    required this.userId,
    required this.vataScore,
    required this.pittaScore,
    required this.kaphaScore,
    required this.dominantPrakruti,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'vataScore': vataScore,
      'pittaScore': pittaScore,
      'kaphaScore': kaphaScore,
      'dominantPrakruti': dominantPrakruti,
    };
  }

  factory PrakrutiResult.fromMap(Map<String, dynamic> map) {
    return PrakrutiResult(
      id: map['id'],
      userId: map['userId'],
      vataScore: map['vataScore'],
      pittaScore: map['pittaScore'],
      kaphaScore: map['kaphaScore'],
      dominantPrakruti: map['dominantPrakruti'],
    );
  }
}
