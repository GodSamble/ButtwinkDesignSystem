//
//  File.swift
//  
//
//  Created by 고영민 on 11/22/24.
//

import UIKit
import SnapKit

public final class WINavigationBar: UIView {
    public let leftButton = UIButton(type: .system)
    public let rightButton = UIButton(type: .system)
    private let titleLabel = UILabel()
    private var bottomSeparatorView = UIView()
    
    public var title: String? {
        didSet { titleLabel.setText(title, attributes: Const.titleAttributes) }
    }
    
    public var leftBarItem: BarItem? {
        didSet { leftButton.setImage(leftBarItem?.icon, for: .normal) }
    }
    
    public var rightBarItem: BarItem? {
        didSet { rightButton.setImage(rightBarItem?.icon, for: .normal) }
    }
    
    public var hideBottomSeperatorView: Bool = true {
        didSet { bottomSeparatorView.isHidden = hideBottomSeperatorView }
    }
    
    public override var intrinsicContentSize: CGSize {
        CGSize(width: UIScreen.main.bounds.width, height: Const.navigationBarHeight)
    }
    
    public init(leftBarItem: BarItem? = nil, rightBarItem: BarItem? = nil, title: String? = nil) {
        self.leftBarItem = leftBarItem
        self.rightBarItem = rightBarItem
        self.title = title
        super.init(frame: .zero)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension WINavigationBar {
    private func setUI() {
        self.backgroundColor = .bdink_gray_dark
        bottomSeparatorView.backgroundColor = .buttwink_gray0
        bottomSeparatorView.isHidden = true
        leftButton.setImage(leftBarItem?.icon, for: .normal)
        leftButton.tintColor = .buttwink_gray0
        rightButton.setImage(rightBarItem?.icon, for: .normal)
        rightButton.tintColor = .buttwink_gray0
        titleLabel.setText(title, attributes: Const.titleAttributes)
    }
    
    private func setLayout() {
        addSubview(leftButton)
        leftButton.snp.makeConstraints {
            $0.leading.centerY.equalToSuperview()
            $0.width.equalTo(48)
            $0.height.equalTo(Const.navigationBarHeight)
        }
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        addSubview(rightButton)
        rightButton.snp.makeConstraints {
            $0.trailing.centerY.equalToSuperview()
            $0.width.equalTo(48)
            $0.height.equalTo(Const.navigationBarHeight)
        }
        addSubview(bottomSeparatorView)
        bottomSeparatorView.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalTo(1)
        }
    }
}

private extension WINavigationBar.Const {
    static let titleAttributes = Typography.Attributes(
        style: .headLine4,
        weight: .bold,
        textColor: .buttwink_gray0
    )
}

extension WINavigationBar {
    public enum BarItem {
        case back
        case close
        case setting
        
        var icon: UIImage? {
            switch self {
            case .back: return .Btn.back?.resizing(width: 20, height: 20)
            case .close: return .Btn.close?.resizing(width: 24, height: 24)
            case .setting: return .Btn.setting
            }
        }
    }
}
