import 'dart:io';
import 'package:flutter_project/ChatterCraft/Tweet/Tweet.dart';

class DosyaIslemleri {
  static Future<void> writeTweetsToFile(String filePath, List<Tweet> tweets) async {
    final file = File(filePath);
    String content = tweets.map((tweet) => '${tweet.text}||${tweet.likes}||${tweet.isLiked}${tweet.comments.join("||")}').join('\n');
    await file.writeAsString(content);
  }

  static Future<List<Tweet>> readTweetsFromFile(String filePath) async {
    final file = File(filePath);
    if (!await file.exists()) {
      return [];
    }

    String fileContent = await file.readAsString();
    return fileContent.split("\n").where((line) => line.isNotEmpty).map((line) {
      List<String> parts = line.split("||");
      return Tweet(
        text: parts[0],
        likes: int.tryParse(parts[1]) ?? 0,
        isLiked: parts[2].toLowerCase() == 'true',
        comments: parts.sublist(3),
      );
    }).toList();
  }

  static Future<void> addTweetToFile(String filePath, Tweet tweet) async {
    final file = File(filePath);

    List<String> existingLines = [];
    if (await file.exists()) {
      String existingContent = await file.readAsString();
      existingLines = existingContent.split('\n').where((line) => line.isNotEmpty).toList();
    }

    String newContent = '${tweet.text}||${tweet.likes}||${tweet.isLiked}';
    if (tweet.comments.isNotEmpty) {
      newContent += '||${tweet.comments.join("||")}';
    }

    newContent += '\n';

    existingLines.add(newContent);

    await file.writeAsString(existingLines.join('\n'));
  }
}
