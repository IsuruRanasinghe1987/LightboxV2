import UIKit

open class LightboxImage {

  open fileprivate(set) var image: UIImage?
  open fileprivate(set) var imageURL: URL?
  open fileprivate(set) var videoURL: URL?
  open fileprivate(set) var imageClosure: (() -> UIImage)?
 open fileprivate(set) var indexPath: IndexPath?
  open var text: String

  // MARK: - Initialization

  internal init(text: String = "") {
    self.text = text
  }

  public init(image: UIImage, text: String = "", videoURL: URL? = nil, indexPath: IndexPath? = nil) {
    self.image = image
    self.text = text
    self.videoURL = videoURL
    self.indexPath = indexPath
  }

  public init(imageURL: URL, text: String = "", videoURL: URL? = nil, indexPath: IndexPath? = nil) {
    self.imageURL = imageURL
    self.text = text
    self.videoURL = videoURL
    self.indexPath = indexPath
  }

  public init(imageClosure: @escaping () -> UIImage, text: String = "", videoURL: URL? = nil, indexPath: IndexPath? = nil) {
    self.imageClosure = imageClosure
    self.text = text
    self.videoURL = videoURL
    self.indexPath = indexPath
  }

  open func addImageTo(_ imageView: UIImageView, completion: ((UIImage?) -> Void)? = nil) {
    if let image = image {
      imageView.image = image
      completion?(image)
    } else if let imageURL = imageURL {
        LightboxConfig.loadImage(url: imageURL, imageView: imageView, completion: completion)
    } else if let imageClosure = imageClosure {
      let img = imageClosure()
      imageView.image = img
      completion?(img)
    } else {
      imageView.image = nil
      completion?(nil)
    }
  }
}
