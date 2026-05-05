
import UIKit

class AppCoordinator: Coordinator {
    override func start() {
        showOnboardingFlow()
    }
    
    override func finish() {
        print("App coordinator finish")
        //finishDelegate?.coordinatorDidFinish(childCoordinator: self)
    }
}

// MARK: - Navigation methods
private extension AppCoordinator {
    func showOnboardingFlow() {
       
    }
    
    func showMainFlow() {
        
    }
    
}
