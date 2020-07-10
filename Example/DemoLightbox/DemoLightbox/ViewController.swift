import UIKit
import LightboxV2

class ViewController: UIViewController {
  
  lazy var showButton: UIButton = { [unowned self] in
    let button = UIButton()
    button.addTarget(self, action: #selector(showLightbox), for: .touchUpInside)
    button.setTitle("Show me the lightbox", for: UIControl.State())
    button.setTitleColor(UIColor(red:0.47, green:0.6, blue:0.13, alpha:1), for: UIControl.State())
    button.titleLabel?.font = UIFont(name: "AvenirNextCondensed-DemiBold", size: 30)
    button.frame = UIScreen.main.bounds
    button.autoresizingMask = [.flexibleTopMargin, .flexibleLeftMargin, .flexibleRightMargin, .flexibleBottomMargin]
    
    return button
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()

    view.autoresizingMask = [.flexibleTopMargin, .flexibleLeftMargin, .flexibleRightMargin, .flexibleBottomMargin]
    view.backgroundColor = UIColor.white
    view.addSubview(showButton)
  }
  
  // MARK: - Action methods
  
  @objc func showLightbox() {
    let images = [
      LightboxImage(imageURL: URL(string: "https://cdn.pixabay.com/photo/2015/05/15/14/47/computer-768696_960_720.jpg")!),
      LightboxImage(imageURL: URL(string: "https://cdn.pixabay.com/photo/2020/07/05/22/04/young-hare-5374708_960_720.jpg")!),
      LightboxImage(imageURL: URL(string: "https://cdn.pixabay.com/photo/2020/07/04/06/40/clouds-5368435_960_720.jpg")!)
    ]
    
    LightboxConfig.DeleteButton.enabled = true
    LightboxConfig.EditButton.enabled = true
    
    let controller = LightboxController(images: images)
    controller.dynamicBackground = true
    controller.actionDelegate = self
    controller.modalPresentationStyle = .fullScreen
    present(controller, animated: true, completion: nil)
  }
}

extension ViewController:LightboxControllerActionDelegate{
    func lightboxController(_ controller: LightboxController, didEdit image: LightboxImage, at index: Int) {
        
    }
    
    func lightboxController(_ controller: LightboxController, didDelete image: LightboxImage, at index: Int) {
        if let imageUrl = image.imageURL{
            debugPrint(imageUrl.absoluteString)
        }else if let videoURL = image.videoURL{
            debugPrint(videoURL.absoluteString)
        }else{
            debugPrint("No url found")
        }
    }
    
    
}
