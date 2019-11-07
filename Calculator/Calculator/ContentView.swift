//
//  ContentView.swift
//  Calculator
//
//  Created by USER on 2019/10/25.
//  Copyright © 2019 USER. All rights reserved.
//

import SwiftUI

struct ContentView: View{
    //画面サイズ
    static let screenSize = UIScreen.main.bounds.size
    //計算
    @ObservedObject var model = DataModel()
    //let screenHight = mainBoundSize.height
    //let screenWidth = mainBoundSize.width

    var body: some View {
        VStack{
            VStack{
                Text(model.actionRecord).foregroundColor(Color.white)
                    .frame(width: ContentView.screenSize.width, height: 100, alignment: .center)
                    .background(Color.black).position(x:  ContentView.screenSize.width/2, y: 50)
                
                Text(model.resultLabel).bold().font(.system(size: 60)).foregroundColor(Color.white)
                    .frame(width: ContentView.screenSize.width, height: 100, alignment: .center)
                    .background(Color.black).position(x:  ContentView.screenSize.width/2, y: 50)
                
            }
            HStack {
                Button(action: {
                    // action
                    self.model.clear()
                }) {
                    Text("AC").tag("AC").font(.system(size: 50)).frame(width:ContentView.screenSize.width/4.5, height: ContentView.screenSize.height/8).foregroundColor(Color.white) .background(Color.red)
                }
                Button(action: {
                    // action
                    self.model.negative()
                }) {
                    Text("±").tag("±").font(.system(size: 50)).frame(width:ContentView.screenSize.width/4.5, height: ContentView.screenSize.height/8).foregroundColor(Color.white) .background(Color.gray)
                }
                Button(action: {
                    // action
                    self.model.percentage()
                }) {
                    Text("%").tag("%").font(.system(size: 50)).frame(width:ContentView.screenSize.width/4.5, height: ContentView.screenSize.height/8).foregroundColor(Color.white) .background(Color.gray)
                }
                Button(action: {
                    // action
                    self.model.divided()
                }) {
                    Text("÷").tag("÷").font(.system(size: 50)).frame(width:ContentView.screenSize.width/4.5, height: ContentView.screenSize.height/8).foregroundColor(Color.white) .background(Color.orange)
                }
            }
            HStack {
                Button(action: {
                    self.model.numbers(7)
                    // action
                }) {
                    Text("7").tag(7).font(.system(size: 50)).frame(width:ContentView.screenSize.width/4.5, height: ContentView.screenSize.height/8).foregroundColor(Color.white) .background(Color.red)
                }
                Button(action: {
                    // action
                     self.model.numbers(8)
                }) {
                    Text("8").tag(8).font(.system(size: 50)).frame(width:ContentView.screenSize.width/4.5, height: ContentView.screenSize.height/8).foregroundColor(Color.white) .background(Color.gray)
                }
                Button(action: {
                    // action
                     self.model.numbers(9)
                }) {
                    Text("9").tag(9).font(.system(size: 50)).frame(width:ContentView.screenSize.width/4.5, height: ContentView.screenSize.height/8).foregroundColor(Color.white) .background(Color.gray)
                }
                Button(action: {
                    // action
                     self.model.times()
                }) {
                    Text("*").tag("*").font(.system(size: 50)).frame(width:ContentView.screenSize.width/4.5, height: ContentView.screenSize.height/8).foregroundColor(Color.white) .background(Color.orange)
                }
            }
            HStack {
                Button(action: {
                    // action
                    self.model.numbers(4)
                }) {
                    Text("4").tag(4).font(.system(size: 50)).frame(width:ContentView.screenSize.width/4.5, height: ContentView.screenSize.height/8).foregroundColor(Color.white) .background(Color.red)
                }
                Button(action: {
                    // action
                    self.model.numbers(5)
                }) {
                    Text("5").tag(5).font(.system(size: 50)).frame(width:ContentView.screenSize.width/4.5, height: ContentView.screenSize.height/8).foregroundColor(Color.white) .background(Color.gray)
                }
                Button(action: {
                    // action
                     self.model.numbers(6)
                }) {
                    Text("6").tag(6).font(.system(size: 50)).frame(width:ContentView.screenSize.width/4.5, height: ContentView.screenSize.height/8).foregroundColor(Color.white) .background(Color.gray)
                }
                Button(action: {
                    // action
                      self.model.minus()
                }) {
                    Text("-").tag("-").font(.system(size: 50)).frame(width:ContentView.screenSize.width/4.5, height: ContentView.screenSize.height/8).foregroundColor(Color.white) .background(Color.orange)
                }
            }
            HStack {
                Button(action: {
                    // action
                    self.model.numbers(1)
                }) {
                    Text("1").tag(1).font(.system(size: 50)).frame(width:ContentView.screenSize.width/4.5, height: ContentView.screenSize.height/8).foregroundColor(Color.white) .background(Color.red)
                }
                Button(action: {
                    // action
                     self.model.numbers(2)
                }) {
                    Text("2").tag(2).font(.system(size: 50)).frame(width:ContentView.screenSize.width/4.5, height: ContentView.screenSize.height/8).foregroundColor(Color.white) .background(Color.gray)
                }
                Button(action: {
                    // action
                    self.model.numbers(3)
                }) {
                    Text("3").tag(3).font(.system(size: 50)).frame(width:ContentView.screenSize.width/4.5, height: ContentView.screenSize.height/8).foregroundColor(Color.white) .background(Color.gray)
                }
                Button(action: {
                    // action
                     self.model.plus()
                }) {
                    Text("+").tag("+").font(.system(size: 50)).frame(width:ContentView.screenSize.width/4.5, height: ContentView.screenSize.height/8).foregroundColor(Color.white) .background(Color.orange)
                }
            }
            
            HStack {
                Button(action: {
                    // action
                    self.model.numbers(0)
                }) {
                    Text("0").tag(0).font(.system(size: 50)).frame(width:ContentView.screenSize.width/4.5, height: ContentView.screenSize.height/8).foregroundColor(Color.white) .background(Color.red)
                }
                Button(action: {
                    // action
                      self.model.decimal()
                }) {
                    Text(".").tag(".").font(.system(size: 50)).frame(width:ContentView.screenSize.width/4.5, height: ContentView.screenSize.height/8).foregroundColor(Color.white) .background(Color.gray)
                }
                Button(action: {
                    // action
                     self.model.deleteKey()
                }) {
                    Text("▶︎").tag("▶︎").font(.system(size: 50)).frame(width:ContentView.screenSize.width/4.5, height: ContentView.screenSize.height/8).foregroundColor(Color.white) .background(Color.gray)
                }
                Button(action: {
                    // action
                     self.model.equals()
                }) {
                    Text("=").tag("=").font(.system(size: 50)).frame(width:ContentView.screenSize.width/4.5, height: ContentView.screenSize.height/8).foregroundColor(Color.white) .background(Color.orange)
                }
            }
        }.background(Color.black)
        
    }
}

