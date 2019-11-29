//
//  GameManager.swift
//  TurnOffTheLight
//
//  Created by USER on 2019/11/29.
//  Copyright © 2019 USER. All rights reserved.
//

import Foundation
import SwiftUI

class GameManager:ObservableObject {
    
    @Published var lights = [[Light]]()
    @Published var isWin = false
    
    private var currenStatus: GameStatus = .during {
        didSet{
            switch currenStatus {
            case .win:
                isWin = true
            case .lose:
                isWin = false
            case .during:
                break
            }
        }
    }
    private(set) var size:Int?
    
    init() {
        
    }
    convenience init(size: Int = 5,
                     lightSequence:[Int] = [Int]()){
        self.init()
        var size = size
        
        if size > 8 {
            size = 7
        }
        if size < 2{
            size = 2
        }
        self.size = size
        lights = Array(repeating: Array(repeating: Light(), count: size), count: size)
        start(lightSequence)
    }
    func start(_ lightSequence:[Int] ) {
        currenStatus = .during
        updateLishtStatus(lightSequence)
    }
    
    func circleWidth() -> CGFloat {
        guard let size = size else {
            return 0
        }
        let padding:CGFloat = 20
        let innerSpacing:CGFloat = 20
        
        var circleWidth = (UIScreen.main.bounds.width - padding - (CGFloat(size)*innerSpacing))/CGFloat(size)
        
        if circleWidth > UIScreen.main.bounds.width/5 {
            circleWidth = UIScreen.main.bounds.width/5
        }
        return circleWidth
        
    }
    
    private func updateLishtStatus(_ lightSequence:[Int] ){
        guard let size = size else {
            return
        }
        for lightIndex in lightSequence {
            var row = lightIndex/size
            let colum = lightIndex%size
            
            if colum > 0 && row >= 0{
                row += 1
            }
            updateLightStatus(row: row-1, colum: colum-1)
            
        }
        
    }
    
    
    /// 通过坐标索引修改灯状态
    /// - Parameters:
    ///   - column: 灯-列索引
    ///   - size: 灯-行索引
    func updateLightStatus(row: Int, colum:Int) {
        lights[row][colum].status.toggle()
        //up
        let top = row - 1
        if !(top < 0) {
            lights[top][colum].status.toggle()
        }
        //down
        let bottom = row + 1
        if !(bottom > lights.count-1) {
            lights[bottom][colum].status.toggle()
        }
        //left
        let left = colum - 1
        if !(left < 0) {
            lights[row][left].status.toggle()
        }
        //right
        let right = colum + 1
        if !(right > lights[row].count-1) {
            lights[row][right].status.toggle()
        }
        updateGameStatus()
    }
    private func updateGameStatus(){
        guard let size = size else {
            return
        }
        var lightingCount = 0
        for lightArr in lights {
            for light in lightArr {
                if light.status{
                    lightingCount += 1
                }
            }
        }
        if lightingCount == size*size {
            currenStatus = .lose
            return
        }
        if lightingCount == 0 {
            currenStatus = .win
            return
        }
        
    }
}
extension GameManager{
    enum GameStatus {
        case win
        
        case lose
        
        case during
    }
    
}
