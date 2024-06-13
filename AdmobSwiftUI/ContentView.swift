//
//  ContentView.swift
//  AdmobSwiftUI
//
//  Created by Nguyễn Linh on 13/06/2024.
//

import GoogleMobileAds
import SwiftUI

struct ContentView: View {
  
    var body: some View {
        ZStack {
            Color.purple.ignoresSafeArea(.all)
            
            ScrollView {
              VStack(spacing: 20) {
                  NativeAdViewSmall()
                  NativeAdViewMedium()
                  NativeAdViewLarge()
              }
            }
        }
    }
  }

#Preview {
    ContentView()
}
