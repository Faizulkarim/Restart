//
//  Home.swift
//  Restart
//
//  Created by Md Faizul karim on 11/7/24.
//

import SwiftUI

struct HomeView: View {
    
    // MARK: PROPERTIES
    @AppStorage("onboarding") var isOnboaringViewActive = true
    
    var body: some View {
        ZStack {
            if isOnboaringViewActive {
                OnboardingView()
            }else {
                RestartView()
            }
        }
        .animation(.easeOut(duration: 0.5), value: isOnboaringViewActive)
    }
}

#Preview {
    HomeView()
}
