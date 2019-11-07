//
//  Model.swift
//  Calculator
//
//  Created by USER on 2019/11/07.
//  Copyright © 2019 USER. All rights reserved.
//

import Foundation
class DataModel: ObservableObject {
    @Published var operation = "none" // 記錄目前要執行的運算類型
    @Published var performingMath = false // 目前是否在運算中
    @Published var numberOnScreen:Double = 0 // 儲存畫面上目前的數字
    @Published var previousNumber:Double = 0 // 之前畫面上的數字
    @Published var startNew = true  // 是否要重啟計算
    @Published var isDecimal = false // 確認小數點用
    @Published var isNegative = false // 確認負數用
    @Published var isNumber = false // 給負數確認數字是否執行中
    @Published var onOperation = "" // 給數字按鍵做運算中判斷用
    @Published var operationForRecord = "" // 給動作紀錄顯示運算符號用
    @Published var actionRecord = ""  // 上ㄧ步動作紀錄
    @Published var resultLabel = ""  // 当前数字
    
    // 更新上ㄧ步動作紀錄
    func actionRecondMethod(from: String) {
        actionRecord = operationForRecord + resultLabel
    }
    // 確認是否為正常字串，並判斷整數和浮點數，及設定小數點後面位數。（資訊參考網路教學內容）
    func makeOkNumberString(from number:Double) {   // 設定from是外部參數名，number是內部參數名。
        var okText:String
        
        if floor(number) == number {    // floor為無條件捨去，這邊是在測試是否為整數
            okText = "\(Int(number))"
        } else {
            okText = "\(number)"
        }
        if okText.count >= 9 {
            okText = String(okText.prefix(9))   // 只截取前面10個數字
        }
        resultLabel = okText
    }
    
