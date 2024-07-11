//
//  OnboardingView.swift
//  Restart
//
//  Created by Md Faizul karim on 11/7/24.
//

import SwiftUI

struct OnboardingView: View {
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
                
                ZStack {
                    CircleGroupView(shapeColor: .white, shapeOpactity: 0.2)
                }
            }
        }
    }
}

#Preview {
    OnboardingView()
}
