//
//  OnboardingView.swift
//  Restart
//
//  Created by Md Faizul karim on 11/7/24.
//

import SwiftUI

struct OnboardingView: View {
    
    @State private var isAnimating = false
    @State private var imageOffset =  CGSize.zero
    @State private var buttonWidht: Double = (UIScreen.current?.bounds.width)! - 80
    @State private var buttonOffset: CGFloat = 0
    @State private var indicatorOpactiy = 1.0
    let hapticFeedBack = UINotificationFeedbackGenerator()
    
    var body: some View {
        ZStack {
            Color.customBlue
                .ignoresSafeArea(.all, edges: .all)
            
            VStack(spacing: 20) {
                // MARK: HEADER
                Spacer()
                
                VStack {
                    Text("Share")
                        .font(.system(size: 60))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .transition(.opacity)
                    Text("It's not how much we give but \n how much love we put into giving.")
                        .font(.title3)
                        .multilineTextAlignment(.center)
                        .fontWeight(.light)
                        .foregroundColor(.white)
                }
                
                // MARK: CENTER
                
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
                
                // MARK: FOOTER
                
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
                
            }
        }.onAppear(perform: {
            isAnimating = true
        })
        .preferredColorScheme(.dark)
    }
}

#Preview {
    OnboardingView()
}
