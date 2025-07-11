//
//  HomeView.swift
//  SwiftfulCrypto
//
//  Created by Paul Norris on 7/10/25.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            // background layer
            Color.theme.background
                .ignoresSafeArea()
            
            // content layer
            VStack {
                HStack {
                    CircleButtonView(iconName: "info")
                    Spacer()
                    Text("Header")
                    Spacer()
                    CircleButtonView(iconName: "chevron.right")
                }
                Spacer(minLength: 0)
            }
            
        }
    }
}

#Preview {
    NavigationView {
        HomeView()
            .navigationBarHidden(true)
    }
}
