//
//  CenterImageView.swift
//  Restart
//
//  Created by Md Faizul karim on 12/7/24.
//

import SwiftUI

struct CenterImageView: View {
    
    @State var isAnimating : Bool = false
    @State var imageOffset =  CGSize.zero
    @State var indicatorOpactiy = 1.0
    @Binding var textTitle: String
    
    var body: some View {
        ZStack {
            CircleGroupView(shapeColor: .white, shapeOpactity: 0.2)
                .offset(x: imageOffset.width * -1)
                .blur(radius: abs(imageOffset.width / 5))
                .animation(.easeOut(duration: 1), value: imageOffset)
            
            Image("character-1")
                .resizable()
                .scaledToFit()
                .opacity(isAnimating ? 1 : 0)
                .animation(.easeInOut(duration: 0.5), value: isAnimating)
                .offset(x: imageOffset.width * 1.2 , y: 0)
                .rotationEffect(.degrees(imageOffset.width / 20))
                .gesture(
                    DragGesture()
                        .onChanged({ gester in
                            if abs(imageOffset.width) <= 150 {
                                imageOffset = gester.translation
                                
                            }
                            
                            withAnimation(.linear(duration: 0.25)) {
                                indicatorOpactiy = 0
                                textTitle = "Give"
                            }
                            
                        })
                        .onEnded({ _ in
                            imageOffset = .zero
                            
                            withAnimation(.linear(duration: 0.25)) {
                                indicatorOpactiy = 1
                                textTitle = "Share."
                            }
                        })
                )
                .animation(.easeOut(duration: 1), value: imageOffset )
        }
        .overlay(
            Image(systemName: "arrow.left.and.right.circle")
                .font(.system(size: 42, weight: .ultraLight))
                .foregroundStyle(.white)
                .opacity(isAnimating ? 1 : 0)
                .animation(.easeOut(duration: 1).delay(2), value: isAnimating)
                .opacity(indicatorOpactiy)
            , alignment: .bottom
        )
        .onAppear(perform: {
            isAnimating = true
        })
    }
}

#Preview {
    ZStack {
        Color("ColorBlue")
            .ignoresSafeArea()
        CenterImageView(textTitle: .constant("Share"))
    }
}
