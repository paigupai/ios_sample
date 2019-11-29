//
//  ContentView.swift
//  TurnOffTheLight
//
//  Created by USER on 2019/11/29.
//  Copyright © 2019 USER. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var gameManager = GameManager()
    init() {
        gameManager = GameManager(size: 5, lightSequence: [1,2,3])
    }
    
    private let innerSpacing = 30
    
    var body: some View {
        
        ForEach(0..<gameManager.lights.count){  rowIndex in
            HStack(spacing: 20){
                ForEach(0..<self.gameManager.lights[rowIndex].count){ columnIndex in
                    Circle()
                        .foregroundColor(self.gameManager.lights[rowIndex][columnIndex].status ? .yellow:.gray)
                        .opacity(self.gameManager.lights[rowIndex][columnIndex].status ? 0.8 : 0.5)
                        .frame(width: self.gameManager.circleWidth(), height: self.gameManager.circleWidth())
                        .shadow(color: .yellow,radius: self.gameManager.lights[rowIndex][columnIndex].status ? 10:0)
                        .onTapGesture {
                            self.gameManager.updateLightStatus(row: rowIndex, colum: columnIndex)
                    }
                }
                
            }
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 30, trailing: 0))
            
        }.alert(isPresented: $gameManager.isWin){
            Alert(title: Text("摸鱼成功"),
                  dismissButton: .default(Text("继续"),action:{
                    self.gameManager.start([3,2,1])
                  }
                )
            )
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
