//
//  NativeAdViewModel.swift
//  AdmobSwiftUI
//
//  Created by Nguyễn Linh on 13/06/2024.
//

import GoogleMobileAds

enum AdState {
    case error
    case loading
    case loaded
}

class NativeAdViewModel: NSObject, ObservableObject, GADNativeAdLoaderDelegate {
  @Published var nativeAd: GADNativeAd?
  @Published var adState: AdState = .loading
    
  private var adLoader: GADAdLoader!

    func refreshAd(admobId: String) {
    adState = .loading
    adLoader = GADAdLoader(
      adUnitID: admobId,
      rootViewController: nil,
      adTypes: [.native], options: nil)
    adLoader.delegate = self
    adLoader.load(GADRequest())
  }

  func adLoader(_ adLoader: GADAdLoader, didReceive nativeAd: GADNativeAd) {
    self.nativeAd = nativeAd
    nativeAd.delegate = self
      adState = .loaded
  }

  func adLoader(_ adLoader: GADAdLoader, didFailToReceiveAdWithError error: Error) {
    print("\(adLoader) failed with error: \(error.localizedDescription)")
      adState = .error
  }
}

// MARK: - GADNativeAdDelegate implementation
extension NativeAdViewModel: GADNativeAdDelegate {
  func nativeAdDidRecordClick(_ nativeAd: GADNativeAd) {
    print("\(#function) called")
  }

  func nativeAdDidRecordImpression(_ nativeAd: GADNativeAd) {
    print("\(#function) called")
  }

  func nativeAdWillPresentScreen(_ nativeAd: GADNativeAd) {
    print("\(#function) called")
  }

  func nativeAdWillDismissScreen(_ nativeAd: GADNativeAd) {
    print("\(#function) called")
  }

  func nativeAdDidDismissScreen(_ nativeAd: GADNativeAd) {
    print("\(#function) called")
  }
}
