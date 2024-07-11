//
//  Home.swift
//  Restart
//
//  Created by Md Faizul karim on 11/7/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            Color.customBlue
                .ignoresSafeArea(.all, edges: .all)
            
            VStack(spacing: 20) {
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
        
            }
        }
    }
}

#Preview {
    HomeView()
}
