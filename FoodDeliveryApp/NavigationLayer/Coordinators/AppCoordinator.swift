
import UIKit

class AppCoordinator: Coordinator {
    override func start() {
        showMainFlow()
    }
    
    override func finish() {
        print("App coordinator finish")
        //finishDelegate?.coordinatorDidFinish(childCoordinator: self)
    }
}

// MARK: - Navigation methods
private extension AppCoordinator {
    func showOnboardingFlow() {
        guard let navigationController = navigationController else { return }
        let onboardingCoordinator = OnboardingCoordinator(type: .app, navigationController: navigationController, finishDelegate: self)
        addChildCoordinator(onboardingCoordinator)
        onboardingCoordinator.start()
    }
    
    func showMainFlow() {
        guard let navigationController = navigationController else { return }
        
        let homeNavigationController = UINavigationController()
        let homeCoordinator = HomeCoordinator(type: .home, navigationController: homeNavigationController)
        homeNavigationController.tabBarItem = UITabBarItem.init(title: "Home", image: UIImage.init(systemName: ""), tag: 0)
        homeCoordinator.finishDelegate = self
        homeCoordinator.start()
        
        let orderNavigationController = UINavigationController()
        let orderCoordinator = OrderCoordinator(type: .order, navigationController: orderNavigationController)
        homeNavigationController.tabBarItem = UITabBarItem.init(title: "Order", image: UIImage.init(systemName: ""), tag: 1)
        orderCoordinator.finishDelegate = self
        orderCoordinator.start()
        
        let listNavigationController = UINavigationController()
        let listCoordinator = ListCoordinator(type: .list, navigationController: listNavigationController)
        homeNavigationController.tabBarItem = UITabBarItem.init(title: "List", image: UIImage.init(systemName: ""), tag: 2)
        listCoordinator.finishDelegate = self
        listCoordinator.start()
        
        let profileNavigationController = UINavigationController()
        let profileCoordinator = ProfileCoordinator(type: .order, navigationController: profileNavigationController)
        homeNavigationController.tabBarItem = UITabBarItem.init(title: "Profile", image: UIImage.init(systemName: ""), tag: 3)
        profileCoordinator.finishDelegate = self
        profileCoordinator.start()
        
        addChildCoordinator(homeCoordinator)
        addChildCoordinator(orderCoordinator)
        addChildCoordinator(listCoordinator)
        addChildCoordinator(profileCoordinator)
        
        let tabBarControllers = [homeNavigationController,
                                 orderNavigationController,
                                 listNavigationController,
                                 profileNavigationController]
        
        let tabBarController = TabBarController(tabBarControllers: tabBarControllers)
        
        navigationController.pushViewController(tabBarController, animated: true)
    }
    
}

extension AppCoordinator: CoordinatorFinishDelegate {
    func coordinatorDidFinish(childCoordinator: CoordinatorProtocol) {
        removeChildCoordinator(childCoordinator)
        
        switch childCoordinator.type {
        case .app:
            return
        default:
            navigationController?.popToRootViewController(animated: false)
        }
    }
}
