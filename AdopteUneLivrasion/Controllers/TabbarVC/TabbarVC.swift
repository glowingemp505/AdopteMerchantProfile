//
//  SigninVC.swift
//  AdopteUneLivrasion
//
//  Created by Sameer Amjad on 15/06/2023.
//

//

import UIKit
import SFSymbols

class TabbarVC: UITabBarController,UITabBarControllerDelegate,UINavigationControllerDelegate{

    //Designer
    let accVC = UIStoryboard.storyBoard(withName: .main).loadViewController(withIdentifier: .AccountVC) as! AccountVC
    let Merchant = UIStoryboard.storyBoard(withName: .main).loadViewController(withIdentifier: .MerchantVC) as! MerchantVC
    let Orders = UIStoryboard.storyBoard(withName: .main).loadViewController(withIdentifier: .OrdersVC) as! OrdersVC
    let Menu = UIStoryboard.storyBoard(withName: .main).loadViewController(withIdentifier: .MenuVC) as! MenuVC
    let Home = UIStoryboard.storyBoard(withName: .main).loadViewController(withIdentifier: .HomeVC) as! HomeVC


    init() {
        // perform some initialization here
        super.init(nibName: nil, bundle: nil)

        //  tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)



        /********************* For home Tab *********************/

//        homeVc.tabBarItem = UITabBarItem(title: "Home", image: UIImage(symbol: SFSymbol.house), selectedImage: UIImage(named: "home_clr")!.withRenderingMode(.alwaysTemplate))
        accVC.tabBarItem = UITabBarItem(title: "Account", image: UIImage(named: "ph_user")!.withRenderingMode(.alwaysTemplate), selectedImage: UIImage(named: "ph_user"))
        accVC.tabBarItem.tag = 0
        let accUI = UINavigationController(rootViewController: accVC)

        /********************** For nasae Tab *********************************/

        Merchant.tabBarItem = UITabBarItem(title: "Merchant", image: UIImage(named: "iconoir_home-alt")!.withRenderingMode(.alwaysTemplate), selectedImage: UIImage(named: "iconoir_home-alt"))
        Merchant.tabBarItem.tag = 1
        let merchnatUI = UINavigationController(rootViewController: Merchant)

//        /********************* For tawasal Tab *********************/
//
        Orders.tabBarItem = UITabBarItem(title: "Orders", image: UIImage(named: "material-symbols_shopping-bag-outline-sharp")!.withRenderingMode(.alwaysTemplate), selectedImage: UIImage(named: "material-symbols_shopping-bag-outline-sharp"))
        Orders.tabBarItem.tag = 1
        let ordersUI = UINavigationController(rootViewController: Orders)
//
//        /********************* For maqalaat Tab *********************/
//
        Menu.tabBarItem = UITabBarItem(title: "Menu", image: UIImage(named: "tabler_book-2"), selectedImage: UIImage(named: "tabler_book-2"))
        Menu.tabBarItem.tag = 2
        let menuUI = UINavigationController(rootViewController: Menu)
//        ///////////////////////////
//        ///
        Home.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "ri_home-4-line")!.withRenderingMode(.alwaysTemplate), selectedImage: UIImage(named: "ri_home-4-line"))
        Home.tabBarItem.tag = 3
                let HomeUI = UINavigationController(rootViewController: Home)
//        /////////////////////
//        ///
//        settingVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "settings")!.withRenderingMode(.alwaysTemplate), selectedImage: UIImage(named: "settings"))
//        settingVC.tabBarItem.tag = 4
//        let settingUINav = UINavigationController(rootViewController: settingVC)

        viewControllers = [HomeUI,ordersUI,menuUI,merchnatUI,accUI]

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()


        // Do any additional setup after loading the view.
        self.delegate = self
        self.tabBar.isTranslucent = true

        self.tabBar.barTintColor = UIColor(hexString: "#FFFFFF")
        self.tabBar.tintColor = UIColor(hexString: "#009FE7")


        tabBar.backgroundColor = UIColor(hexString: "#FFFFFF")
        self.tabBar.unselectedItemTintColor = UIColor(hexString: "#000000")

//        UITabBar.appearance().shadowImage = UIImage()
//        UITabBar.appearance().backgroundImage = UIImage()
        UITabBar.appearance().clipsToBounds = true
//        self.removeTabbarItemsText()
        //        UITabBarItem.appearance().setTitleTextAttributes([NSFontAttributeName: UIFont(name: "Roboto-Regular", size: 12)!], for: .normal)
    }



    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    private func findSelectedTagForTabBarController(tabBarController: UITabBarController?) {

        if let tabBarController = tabBarController {
            if let viewControllers = tabBarController.viewControllers {
                let selectedIndex = tabBarController.selectedIndex
                let selectedController: UIViewController? = viewControllers.count > selectedIndex ? viewControllers[selectedIndex] : nil
                if let tag = selectedController?.tabBarItem.tag {
                    //here you can use your tag
                    print(tag)
                }
            }
        }
    }
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        //findSelectedTagForTabBarController(navigationController.tabBarController)
        print("print \(viewController)")


    }

}

extension UITabBarController {
  func removeTabbarItemsText() {
    tabBar.items?.forEach {
      $0.title = nil
      $0.imageInsets = UIEdgeInsets(top: 11, left: 0, bottom: -11, right: 0)
    }
  }
}

extension UIImage {
class func colorForNavBar(color: UIColor) -> UIImage {

    let rect = CGRect(origin: CGPoint(x: 0,y :0), size: CGSize(width: 1.0, height: 1.0))

    UIGraphicsBeginImageContext(rect.size)
    let context = UIGraphicsGetCurrentContext()

    context!.setFillColor(color.cgColor)
    context!.fill(rect)

    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()


     return image!
    }
}
