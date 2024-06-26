//
//  NativeAdView.swift
//  AdmobSwiftUI
//
//  Created by Nguyễn Linh on 13/06/2024.
//

import GoogleMobileAds
import SwiftUI

struct NativeAdView: UIViewRepresentable {
  typealias UIViewType = GADNativeAdView

  @ObservedObject var nativeViewModel: NativeAdViewModel
  var admobNibName: String

  func makeUIView(context: Context) -> GADNativeAdView {
    return
      Bundle.main.loadNibNamed(
        admobNibName,
        owner: nil,
        options: nil)?.first as! GADNativeAdView
  }

  func updateUIView(_ nativeAdView: GADNativeAdView, context: Context) {
    guard let nativeAd = nativeViewModel.nativeAd else { return }

    (nativeAdView.headlineView as? UILabel)?.text = nativeAd.headline

    nativeAdView.mediaView?.mediaContent = nativeAd.mediaContent

    (nativeAdView.bodyView as? UILabel)?.text = nativeAd.body

    (nativeAdView.iconView as? UIImageView)?.image = nativeAd.icon?.image

    (nativeAdView.starRatingView as? UIImageView)?.image = imageOfStars(from: nativeAd.starRating)

    (nativeAdView.storeView as? UILabel)?.text = nativeAd.store

    (nativeAdView.priceView as? UILabel)?.text = nativeAd.price

    (nativeAdView.advertiserView as? UILabel)?.text = nativeAd.advertiser

    (nativeAdView.callToActionView as? UIButton)?.setTitle(nativeAd.callToAction, for: .normal)

    // In order for the SDK to process touch events properly, user interaction should be disabled.
    nativeAdView.callToActionView?.isUserInteractionEnabled = false

    // Associate the native ad view with the native ad object. This is required to make the ad clickable.
    // Note: this should always be done after populating the ad views.
    nativeAdView.nativeAd = nativeAd
      
  }

  private func imageOfStars(from starRating: NSDecimalNumber?) -> UIImage? {
    guard let rating = starRating?.doubleValue else {
      return nil
    }
    if rating >= 5 {
      return UIImage(named: "stars_5")
    } else if rating >= 4.5 {
      return UIImage(named: "stars_4_5")
    } else if rating >= 4 {
      return UIImage(named: "stars_4")
    } else if rating >= 3.5 {
      return UIImage(named: "stars_3_5")
    } else {
      return nil
    }
  }
}
