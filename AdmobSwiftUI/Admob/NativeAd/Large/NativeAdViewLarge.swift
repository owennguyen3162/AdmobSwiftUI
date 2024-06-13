//
//  NativeAdViewLarge.swift
//  AdmobSwiftUI
//
//  Created by Nguyễn Linh on 13/06/2024.
//

import SwiftUI

struct NativeAdViewLarge: View {
    @StateObject private var nativeViewModel = NativeAdViewModel()
    var body: some View {
        ZStack {
            switch nativeViewModel.adState {
            case .error:
                Text("Ad error")
            case .loading:
                Text("Ad loading")
            case .loaded:
                NativeAdView(nativeViewModel: nativeViewModel, admobNibName: "NativeAdViewLarge")
                  .frame(height: 216)
            }
        }.onAppear {
            initAd()
        }
    }
    
    private func initAd() {
        nativeViewModel.refreshAd(admobId: "ca-app-pub-3940256099942544/3986624511")
    }
    
}
#Preview {
    NativeAdViewLarge()
}
