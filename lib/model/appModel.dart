class Team {
  Team({
    required this.id,
    required this.name,
    required this.image,
  });

  final int id;
  final String name;
  final String image;

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
        id: json['id'] as int,
        name: json['name'] as String,
        image: json['image'] as String);
  }
}

class Votes {
  Votes({
    required this.id,
    required this.userId,
    required this.vote,
    required this.matchTime,
    required this.timeVote,
  });

  final int id;
  final int userId;
  final int vote;
  final DateTime matchTime;
  final DateTime timeVote;

  factory Votes.fromJson(Map<String, dynamic> json) {
    return Votes(
      id: json['id'] as int,
      userId: json['userId'] as int,
      vote: json['vote'] as int,
      matchTime: json['matchTime'] as DateTime,
      timeVote: json['timeVote'] as DateTime,
    );
  }
  Map<String, Object?> toJson() {
    return {
      'id': id,
      'userId': userId,
      'vote': vote,
      'matchTime': matchTime,
      'timeVote': timeVote,
    };
  }
  @override
  String toString() {
    return 'Votes {id: $id, userId: $userId, vote: $vote, matchTime: $matchTime, timeVote: $timeVote}';
  }

}
