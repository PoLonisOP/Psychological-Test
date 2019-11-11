//
//  ContentView.swift
//  New_App
//
//  Created by User16 on 2019/11/10.
//  Copyright © 2019 00657018. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var RainCar = false
    @State private var isYes = false
    @State private var name = ""
    @State private var scale: CGFloat = 130
    //    @State private var showAlert = false
    //    @State private var guessNumber = 0
    @State private var selectedFood = 0
    @State private var table = 1
    @State private var showResultPage = false
    @State private var ideal_spouse = "羅賓姊姊"
    @State private var showNameAlert = false
    @State private var birthday = Date()
    let dateFormatter: DateFormatter =
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        return dateFormatter
    }()
    var roles = ["炭治郎哥哥", "金木研弟弟", "羅賓姊姊", "吹雪妹妹", "艾爾文團長哥哥"]
    var foods = ["生雞蛋", "剝皮辣椒", "炸牛奶", "傑克的豆子"]
    var Result: TestOutcome
    @State private var answer = Int.random(in: 0...8)
    var body: some View {
        VStack {
            Form {
                Group {
                    Group {
                        GameNameNext()
                        Text("輸入你的名字：")
                        TextField("Your Name", text: $name)
                            .font(.largeTitle)
                            .overlay(RoundedRectangle(cornerRadius:20).stroke(Color.blue, lineWidth: 5))
                            .frame(width: 380, height: 50)
                            .multilineTextAlignment(.center)
                    }
                    Group {
                        Text("  Start！")
                            .font(Font.custom("Optima Extra Black", size: 30))
                            .foregroundColor(Color.white)
                            .background(Color.yellow)
                            .cornerRadius(40)
                            .padding(EdgeInsets(top: 0, leading: 140, bottom: 0, trailing: 10))
                        Text("第一題:")
                            .background(Color.purple)
                        Toggle("你可以選擇是否回答這題(否/是)?", isOn: $isYes)
                        if isYes{
                            Text("世界上只剩下這三個食物可以吃,你只能選一樣,下半輩子要吃哪一樣生活下去?")
                            Picker(selection: $selectedFood, label: Text("選擇食物")){
                                ForEach(foods, id: \.self){ (food) in
                                    Text(food)
                                }
                            }.pickerStyle(SegmentedPickerStyle())
                        }
                    }
                    Group {
                        Text("第二題:")
                            .background(Color.purple)
                        if RainCar {
                            VStack {
                                Image(systemName: "cloud.rain.fill")
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                    .padding(.leading, 20)
                                Text("下雨的聲音 想起你用唇語說愛情")
                            }
                        } else {
                            VStack {
                                Image(systemName: "car.fill")
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                    .padding(.leading, 20)
                                Text("作陣來軋車 作陣來軋車 不管伊警察底抓")
                            }
                        }
                        Toggle("直覺上,你走在路上最有可能看到的是?", isOn: $RainCar)
                    }
                }
                Text("第三題:")
                    .background(Color.purple)
                Text("現在你可以選一個成為你的兄弟姐妹,你會選誰?")
                Picker("Ur sibling", selection: $ideal_spouse) {
                    ForEach(0..<roles.count) { (index) in
                        Text(self.roles[index])
                    }
                }
                .pickerStyle(WheelPickerStyle())
                .frame(width: 200, height: 100)
                .clipped()
                Group {
                    Text("第四題:")
                        .background(Color.purple)
                    VStack {
                        Text("理想中的另一半身高是?")
                        HStack {
                            Image("person")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 50, height: 80)
                            Image("lady")
                                .scaleEffect(scale/130)
                        }
                        HStack {
                            Text("\(scale)公分")
                            Slider(value: $scale, in: 130...180, step: 1)
                        }
                    }
                }
                Group {
                    Text("第五題:")
                        .background(Color.purple)
                    Text("心中想像一個桌子,請問那是一個幾人桌?")
                    Stepper(value: $table, in: 1...20){
                        if table == 1 {Text("\(table) table only")}
                        else {Text("\(table) tables")}
                    }
                }
                Group {
                    Text("最後一題:")
                        .background(Color.purple)
                    Text("你認為哪一天是你遇到\"對的人\"的日子?")
                    DatePicker("Right moment to right person", selection: $birthday, displayedComponents: .date)
                }
                Button(action:
                    {
                        if self.name == ""
                        {
                            self.showNameAlert = true
                        }
                        else
                        {
                            self.showResultPage = true
                        }
                })
                {
                    Text("完成測驗!")
                        .font(Font.system(size: 40))
                        .fontWeight(.semibold)
                        .foregroundColor(Color.white)
                        .background(Color.yellow)
                        .cornerRadius(40)
                        .padding(.leading, 105)
                }
                .alert(isPresented: $showNameAlert)
                {
                    () -> Alert in
                    return Alert(title: Text("名字!!!"), message: Text("阿你不寫名字你要先講啊!"))
                }
                .sheet(isPresented: self.$showResultPage) {
                    ResultView(showResultPage: self.$showResultPage, RainCar: self.$RainCar, isYes: self.$isYes, name: self.$name, scale: self.$scale, selectedFood: self.$selectedFood, table: self.$table, ideal_spouse: self.$ideal_spouse, birthday: self.$birthday, answer: self.$answer, Result: RTs[0])
                }
            }
            //.frame(width:400, height: 300)
            //.clipped()
            .onAppear {
                UITableView.appearance().separatorColor = .clear
            }
        }
        .background(
            Image("back")
                .resizable()
                .scaledToFill()
                .opacity(0.3))
        .clipped()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(Result: RTs[0])
    }
}

struct GameNameNext: View
{
    var body: some View
    {
        Text("Psychological Test")
            .font(Font.custom("Noteworthy Bold", size: 20))
            .fontWeight(.heavy)
            .foregroundColor(Color.orange)
            .background(Color.black)
            .cornerRadius(30)
            .multilineTextAlignment(.center)
            .frame(width:200, height:60)
            .padding(EdgeInsets(top: 0, leading: 80, bottom: 0, trailing: 10))
    }
}