    // 確認目前是否有小數點狀態
    func decimalCheck(from number:Double) {
        let okDecimal:String
        if floor(number) == number  {
            okDecimal = "\(Int(number))"
            isDecimal = false
        } else {
            okDecimal = "\(number)"
            isDecimal = true
        }
        resultLabel = okDecimal
    }
    // 有關浮點數相減時的問題（以下程式碼參考網路分享內容）
    func subtractFloat(s1:String, s2:String) -> String { //輸入二個數字字串
        var c:Double = 0 //用做計算結果之用
        var k:Double = 1 //作為十的次方之用
        let n1:Double! = Double(s1) //轉換字串為浮點數
        let n2:Double! = Double(s2) //轉換字串為浮點數
        let a1 = Array(s1) //轉換字串為字元陣列
        let a2 = Array(s2) //轉換字串為字元陣列
        var counter1 = 0 //第一個陣列的元素個數
        var counter2 = 0 //第二個陣列的元素個數
        var afterPoint = 0 //看誰的小數點後面的數字個數多就給它
        
        //求出二個數字小數點之後的數字個數
        for i in 0...(a1.count-1) {
            if a1[i] == "." {
                counter1 = a1.count - i - 1
            }
        }
        for i in 0...(a2.count-1) {
            if a2[i] == "." {
                counter2 = a2.count - i - 1
            }
        }
        //將比較多的個數給予afterPoint
        if counter1 >= counter2 {
            afterPoint = counter1 }
        else {
            afterPoint = counter2
        }
        
        //將afterPoint當成十的次方數
        for _ in 1...afterPoint {
            k = k*10
        }
        
        c = (n1*k - n2*k)/k //先將二個數字乘上k都變成整數再相減，減完後再除以k回歸為浮點數
        return String(c) //將結果轉換成字串回傳
    }
    // 數字按鍵
    func numbers(_ inputNumber: Int) {
        isNumber = true
        
        if resultLabel != "" {
            if isNegative == true {
                resultLabel = resultLabel + "\(inputNumber)"
                
            } else {
                if startNew == true && performingMath == false {
                    resultLabel = "\(inputNumber)"
                    startNew = false // 這個if是按完等於後，任何數字按鍵皆可歸零重啟計算。
                } else if resultLabel == "0" || onOperation == "onPlus" || onOperation == "onMinus" || onOperation == "onTimes" || onOperation == "onDivided" {
                    resultLabel = "\(inputNumber)"
                    onOperation = ""
                } else {
                    resultLabel = resultLabel + "\(inputNumber)"
                }
            }
        }else{
            resultLabel = resultLabel + "\(inputNumber)"
        }
        actionRecondMethod(from: resultLabel)
        numberOnScreen = Double(resultLabel) ?? 0
        // 如果resultLabel.text無法轉成Double，就把0存進現在的畫面。
    }
    // 小數點
    func decimal() {
        
        let inputNumber = "."
        decimalCheck(from: numberOnScreen)
        
        if resultLabel != "" {
            if  isNegative == true && -Int(resultLabel)! > 0  {
                resultLabel = resultLabel + inputNumber
                
            }  else if isNegative == true || Double(resultLabel)! < 0 {
                resultLabel = "-" + resultLabel + inputNumber
                
            } else if startNew == true && performingMath == false {
                resultLabel = "0" + inputNumber
                startNew = false
            }
                
            else {
                if onOperation == "onPlus" || onOperation == "onMinus" || onOperation == "onTimes" || onOperation == "onDivided" {
                    resultLabel = "0" + inputNumber
                    onOperation = ""
                    
                } else if isDecimal == true {
                    //resultLabel = resultLabel
                } else {
                    resultLabel = resultLabel + inputNumber
                }
            }
        }
        
    }
    // 刪除鍵
    func deleteKey() {
        
        //print("末尾１文字以外: \(String(str.prefix(str.characters.count - 1)))")
        resultLabel = String(resultLabel.dropLast())
        numberOnScreen = Double(resultLabel) ?? 0
        actionRecondMethod(from: resultLabel)
    }
    // 百分比（異常小數點問題未解決）
    func percentage() {
        
        if resultLabel != "" {
            if numberOnScreen == 0 {
                resultLabel = "0"
            } else {
                resultLabel = "\(numberOnScreen / 100)"
                numberOnScreen = Double(resultLabel)!
                actionRecondMethod(from: resultLabel)
            }
        }
    }
    // 正負號
    func negative() {
        
        if resultLabel == "0" || resultLabel == "-" {
            resultLabel = "-"
            isNegative = true
            
        } else if isNumber == true && performingMath == true && isNegative == false {
            resultLabel = "-" + resultLabel
            numberOnScreen = Double(resultLabel)!
        } else if performingMath == true && isNegative == false {
            resultLabel = "-"
            
        } else if resultLabel == "0." {
            resultLabel = "-" + resultLabel
            
        } else if Double(resultLabel)! <= 0 || resultLabel == "-0" {
            resultLabel = String(resultLabel.dropFirst())
            numberOnScreen = Double(resultLabel)!
        } else {
            resultLabel = "-" + resultLabel
            numberOnScreen = Double(resultLabel)!
        }
        isNumber = false
        isNegative = true
        actionRecondMethod(from: resultLabel)
    }
    // AC清除歸零
    func clear() {
        startNew = true
        resultLabel = "0"
        actionRecord = "0"
        operation = "none"
        performingMath = false
        numberOnScreen = 0
        previousNumber = 0
        isNegative = false
        operationForRecord = ""
        onOperation = ""
    }
    // 加法 +
    func plus() {
        answer()
        onOperation = "onPlus"
        operation = "plus"
        performingMath = true
        operationForRecord = "+"
        isNegative = false
        isNumber = false
        previousNumber = numberOnScreen
    }
    // 減法 -
    func minus() {
        answer()
        onOperation = "onMinus"
        operation = "minus"
        performingMath = true
        operationForRecord = "-"
        isNegative = false
        isNumber = false
        previousNumber = numberOnScreen
    }
    // 乘法 ×
    func times() {
        answer()
        onOperation = "onTimes"
        operation = "times"
        performingMath = true
        operationForRecord = "×"
        isNegative = false
        isNumber = false
        previousNumber = numberOnScreen
    }
    // 除法 ÷
    func divided() {
        answer()
        onOperation = "onDivided"
        operation = "divided"
        performingMath = true
        operationForRecord = "÷"
        isNegative = false
        isNumber = false
        previousNumber = numberOnScreen
    }
    func answer() {
        
        if isNumber == false {
            //resultLabel = resultLabel
            
        } else if performingMath == true {
            
            if operation == "times" || operation == "divided" {
                if operation == "times" {
                    numberOnScreen = previousNumber * numberOnScreen
                    makeOkNumberString(from: numberOnScreen)
                } else if operation == "divided" {
                    if numberOnScreen != 0 {    // 避免除0時，產生crash
                        numberOnScreen = previousNumber / numberOnScreen
                        makeOkNumberString(from: numberOnScreen)
                    } else {
                        resultLabel = "0"
                    }
                }
            } else if operation == "plus" {
                numberOnScreen = previousNumber + numberOnScreen
                makeOkNumberString(from: numberOnScreen)
            } else if operation == "minus" {
                numberOnScreen = Double(subtractFloat(s1: "\(previousNumber)", s2: "\(numberOnScreen)"))!
                makeOkNumberString(from: numberOnScreen)
            } else if operation == "none" {
                resultLabel = "0"
            }
            
            performingMath = false
            isNegative = false
            isNumber = false
            onOperation = ""
            startNew = true
            
            numberOnScreen = Double(resultLabel)!
            previousNumber = numberOnScreen
        }
    }
    //等于
    func equals() {
        answer()
    }
}

