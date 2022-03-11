//: A UIKit based Playground for presenting user interface

import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        
        let button: UIButton = UIButton(frame: CGRect(x: 0, y: 0, width: view.bounds.width - 40, height: 46))
        button.setTitle("Share", for: .normal)
        button.addTarget(self, action: #selector(openShareSheet), for: .touchUpInside)
        
        view.addSubview(button)
        self.view = view
    }
    
    @objc
    private func openShareSheet() {
        print("Pressed before")
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
