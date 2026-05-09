import UIKit

extension UIFont {
    enum Roboto {
        enum Regular {
            static func size(of size: CGFloat) -> UIFont {
                return UIFont(name: Constants.Roboto.regular, size: size) ?? UIFont.systemFont(ofSize: 16, weight: .regular)
            }
        }
    }
}

private extension UIFont {
    enum Constants {
        enum Roboto {
            static let regular = "Roboto-Regular"
        }
    }
}
