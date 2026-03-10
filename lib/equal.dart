/*  
  目的是要讓陣列中的數字全部相同，每次的移動，都要同時讓所有人前進，只有一個人會不能前進

  由於終點最終會是相同的點 且 所有人往右 一個人不動，其實等價於所有人不動 一個人往左移動
  
  因此追求的目標變成，分別找出每個數字往左移動至終點，最少的輪次
  
  由於最大移動步數為5，因此可能的終點位置為:最小值 ~ 最小值 - 4 (最小值-5必定會多一步，-6之後的步數只會更多，不用算)

 */

class EqualProblemSolution {

  ///取得最小值
  int getMin(List<int> input) {
    int min = input[0];
    for (var i = 1; i < input.length; i++) {
      if (input[i] < min) {
        min = input[i];
      }
    }
    return min;
  }

  ///取得所有數字的總輪次
  int getRound(List<int> input) {
    List<int> data = input.toList();

    //取出最小值
    int min = getMin(data);

    // min ~ min - 4的所有輪次可能
    List<int> sumOfRounds = [];

    //所有須計算的終點 min ~ min - 4
    //ps: 因為最大的步數 = 5，所以min - 5只會比min固定多一步，因此之後的都不用算了
    for (var i = 0; i < 5; i++) {
      int sumOfRound = 0;
      int endPoint = min - i;
      for (var j = 0; j < data.length; j++) {
        //取得所有數字到終點的輪次總和
        sumOfRound += getRoundOfNumber(data[j], endPoint);
      }
      sumOfRounds.add(sumOfRound);
    }

    //取出min ~ min - 4的所有可能輪次的最小值
    return getMin(sumOfRounds);
  }

  ///輸入一個數字找到輪次總和
  int getRoundOfNumber(int number, int endPoint) {
    int countOfFive = 0;
    int countOfTwo = 0;
    int countOfOne = 0;
    int remainder = number - endPoint;
    if (remainder >= 5) {
      //走了幾個5
      countOfFive = remainder ~/ 5;
    }
    remainder = remainder.remainder(5); 

    if (remainder >= 2) {
      //走了幾個2
      countOfTwo = remainder ~/ 2; 
    }
    remainder = remainder.remainder(2); 

    if (remainder == 1) {
      //走了1個1
      countOfOne = 1;
    }

    return countOfFive + countOfTwo + countOfOne;
  }
}
