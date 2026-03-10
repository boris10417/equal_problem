import 'package:equal_problem/equal.dart';
import 'package:test/test.dart';
import 'dart:io';

void main() {
  test('第1組測資', () {
    List<int> input = [10, 7, 12];
    int answer = 3;
    expect(EqualProblemSolution().getRound(input), answer);
  });

  test('第2組測資', () {
    List<int> input = [2, 2, 3, 7];
    int answer = 2;
    expect(EqualProblemSolution().getRound(input), answer);
  });

  test('第3組測資', () {
    List<int> input = [1, 1, 5];
    int answer = 2;
    expect(EqualProblemSolution().getRound(input), answer);
  });
  test('第4組測資', () {
    String inputData =
        "512 125 928 381 890 90 512 789 469 473 908 990 195 763 102 643 458 366 684 857 126 534 974 875 459 892 686 373 127 297 576 991 774 856 372 664 946 237 806 767 62 714 758 258 477 860 253 287 579 289 496";

    List<int> input = inputData.split(' ').map((e) => int.parse(e)).toList();
    int answer = 5104;
    expect(EqualProblemSolution().getRound(input), answer);
  });

  group('網站提供的5組測資測試', () {
    List<List<int>> testData = [];
    List<int> answerData = [];
    setUpAll(() async {
      File file1, file2;
      String inputString, answerString;
      // 讀取檔案內容
      file1 = File('./input/input00.txt');
      inputString = await file1.readAsString();

      file2 = File('./output/output00.txt');
      answerString = await file2.readAsString();

      List<String> inputStrings = inputString.split('\n');
      List<String> answerStrings = answerString.split('\n');

      print("inputString = $inputString");
      print("answerString = $answerString");

      testData
          .add(inputStrings[2].split(' ').map((e) => int.parse(e)).toList());
      testData
          .add(inputStrings[4].split(' ').map((e) => int.parse(e)).toList());
      testData
          .add(inputStrings[6].split(' ').map((e) => int.parse(e)).toList());
      testData
          .add(inputStrings[8].split(' ').map((e) => int.parse(e)).toList());
      testData
          .add(inputStrings[10].split(' ').map((e) => int.parse(e)).toList());

      answerData = answerStrings.map((e) => int.parse(e)).toList();
    });

    test('第1組測資', () {
      List<int> input = testData[0];
      int answer = answerData[0];
      expect(EqualProblemSolution().getRound(input), answer);
    });
    test('第2組測資', () {
      List<int> input = testData[1];
      int answer = answerData[1];
      expect(EqualProblemSolution().getRound(input), answer);
    });
    test('第3組測資', () {
      List<int> input = testData[2];
      int answer = answerData[2];
      expect(EqualProblemSolution().getRound(input), answer);
    });
    test('第4組測資', () {
      List<int> input = testData[3];
      int answer = answerData[3];
      expect(EqualProblemSolution().getRound(input), answer);
    });
    test('第5組測資', () {
      List<int> input = testData[4];
      int answer = answerData[4];
      expect(EqualProblemSolution().getRound(input), answer);
    });
  });
}
