//
//  File.swift
//  DesignSystem
//
//  Created by 고영민 on 5/14/25.
//

import UIKit
import SnapKit

public final class AlertView_TwoOption: BaseView {

    // MARK: - UI Components
    private let containerView = UIView()
    private let _titleLabel = UILabel()
    private let _subTitleLabel = UILabel()
    private let _submitButton = UIButton()
    private let _specialButton = UIButton()

    private var alertType: AlertType_Two_Option

    public enum AlertType_Two_Option {
        case refund
        case logout
        case withDraw
        case erase
    }

    public init(frame: CGRect, alertType: AlertView_TwoOption.AlertType_Two_Option) {
        self.alertType = alertType
        super.init(frame: frame)
    }

    // MARK: - Set UIComponents
    public override func setStyles() {
        backgroundColor = UIColor.black.withAlphaComponent(0.6)
        containerView.backgroundColor = UIColor(hex: "#202020")
        containerView.layer.cornerRadius = 20

        _titleLabel.font = .systemFont(ofSize: 18, weight: .bold)
        _subTitleLabel.font = .systemFont(ofSize: 12, weight: .medium)
        _subTitleLabel.textColor = UIColor(hex: "#808080")

        _submitButton.layer.cornerRadius = 3
        _submitButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        _submitButton.backgroundColor = UIColor(hex: "#E0E5EB")
        _submitButton.setTitle("닫기", for: .normal)
        _submitButton.setTitleColor(UIColor.black, for: .normal)

        _specialButton.layer.cornerRadius = 3
        _specialButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        _specialButton.setTitleColor(UIColor.black, for: .normal)
        _specialButton.backgroundColor = UIColor(hex: "#82F80E")

        switch alertType {
        case .refund:
            _titleLabel.text = "환불 하시겠습니까?"
            _subTitleLabel.text = "환불을 진행하시겠어요?"
            _specialButton.setTitle("환불하기", for: .normal)
        case .logout:
            _titleLabel.text = "로그아웃 하시겠어요?"
            _subTitleLabel.text = "버딩크 로그아웃 하시겠어요?"
            _specialButton.setTitle("로그아웃", for: .normal)
        case .withDraw:
            _titleLabel.text = "회원탈퇴 하시겠어요?"
            _subTitleLabel.text = "버딩크 회원탈퇴 하시겠어요?"
            _specialButton.setTitle("회원탈퇴", for: .normal)
        case .erase:
            _titleLabel.text = "이 세트를 지우시겠어요?"
            _subTitleLabel.text = "이 세트를 지우시겠어요?"
            _specialButton.setTitle("세트지우기", for: .normal)
        }
    }

    public override func setLayout() {
        addSubview(containerView)
        containerView.addSubview(_titleLabel)
        containerView.addSubview(_subTitleLabel)
        containerView.addSubview(_specialButton)
        containerView.addSubview(_submitButton)

        containerView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.height.equalTo(UIScreen.main.bounds.height * 235 / 812)
            $0.width.equalTo(UIScreen.main.bounds.width * 280 / 375)
        }

        _titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(42)
            $0.centerX.equalToSuperview()
        }

        _subTitleLabel.snp.makeConstraints {
            $0.top.equalTo(_titleLabel.snp.bottom).offset(9)
            $0.centerX.equalToSuperview()
        }

        _specialButton.snp.makeConstraints {
            $0.top.equalTo(_subTitleLabel.snp.bottom).offset(36)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(UIScreen.main.bounds.height * 37 / 812)
            $0.width.equalTo(UIScreen.main.bounds.width * 242 / 375)
        }

        _submitButton.snp.makeConstraints {
            $0.top.equalTo(_specialButton.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(UIScreen.main.bounds.height * 37 / 812)
            $0.width.equalTo(UIScreen.main.bounds.width * 242 / 375)
        }
    }

    // MARK: - Getter & Setter
    public var titleLabel: UILabel {
        get { _titleLabel }
        set { _titleLabel.text = newValue.text; _titleLabel.textColor = newValue.textColor }
    }

    public var subTitleLabel: UILabel {
        get { _subTitleLabel }
        set { _subTitleLabel.text = newValue.text; _subTitleLabel.textColor = newValue.textColor }
    }

    public var submitButton: UIButton { _submitButton }
    public var specialButton: UIButton { _specialButton }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
