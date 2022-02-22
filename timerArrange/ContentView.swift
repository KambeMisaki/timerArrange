//
//  ContentView.swift
//  timerArrange
//
//  Created by かんべみさき on 2022/02/20.
//

import SwiftUI

struct ContentView: View {
    @State var timerHandler : Timer?
    
    @State var count = 0
    @AppStorage ("timer_value") var timerValue = 10
    
    //初期：キー(timer_value)はuserdefaultesから読み取る値がないから初期値10
    //秒数設定：キーはuserdefaultesへ値を更新
    // アプリ再起動：キーはuserdefaultesから値を読み込み取得しセット
    
    @State var showAlert = false
    //アラート表示の有無
    
    let soundPlayer = SoundPlayer()
    
    
    
    
    var body: some View {
        NavigationView{
            ZStack{
                Color("settingColor")
                
                    .ignoresSafeArea()
                    
                VStack{
                    Text("Comfortable Sleep!!")
                    
                        .font(.title)
                    
                    
                    
                    ZStack{
                        
                        Circle()
                            .fill(.white)
                            .frame(width:260)
                        Text("残り\((timerValue - count)/60)分")
                            .font(.largeTitle)
                            
                        
                            
                        
                    }
                    .padding(.bottom)
                    HStack{
                        Button(action:{
                            if let unwrapedTimerHander = timerHandler {
                            
                                if unwrapedTimerHander.isValid == true {
                                    unwrapedTimerHander.invalidate()
                                    
                                }
                            }
                        }) {
                            
                            ZStack{
                            Circle()
                                    .fill(.white)
                                .frame(width:150)
                            Rectangle()
                                    .fill(.black)
                                    .frame(width:40,height:40)
                            }
                         Spacer()
                        }
                        .padding(.leading)
                        Button(action:{
                            startTimer()
                        }) {
                            ZStack{
                            Circle()
                                    .fill(.white)
                                .frame(width:150)
                            Image("start")
                                    .resizable()
                                    .frame(width:120,height: 90)
                                
                                
                                    
                            }
                            
                        }
                        .padding(.trailing)
                    }
                   
                    
                    
                }
                .onAppear{
                    count = 0
                    
                }
                
        
            
        }
            .toolbar{
                ToolbarItem(placement:.navigationBarTrailing){
                    NavigationLink(destination:settingView()){
                        Text("設定")
                        
                    }
                    
                }
            }
            .alert( isPresented: $showAlert){
                Alert(title: Text("終了"), message: Text("残り半日頑張りましょう！"),
                      dismissButton:.default(Text("OK")))
                
            }
        }
    
        .navigationViewStyle(StackNavigationViewStyle())
}
    func countDownTimer(){
        count  += 1
        
        if timerValue - count <= 0 {
            timerHandler?.invalidate()
            
            showAlert = true
            
                
                    soundPlayer.getUpPlay()
                    
                
            
            
            
        }
    }
    
    func startTimer(){
        if let unwrapedTimerHandler = timerHandler{
            if unwrapedTimerHandler.isValid == true{
                return
            }
        }
        if timerValue - count <= 0{
            count = 0
    }
        timerHandler = Timer.scheduledTimer(withTimeInterval: 1, repeats: true){ _ in
            
          countDownTimer()
            
            
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
}
