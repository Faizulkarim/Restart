//
//  GetStartedSlideButtonView.swift
//  Restart
//
//  Created by Md Faizul karim on 12/7/24.
//

import SwiftUI

struct GetStartedSlideButtonView: View {
    
    @State private var buttonWidht: Double = (UIScreen.current?.bounds.width)! - 80
    @State private var buttonOffset: CGFloat = 0
    @State var isAnimating : Bool = false
    let hapticFeedBack = UINotificationFeedbackGenerator()
    
    var body: some View {
        ZStack {
            Capsule()
                .fill(.white.opacity(0.2))
            
            Capsule()
                .fill(.white.opacity(0.2))
                .padding(8)
            
            Text("Get Started")
                .font(.system(.title3, design: .rounded))
                .fontWeight(.bold)
                .foregroundColor(.white)
                .offset(x: 20)
            
            HStack {
                Capsule()
                    .fill(Color.customRed)
                    .frame(width: buttonOffset + 80)
                Spacer()
            }
            HStack {
                ZStack {
                    Circle()
                        .fill(Color.customRed)
                    
                    Circle()
                        .fill(.black.opacity(0.15))
                        .padding()
                    
                    Image(systemName: "chevron.right.2")
                        .font(.system(size: 24, weight: .bold))
                }
                .frame(width: 80, height: 80, alignment: .center)
                .foregroundStyle(.white)
                .offset(x: buttonOffset)
                .gesture(
                    DragGesture()
                        .onChanged({ gester in
                            if gester.translation.width > 0 && (buttonOffset <= buttonWidht - 80){
                                buttonOffset = gester.translation.width
                            }
                            
                        })
                        .onEnded({ _ in
                            
                            if buttonOffset > (buttonWidht / 2) + 50 {
                                hapticFeedBack.notificationOccurred(.success)
                                AudioPlayer.shared.playSound(sound: Constants.chimeupSound)
                                buttonOffset = buttonWidht - 80
                            }else {
                                hapticFeedBack.notificationOccurred(.warning)
                                buttonOffset = 0
                            }
                        })
                    
                )
                Spacer()
            }
            
        }
        .frame(width: buttonWidht, height: 80, alignment: .center)
        .padding()
        .opacity(isAnimating ? 1 : 0)
        .offset(y: isAnimating ? 0 : 40)
        .animation(.easeOut(duration: 1), value: isAnimating)
        .onAppear(perform: {
            isAnimating = true
            
        })
    }
}

#Preview {
    ZStack {
        Color("ColorBlue")
            .ignoresSafeArea()
        GetStartedSlideButtonView()
    }
}
