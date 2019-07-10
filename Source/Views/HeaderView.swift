import UIKit

protocol HeaderViewDelegate: class {
    func headerView(_ headerView: HeaderView, didPressDeleteButton deleteButton: UIButton)
    func headerView(_ headerView: HeaderView, didPressCloseButton closeButton: UIButton)
    func headerView(_ headerView: HeaderView, didPressEditButton editButton: UIButton)
}

open class HeaderView: UIView {
    open fileprivate(set) lazy var closeButton: UIButton = { [unowned self] in
        let title = NSAttributedString(
            string: LightboxConfig.CloseButton.text,
            attributes: LightboxConfig.CloseButton.textAttributes)
        
        let button = UIButton(type: .system)
        
        button.setAttributedTitle(title, for: UIControl.State())
        
        if let size = LightboxConfig.CloseButton.size {
            button.frame.size = size
        } else {
            button.sizeToFit()
        }
        
        button.addTarget(self, action: #selector(closeButtonDidPress(_:)),
                         for: .touchUpInside)
        
        if let image = LightboxConfig.CloseButton.image {
            button.setBackgroundImage(image, for: UIControl.State())
        }
        
        button.isHidden = !LightboxConfig.CloseButton.enabled
        
        return button
        }()
    
    open fileprivate(set) lazy var deleteButton: UIButton = { [unowned self] in
        let title = NSAttributedString(
            string: LightboxConfig.DeleteButton.text,
            attributes: LightboxConfig.DeleteButton.textAttributes)

        let button = UIButton(type: .system)

        button.setAttributedTitle(title, for: .normal)

        if let size = LightboxConfig.DeleteButton.size {
            button.frame.size = size
        } else {
            button.sizeToFit()
        }

        button.addTarget(self, action: #selector(deleteButtonDidPress(_:)),
                         for: .touchUpInside)

        if let image = LightboxConfig.DeleteButton.image {
            button.setBackgroundImage(image, for: UIControl.State())
        }

        button.isHidden = !LightboxConfig.DeleteButton.enabled

        return button
        }()
    
    open fileprivate(set) lazy var editButton: UIButton = { [unowned self] in
        let title = NSAttributedString(
            string: LightboxConfig.EditButton.text,
            attributes: LightboxConfig.EditButton.textAttributes)
        
        let button = UIButton(type: .system)
        
        button.setAttributedTitle(title, for: UIControl.State())
        
        if let size = LightboxConfig.EditButton.size {
            button.frame.size = size
        } else {
            button.sizeToFit()
        }
        
        button.addTarget(self, action: #selector(editButtonDidPress(_:)),
                         for: .touchUpInside)
        
        if let image = LightboxConfig.EditButton.image {
            button.setBackgroundImage(image, for: UIControl.State())
        }
        
        button.isHidden = !LightboxConfig.EditButton.enabled
        
        return button
        }()
    
    weak var delegate: HeaderViewDelegate?
    
    // MARK: - Initializers
    
    public init() {
        super.init(frame: CGRect.zero)
        
        backgroundColor = UIColor.clear
        
        [closeButton, deleteButton, editButton].forEach { addSubview($0) }
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Actions
    
    @objc func deleteButtonDidPress(_ button: UIButton) {
        delegate?.headerView(self, didPressDeleteButton: button)
    }
    
    @objc func closeButtonDidPress(_ button: UIButton) {
        delegate?.headerView(self, didPressCloseButton: button)
    }
    
    @objc func editButtonDidPress(_ button: UIButton) {
        delegate?.headerView(self, didPressEditButton: button)
    }
}

// MARK: - LayoutConfigurable

extension HeaderView: LayoutConfigurable {
    
    @objc public func configureLayout() {
        let topPadding: CGFloat
        
        if #available(iOS 11, *) {
            topPadding = safeAreaInsets.top
        } else {
            topPadding = 0
        }
        
        closeButton.frame.origin = CGPoint(
            x: bounds.width - closeButton.frame.width - 17,
            y: topPadding
        )
        
        deleteButton.frame.origin = CGPoint(
            x: 17,
            y: topPadding
        )
        
        editButton.frame.origin = CGPoint(
            x: deleteButton.frame.width + 30,
            y: topPadding
        )
    }
}
