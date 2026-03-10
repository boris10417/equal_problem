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
    /*
      [1, 5, 5]
      1 [2,2,2,2]   [5,1]
      5 [2,2,0,0]   [5,0]
      5 [0,0,2,2]   [0,1]

     */
    List<int> input = [1, 5, 5];
    int answer = 3;
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
