import UIKit

final class TabBarController: UITabBarController {

    let servicesAssembly = ServicesAssembly(
        networkClient: DefaultNetworkClient(),
        nftStorage: NftStorageImpl()
    )

    private let profileTabBarItem = UITabBarItem(
        title: NSLocalizedString("Tab.profile", comment: ""),
        image: UIImage(systemName: "person.circle.fill"),
        tag: 0
    )
    private let catalogTabBarItem = UITabBarItem(
        title: NSLocalizedString("Tab.catalog", comment: ""),
        image: UIImage(systemName: "square.stack.3d.up.fill"),
        tag: 1
    )
    private let cartTabBarItem = UITabBarItem(
        title: NSLocalizedString("Tab.cart", comment: ""),
        image: UIImage(systemName: "bag.fill"),
        tag: 2
    )
    private let statisticsTabBarItem = UITabBarItem(
        title: NSLocalizedString("Tab.statistics", comment: ""),
        image: UIImage(systemName: "flag.2.crossed.fill"),
        tag: 3
    )

    override func viewDidLoad() {
        super.viewDidLoad()
        // mock data
        let profileController = TestCatalogViewController(servicesAssembly: servicesAssembly)
        let catalogController = TestCatalogViewController(servicesAssembly: servicesAssembly)
        let cartController = TestCatalogViewController(servicesAssembly: servicesAssembly)
        let statisticsController = StatisticsViewController(servicesAssembly: servicesAssembly)
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
        tabBar.isTranslucent = false
        tabBar.unselectedItemTintColor = .ypBlackDay

        let appearance = tabBar.standardAppearance
        appearance.configureWithOpaqueBackground()
        appearance.shadowImage = nil
        appearance.shadowColor = nil
        tabBar.standardAppearance = appearance

        view.backgroundColor = .systemBackground
    }
}
