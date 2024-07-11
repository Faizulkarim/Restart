//
//  CircleGroupView.swift
//  Restart
//
//  Created by Md Faizul karim on 11/7/24.
//

import SwiftUI

struct CircleGroupView: View {
    
    @State var shapeColor: Color
    @State var shapeOpactity : Double
    @State var isAnimating = false
    var body: some View {
        ZStack {
            Circle()
                .stroke(shapeColor.opacity(shapeOpactity),lineWidth: 40)
                .frame(width: 260, height: 260, alignment: .center)
            
            Circle()
                .stroke(shapeColor.opacity(shapeOpactity), lineWidth: 80)
                .frame(width: 260, height: 260, alignment: .center)
            
        }
        .blur(radius: isAnimating ? 0 : 10)
        .opacity(isAnimating ? 1 : 0)
        .scaleEffect(isAnimating ? 1 : 0.5)
        .animation(.easeIn(duration: 1), value: isAnimating)
        .onAppear(perform: {
            isAnimating = true
        })
    }
}

#Preview {
    ZStack {
        Color("ColorBlue")
            .ignoresSafeArea()
        CircleGroupView(shapeColor: .white, shapeOpactity: 0.2)
    }
}
