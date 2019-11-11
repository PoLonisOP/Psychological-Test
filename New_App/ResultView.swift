//
//  ResultView.swift
//  New_App
//
//  Created by User16 on 2019/11/10.
//  Copyright © 2019 00657018. All rights reserved.
//

import SwiftUI

struct TestOutcome {
    var result: String
    var presentation: String
}

let RTs = [
TestOutcome(result: "愛美型", presentation: "你喜歡將自己打點乾淨後，一身香噴噴的、舒舒服服地鑽進被窩，睡個舒適的覺，並認為這是一天中完美的句點。這樣子的你傾向追求浪漫、美麗的愛情，而你的愛情故事大都相當具戲劇效果。行事作風非常地獨來獨往，看似較不合群，不適合團體生活，甚至朋友間出遊，也喜歡挑單人房，一個人睡。至於像露營之類的活動，因為有時不能洗澡，所以幾乎從不參加。此外，由於天生具有美感，因此對美的事物有相當大的期望。"),
TestOutcome(result: "叛逆反骨", presentation: "你具有藝術家的自傲性格，叛逆味道極重。最好收斂點你的自以為是。"),
TestOutcome(result: "人海茫茫", presentation: "你是個標準的現代人，你討厭孤單、害怕寂寞，感情脆弱的可以，一般而言你缺乏沖勁。"),
TestOutcome(result: "自我中心", presentation: "你有些憤世嫉俗，所以你對於與他人之間的禮貌往來，及社交活動，都顯得不耐煩和排斥。"),
TestOutcome(result: "藍色海天", presentation: "你是個典型的實行家，善於參與你喜愛的活動而且確實采取行動，執行能力強，但不善於發號施令，要小心因參加太多活動而忽略了生活品質，使自己所愛的人離去。"),
TestOutcome(result: "黃色虛榮", presentation: "你喜歡過富麗堂皇的生活，註重面子，講究排場，由於你的努力上進，成功與勝利的祝賀經常縈繞耳邊，你對人生充滿期待，采取樂觀進去的態度。做事有魄力，能獨當一面，只是缺乏規劃能力，應當多聽聽幕僚的意見。"),
TestOutcome(result: "黑色幽默", presentation: "你的思考條理分明，非常具理性，樂於為人服務。有許多理想和夢想沒有實現。你現在想認真完成一些工作來彌補未完成的夢想，有認真工作接受命運安排的性格。"),
TestOutcome(result: "貪癡鬼", presentation: "見錢眼開的你，不管是什麼事，通通向錢看齊！請你幫忙買便當，沒問題，跑腿費五十元；想多買瓶飲料，當然行，再加五十，管對方是天王天后或是小兵小將，一律不二價，要是有人想殺價，你只會揮揮衣袖，說聲sorry。\n在你眼中，找不到比錢更重要的事；愛情，那算什麼東西，不能吃不能喝，還不能買東西。人千萬不能鐵齒，就因為你越不相信，這事越會發生在你身上，所以你總是陷入一見鍾情的深淵裡。可惜啊！行事作風一向俐落的你，竟會栽到愛情的手裡，對方就是深知這點，才會對你呼來喚去；但你完全不以為苦，心甘情願做牛做馬，覺得這是甜蜜的表現。\n在與情人相處之中，你永遠是個小男人〈小女人〉，平日超有主見的你，會變得低聲下氣，超級不像自己，完全以對方的意見為意見，把對方的意見奉為聖旨。若想喚回真正的你，只要談到錢，你馬上就會恢復精打細算的本性，計較到不行！九十九元的火鍋，結帳後要是少找你一元，你就會氣得立刻打給消保官，絕對沒有商量的餘地。\n愛看「海綿寶寶」的卡通，最喜歡的角色是蟹老闆，因為他視錢如命的個性和你超像，簡直可以結拜當好朋友。"),
TestOutcome(result: "即時行樂型", presentation: "你著重於滿足慾望，而且骨子裡有種浪漫基調，所以行事不喜事先規劃，但你的目標又很高，甚至幾近完美而難以達成，還有在做事的態度上，還算腳踏實地，而不會好高鶩遠。或許稍微改變事到臨頭再做決定的習慣，會使所訂的目標更有可能達成。")]

struct ResultView: View {
    @Binding var showResultPage: Bool
    @Binding var RainCar: Bool
    @Binding var isYes: Bool
    @Binding var name: String
    @Binding var scale: CGFloat
    @Binding var selectedFood: String
    @Binding var table: Int
    @Binding var ideal_spouse:String
    @Binding var birthday: Date
    @Binding var answer: Int
    var Result: TestOutcome
    var body: some View {
        VStack {
            Button("Try it again") {
                self.showResultPage = false
            }
            Image(RTs[answer].result)
                .resizable()
                .scaledToFill()
                .frame(width: 90, height: 70)
                .clipped()
            Text(RTs[answer].result)
                .font(Font.custom("Noteworthy Bold", size: 30))
                .fontWeight(.semibold)
                .foregroundColor(Color.orange)
                .background(Color.black)
                .cornerRadius(40)
                .multilineTextAlignment(.center)
                .frame(width:170, height:60)
                .padding(EdgeInsets(top: 0, leading: 80, bottom: 0, trailing: 10))
            HStack {
                Image(systemName: "arrowshape.turn.up.right")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .opacity(0.8)
                    .shadow(radius: 20)
                Text(RTs[answer].presentation)
                    .font(.headline)
                    .fontWeight(.regular)
                    .frame(width: 200, height: 60)
                    .padding(.leading, 10)
            }
            .background(Color.yellow)
            .cornerRadius(30)
            .multilineTextAlignment(.center)
            .padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 10))
            Spacer()
        }
        .background(
            Image("back")
                .resizable()
                .scaledToFill()
                .opacity(0.3))
        .clipped()
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(showResultPage: .constant(true), RainCar: .constant(false), isYes: .constant(false), name: .constant(""), scale: .constant(1), selectedFood: .constant(""), table: .constant(15), ideal_spouse: .constant(""), birthday: .constant(Date()), answer: .constant(0), Result: RTs[0])
    }
}
