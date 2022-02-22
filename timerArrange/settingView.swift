//
//  settingView.swift
//  timerArrange
//
//  Created by かんべみさき on 2022/02/20.
//

import SwiftUI


struct settingView: View {
    @AppStorage ("timer_value") var timerValue = 60
    
    
    
    var body: some View {
        ZStack{
            Image("topImage")
                .resizable()
                .ignoresSafeArea()
                .opacity(0.8)
            
            VStack{
                Spacer()
                
                Text("\(timerValue/60)分")
                
                
                    .font(.largeTitle)
                    .padding(.top, -60.0)
                
                
                
                Spacer()
                
                Picker(selection:$timerValue){
                    
                    Text("10分（時間ないけどちょっと仮眠）")
                        .tag(600)
                    
                    
                    Text("15分（スッキリ起きられるよ！）")
                        .tag(900)
                    
                    Text("30分（優雅なお昼寝タイム）")
                        .tag(1800)
                    Text("60分（脳の認知機能向上）")
                        .tag(3600)
                    
                    
                }label:{
                    Text("選択")
                        
                    
                }
                .pickerStyle(.wheel)
                
            }
        }
    }
}

struct settingView_Previews: PreviewProvider {
    static var previews: some View {
        settingView()
    }
}