//struct barVie:View{
//    @ObservedObject var model = DataModel()
//    var body: some View{
//        VStack{
//            Text(model.actionRecord).foregroundColor(Color.white)
//                .frame(width: ContentView.screenSize.width, height: 100, alignment: .center)
//                .background(Color.black).position(x:  ContentView.screenSize.width/2, y: 50)
//
//            Text(model.resultLabel).foregroundColor(Color.white)
//                .frame(width: ContentView.screenSize.width, height: 100, alignment: .center)
//                .background(Color.black).position(x:  ContentView.screenSize.width/2, y: 50)
//
//        }
//    }
//}
//struct stackViwe1:View {
//    @ObservedObject var model = DataModel()
//    var body: some View{
//        HStack {
//            Button(action: {
//                // action
//                self.model.clear()
//            }) {
//                Text("AC").tag("AC").font(.system(size: 50)).frame(width:ContentView.screenSize.width/4.5, height: ContentView.screenSize.height/8).foregroundColor(Color.white) .background(Color.red)
//            }
//            Button(action: {
//                // action
//                self.model.negative()
//            }) {
//                Text("±").tag("±").font(.system(size: 50)).frame(width:ContentView.screenSize.width/4.5, height: ContentView.screenSize.height/8).foregroundColor(Color.white) .background(Color.gray)
//            }
//            Button(action: {
//                // action
//                self.model.percentage()
//            }) {
//                Text("%").tag("%").font(.system(size: 50)).frame(width:ContentView.screenSize.width/4.5, height: ContentView.screenSize.height/8).foregroundColor(Color.white) .background(Color.gray)
//            }
//            Button(action: {
//                // action
//                self.model.divided()
//            }) {
//                Text("÷").tag("÷").font(.system(size: 50)).frame(width:ContentView.screenSize.width/4.5, height: ContentView.screenSize.height/8).foregroundColor(Color.white) .background(Color.orange)
//            }
//        }
//    }
//}
//struct stackViwe2:View {
//    @ObservedObject var model = DataModel()
//    var body: some View{
//        HStack {
//            Button(action: {
//                self.model.numbers(7)
//                // action
//            }) {
//                Text("7").tag(7).font(.system(size: 50)).frame(width:ContentView.screenSize.width/4.5, height: ContentView.screenSize.height/8).foregroundColor(Color.white) .background(Color.red)
//            }
//            Button(action: {
//                // action
//            }) {
//                Text("8").tag(8).font(.system(size: 50)).frame(width:ContentView.screenSize.width/4.5, height: ContentView.screenSize.height/8).foregroundColor(Color.white) .background(Color.gray)
//            }
//            Button(action: {
//                // action
//            }) {
//                Text("9").tag(9).font(.system(size: 50)).frame(width:ContentView.screenSize.width/4.5, height: ContentView.screenSize.height/8).foregroundColor(Color.white) .background(Color.gray)
//            }
//            Button(action: {
//                // action
//            }) {
//                Text("*").tag("*").font(.system(size: 50)).frame(width:ContentView.screenSize.width/4.5, height: ContentView.screenSize.height/8).foregroundColor(Color.white) .background(Color.orange)
//            }
//        }
//    }
//}
//struct stackViwe3:View {
//    var body: some View{
//        HStack {
//            Button(action: {
//                // action
//            }) {
//                Text("4").tag(4).font(.system(size: 50)).frame(width:ContentView.screenSize.width/4.5, height: ContentView.screenSize.height/8).foregroundColor(Color.white) .background(Color.red)
//            }
//            Button(action: {
//                // action
//            }) {
//                Text("5").tag(5).font(.system(size: 50)).frame(width:ContentView.screenSize.width/4.5, height: ContentView.screenSize.height/8).foregroundColor(Color.white) .background(Color.gray)
//            }
//            Button(action: {
//                // action
//            }) {
//                Text("6").tag(6).font(.system(size: 50)).frame(width:ContentView.screenSize.width/4.5, height: ContentView.screenSize.height/8).foregroundColor(Color.white) .background(Color.gray)
//            }
//            Button(action: {
//                // action
//            }) {
//                Text("-").tag("-").font(.system(size: 50)).frame(width:ContentView.screenSize.width/4.5, height: ContentView.screenSize.height/8).foregroundColor(Color.white) .background(Color.orange)
//            }
//        }
//    }
//}
//struct stackViwe4:View {
//    var body: some View{
//        HStack {
//            Button(action: {
//                // action
//            }) {
//                Text("1").tag(1).font(.system(size: 50)).frame(width:ContentView.screenSize.width/4.5, height: ContentView.screenSize.height/8).foregroundColor(Color.white) .background(Color.red)
//            }
//            Button(action: {
//                // action
//            }) {
//                Text("2").tag(2).font(.system(size: 50)).frame(width:ContentView.screenSize.width/4.5, height: ContentView.screenSize.height/8).foregroundColor(Color.white) .background(Color.gray)
//            }
//            Button(action: {
//                // action
//            }) {
//                Text("3").tag(3).font(.system(size: 50)).frame(width:ContentView.screenSize.width/4.5, height: ContentView.screenSize.height/8).foregroundColor(Color.white) .background(Color.gray)
//            }
//            Button(action: {
//                // action
//            }) {
//                Text("+").tag("+").font(.system(size: 50)).frame(width:ContentView.screenSize.width/4.5, height: ContentView.screenSize.height/8).foregroundColor(Color.white) .background(Color.orange)
//            }
//        }
//    }
//}
//struct stackViwe5:View {
//    var body: some View{
//        HStack {
//            Button(action: {
//                // action
//            }) {
//                Text("0").tag(0).font(.system(size: 50)).frame(width:ContentView.screenSize.width/4.5, height: ContentView.screenSize.height/7).foregroundColor(Color.white) .background(Color.red)
//            }
//            Button(action: {
//                // action
//            }) {
//                Text(".").tag(".").font(.system(size: 50)).frame(width:ContentView.screenSize.width/4.5, height: ContentView.screenSize.height/7).foregroundColor(Color.white) .background(Color.gray)
//            }
//            Button(action: {
//                // action
//            }) {
//                Text("▶︎").tag("▶︎").font(.system(size: 50)).frame(width:ContentView.screenSize.width/4.5, height: ContentView.screenSize.height/7).foregroundColor(Color.white) .background(Color.gray)
//            }
//            Button(action: {
//                // action
//            }) {
//                Text("=").tag("="
//                ).font(.system(size: 50)).frame(width:ContentView.screenSize.width/4.5, height: ContentView.screenSize.height/7).foregroundColor(Color.white) .background(Color.orange)
//            }
//        }
//    }
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
