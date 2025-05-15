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
    private let titleLabel = UILabel()
    private let subTitleLabel = UILabel()
    private let submitButton = UIButton()
    private let specialButton = UIButton()
    
    private var alertType: AlertType_Two_Option
    
    public enum AlertType_Two_Option {
        case refund
        case logout
        case withDraw
    }
    
    public init(frame: CGRect, alertType: AlertView_TwoOption.AlertType_Two_Option) {
        self.alertType = alertType
        super.init(frame: frame)
    }
    
    // MARK: - Set UIComponents
    
    public override func setStyles() {
        backgroundColor = UIColor.black.withAlphaComponent(0.6)

        containerView.backgroundColor = UIColor(hex: "#3E3E3E")
        containerView.layer.cornerRadius = 20
        
        switch alertType {
        case .refund:
            titleLabel.text = "환불 하시겠습니까?"
            titleLabel.textColor = UIColor(hex: "#FFFFFF")
            titleLabel.font = .systemFont(ofSize: 18, weight: .bold)
            
            subTitleLabel.text = "환불을 진행하시겠어요?"
            subTitleLabel.textColor = UIColor(hex: "#808080")
            subTitleLabel.font = .systemFont(ofSize: 12, weight: .medium)

            specialButton.setTitle("환불하기", for: .normal)
            specialButton.setTitleColor(UIColor(hex: "#758595"), for: .normal)
            specialButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
            specialButton.backgroundColor = UIColor(hex: "#E0E5EB")
            specialButton.layer.cornerRadius = 3

        case .logout:
            titleLabel.text = "로그아웃 하시겠어요?"
            titleLabel.textColor = UIColor(hex: "#FFFFFF")
            titleLabel.font = .systemFont(ofSize: 18, weight: .bold)
            
            subTitleLabel.text = "버딩크 로그아웃 하시겠어요?"
            subTitleLabel.textColor = UIColor(hex: "#808080")
            subTitleLabel.font = .systemFont(ofSize: 12, weight: .medium)

            specialButton.setTitle("로그아웃", for: .normal)
            specialButton.setTitleColor(UIColor(hex: "#758595"), for: .normal)
            specialButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
            specialButton.backgroundColor = UIColor(hex: "#E0E5EB")
            specialButton.layer.cornerRadius = 3
            
        case .withDraw:
            titleLabel.text = "회원탈퇴 하시겠어요?"
            titleLabel.textColor = UIColor(hex: "#FFFFFF")
            titleLabel.font = .systemFont(ofSize: 18, weight: .bold)
            
            subTitleLabel.text = "버딩크 회원탈퇴 하시겠어요?"
            subTitleLabel.textColor = UIColor(hex: "#808080")
            subTitleLabel.font = .systemFont(ofSize: 12, weight: .medium)

            specialButton.setTitle("회원탈퇴", for: .normal)
            specialButton.setTitleColor(UIColor(hex: "#758595"), for: .normal)
            specialButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
            specialButton.backgroundColor = UIColor(hex: "#E0E5EB")
            specialButton.layer.cornerRadius = 3
        }
        
        submitButton.setTitle("닫기", for: .normal)
        submitButton.setTitleColor(UIColor(hex: "#FFFFFF"), for: .normal)
        submitButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        submitButton.backgroundColor = UIColor(hex: "#83AC66")
        submitButton.layer.cornerRadius = 3
    }
    
    // MARK: - Layout Helper
    
    public override func setLayout() {
        addSubview(containerView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(subTitleLabel)
        containerView.addSubview(specialButton)
        containerView.addSubview(submitButton)
        
        containerView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.height.equalTo(UIScreen.main.bounds.height * 235 / 812)
            $0.width.equalTo(UIScreen.main.bounds.width * 280 / 375)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(42)
            $0.centerX.equalToSuperview()
        }
        
        subTitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(9)
            $0.centerX.equalToSuperview()
        }
        
        specialButton.snp.makeConstraints {
            $0.top.equalTo(subTitleLabel.snp.bottom).offset(36)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(UIScreen.main.bounds.height * 37 / 812)
            $0.width.equalTo(UIScreen.main.bounds.width * 242 / 375)
        }
        
        submitButton.snp.makeConstraints {
            $0.top.equalTo(specialButton.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(UIScreen.main.bounds.height * 37 / 812)
            $0.width.equalTo(UIScreen.main.bounds.width * 242 / 375)
        }
    }
    
    // MARK: - Methods
    
    public func getSubmitButton() -> UIButton {
        return submitButton
    }
    
    public func getSpecialButton() -> UIButton {
        return specialButton
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
