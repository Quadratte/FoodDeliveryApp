
import UIKit

class OnboardingCoordinator: Coordinator {
    override func start() {
        let vc = ViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func finish() {
        print("Onboarding coordinator finish")
    }
}
