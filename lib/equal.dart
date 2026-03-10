/*  
  目的是要讓陣列中的數字全部相同，每次的移動，都要同時讓所有人前進，只有一個人會不能前進

  ## 每一輪中，要讓哪一個數字不動
  優先讓 最大值 停步

  ## min + step - max 的差量的優先度選擇

  1. = 0 的差量優先
  2.若無1.，則 < 0 的最大值 的差量優先
  3.若無(1.且 2.)，則 > 0 的最小值

  



 */

class EqualProblemSolution {
  ///可能的步數
  List<int> availableStep = [5, 2, 1];

  ///取得可能的步數
  int getStep(int difference) {
    for (var step in availableStep) {
      if (difference >= step) {
        return step;
      }
    }
    throw "找不到可用step";
  }

  int getMax(List<int> input) {
    
    int max = input[0];
    for (var i = 1; i < input.length; i++) {
      if (input[i] > max) {
        max = input[i];
      }
    }
    return max;
  }

  int getMin(List<int> input) {
    int min = input[0];
    for (var i = 1; i < input.length; i++) {
      if (input[i] < min) {
        min = input[i];
      }
    }
    return min;
  }

  double getMinOfDouble(List<double> input) {
    double min = input[0];
    for (var i = 1; i < input.length; i++) {
      if (input[i] < min) {
        min = input[i];
      }
    }
    return min;
  }

  int getRound(List<int> input) {
    List<int> data = input.toList();
    int counter = 0;
    
    while (data.toSet().length != 1) {
      
      // if (counter > 10605) {
      //   //*除錯用 為了避免無限迴圈的中止點
      //   throw "計算超出答案上限";
      // }


      //從小排到大
      data.sort();

      //取出最大值
      int max = data.last;
      int min = data.first;

      //取出最好的step
      int step = getBetterStep(min, max);

      //移動所有人並暫停最大值
      for (var i = 0; i < data.length - 1; i++) {
        data[i] += step;
      }
      counter++;
    }

    return counter;
  }

  //取出移動後，差量最小者
  int getBetterStep(int min, int max) {
    List<int> differences = List.generate(availableStep.length, (index) {
      //原版
      // return (min + availableStep[index] - max).abs();

      /*優先順序
        = 0
        < 0 的最大值
        > 0 的最小值
       */
      return (min + availableStep[index] - max);
    });

    // int index = differences.indexOf(getMin(differences));

    int index = differences.indexOf(getBestDifference(differences));
    return availableStep[index];
  }
  //取得最適合的差量
  int getBestDifference(List<int> differences) {
    /*優先順序
        = 0
        < 0 的最大值
        > 0 的最小值
    */
    if (differences.any((e) => e == 0)) {
      return 0;
    }

    final negativeList = differences.where((e)=>e<0).toList();

    if (negativeList.isNotEmpty) {
      //若存在負數至少一個
      return getMax(differences.where((e)=>e<0).toList());
    }

    //若都是正數
    return getMin(differences);
  }
}
