import UIKit
import AppLovinSDK

class BannerAdController: UIViewController, MAAdViewAdDelegate, MAAdRevenueDelegate
{
    private var adView: MAAdView? = nil
    
    var types = [
        "BANNER" : MAAdFormat.banner,
        "LEADER" :  MAAdFormat.leader,
        "MREC" : MAAdFormat.mrec
    ]
    var type: String?
    
    func initBannerAdController(unitId: String, sizeType: String)
    {
        adView = MAAdView(adUnitIdentifier: unitId)
        type = sizeType
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
       
        let height: CGFloat =  types[type!]!.adaptiveSize.height
        let width: CGFloat = UIScreen.main.bounds.width
        
        if let adView = adView {
            adView.delegate = self
            adView.revenueDelegate = self
            adView.frame = CGRect(x: 0, y: 0, width: width, height: height)
            view.addSubview(adView)
            
            adView.loadAd()
        }
    }
    
    // MARK: MAAdDelegate Protocol
    
    func didLoad(_ ad: MAAd) {
    }
    
    func didFailToLoadAd(forAdUnitIdentifier adUnitIdentifier: String, withError error: MAError) {}

    func didDisplay(_ ad: MAAd) {
    }
    
    func didHide(_ ad: MAAd) {  }
    
    func didClick(_ ad: MAAd) {
        globalMethodChannel?.invokeMethod("AdClicked", arguments: nil)
    }
    
    func didFail(toDisplay ad: MAAd, withError error: MAError) {  }
        
    // MARK: MAAdViewAdDelegate Protocol
    
    func didExpand(_ ad: MAAd) {  }
    
    func didCollapse(_ ad: MAAd) {  }
    
    // MARK: MAAdRevenueDelegate Protocol
    
    func didPayRevenue(for ad: MAAd) {  }
}
