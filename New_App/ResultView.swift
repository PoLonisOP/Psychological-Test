//
//  ResultView.swift
//  New_App
//
//  Created by User16 on 2019/11/10.
//  Copyright © 2019 00657018. All rights reserved.
//

import SwiftUI

struct ResultView: View {
    @Binding var showResultPage: Bool
    var answer = Int.random(in: 0...100)
    var body: some View {
        VStack {
            Button("Try it again") {
                self.showResultPage = false
            }
            Spacer()
        }
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(showResultPage:.constant(true))
    }
}
