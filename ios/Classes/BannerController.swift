import UIKit
import AppLovinSDK

class BannerAdController: UIViewController, MAAdViewAdDelegate, MAAdRevenueDelegate
{
    private var adView: MAAdView? = nil
    

    var type: String?
    
    func initBannerAdController(unitId: String, sizeType: String)
    {
        adView = MAAdView(adUnitIdentifier: unitId)
        type = sizeType
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
       
        //let height: CGFloat =  types[type!]!.adaptiveSize.height
        //let width: CGFloat =  types[type!]!.size.width
       
        if let adView = adView {
            adView.delegate = self
            adView.revenueDelegate = self
            if type == "BANNER" || type == "LEADER" {
                adView.translatesAutoresizingMaskIntoConstraints = false
                view.addSubview(adView)
                adView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true;
                adView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true;
                adView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true;
                adView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true;
                adView.heightAnchor.constraint(equalToConstant: (UIDevice.current.userInterfaceIdiom == .pad) ? 90 : 50).isActive = true
            }
           
           

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
