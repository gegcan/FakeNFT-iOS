import UIKit

final class TabBarController: UITabBarController {

    let servicesAssembly = ServicesAssembly(
        networkClient: DefaultNetworkClient(),
        nftStorage: NftStorageImpl()
    )

    private let profileTabBarItem = UITabBarItem(
        title: NSLocalizedString("Tab.profile", comment: ""),
        image: Statistics.SfSymbols.iconProfile,
        tag: 0
    )
    
    private let catalogTabBarItem = UITabBarItem(
        title: NSLocalizedString("Tab.catalog", comment: ""),
        image: Statistics.SfSymbols.iconCatalog,
        tag: 1
    )
    
    private let cartTabBarItem = UITabBarItem(
        title: NSLocalizedString("Tab.cart", comment: ""),
        image: Statistics.SfSymbols.iconCart,
        tag: 2
    )
    
    private let statisticsTabBarItem = UITabBarItem(
        title: Statistics.Labels.tabBarStatistics,
        image: Statistics.SfSymbols.iconStatistics,
        tag: 3
    )

    override func viewDidLoad() {
        super.viewDidLoad()
        // mock data
        let profileController = TestCatalogViewController(servicesAssembly: servicesAssembly)
        let catalogController = TestCatalogViewController(servicesAssembly: servicesAssembly)
        let cartController = TestCatalogViewController(servicesAssembly: servicesAssembly)
        
        let statisticsController = StatisticsViewController(
            servicesAssembly: servicesAssembly,
            service: servicesAssembly.usersService
        )
        
        let navStatisticsController = UINavigationController(rootViewController: statisticsController)

        profileController.tabBarItem = profileTabBarItem
        catalogController.tabBarItem = catalogTabBarItem
        cartController.tabBarItem = cartTabBarItem
        statisticsController.tabBarItem = statisticsTabBarItem

        viewControllers = [
            profileController,
            catalogController,
            cartController,
            navStatisticsController
        ]
        selectedIndex = 3

        let appearance = tabBar.standardAppearance
        appearance.configureWithDefaultBackground()
        appearance.shadowImage = nil
        appearance.shadowColor = nil
        appearance.backgroundColor = .ypWhiteDay
        appearance.stackedLayoutAppearance.normal.titleTextAttributes =
            [NSAttributedString.Key.foregroundColor: UIColor.ypBlackDay as Any]
        appearance.stackedLayoutAppearance.normal.iconColor = .ypBlackDay
        tabBar.standardAppearance = appearance

        view.backgroundColor = .ypWhiteDay
    }
}
