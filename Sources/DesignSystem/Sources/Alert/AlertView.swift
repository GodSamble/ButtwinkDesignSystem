//
//  CustomAlertView.swift
//  Buttwink
//
//  Created by 천성우 on 5/8/25.
//

import UIKit
import SnapKit

public final class AlertView: BaseView {
    
    // MARK: - UI Components

    private let containerView = UIView()
    private let titleLabel = UILabel()
    private let subTitleLabel = UILabel()
    private let submitButton = UIButton()
    let VolumeString = 0
    
    private var alertType: AlertType
    
    public enum AlertType {
        case recordRegister
        case report
        case fail
    }
    
    public init(frame: CGRect, alertType: AlertView.AlertType) {
        self.alertType = alertType
        super.init(frame: frame)
    }
    
    // MARK: - Set UIComponents
    
    public override func setStyles() {
        // 배경 블러 대신 반투명 검정
        backgroundColor = UIColor.black.withAlphaComponent(0.6)

        // 컨테이너 색상
        containerView.backgroundColor = UIColor(hex: "#2E2E2E")
        containerView.layer.cornerRadius = 20

        // 공통 타이틀 스타일
        titleLabel.font = .systemFont(ofSize: 18, weight: .bold)
        subTitleLabel.font = .systemFont(ofSize: 12, weight: .medium)
        subTitleLabel.numberOfLines = 0
        subTitleLabel.textAlignment = .center

        submitButton.layer.cornerRadius = 10
        submitButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)

        switch alertType {
            
        case .recordRegister:
            titleLabel.text = "기록이 저장됐습니다!"
            titleLabel.textColor = UIColor(hex: "#FFFFFF")

            subTitleLabel.text = "오늘 기록으로 \(VolumeString)kg 볼륨이 저장됐어요!\n대단한걸요!"
            subTitleLabel.textColor = UIColor(hex: "#A8A8A8")

            submitButton.setTitle("닫기", for: .normal)
            submitButton.setTitleColor(.black, for: .normal)
            submitButton.backgroundColor = UIColor(hex: "#82F80E")
            
        case .report:
            titleLabel.text = "신고가 접수되었습니다"
            titleLabel.textColor = UIColor(hex: "#FFFFFF")
            titleLabel.font = .systemFont(ofSize: 18, weight: .bold)

            subTitleLabel.text = "신고가 접수되어 조치될 예정입니다 감사합니다"
            subTitleLabel.textColor = UIColor(hex: "#FFFFFF")
            subTitleLabel.font = .systemFont(ofSize: 12, weight: .medium)
            
            submitButton.setTitle("닫기", for: .normal)
            submitButton.setTitleColor(UIColor(hex: "#FFFFFF"), for: .normal)
            submitButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
            submitButton.backgroundColor = UIColor(hex: "#83AC66")
            submitButton.layer.cornerRadius = 3

        case .fail:
            titleLabel.text = "결제 처리가 실패되었습니다."
            titleLabel.textColor = UIColor(hex: "#FFFFFF")
            titleLabel.font = .systemFont(ofSize: 18, weight: .bold)

            subTitleLabel.text = "다시 시도 바랍니다."
            subTitleLabel.textColor = UIColor(hex: "#FFFFFF")
            subTitleLabel.font = .systemFont(ofSize: 12, weight: .medium)
            
            submitButton.setTitle("닫기", for: .normal)
            submitButton.setTitleColor(UIColor(hex: "#FFFFFF"), for: .normal)
            submitButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
            submitButton.backgroundColor = UIColor(hex: "#83AC66")
            submitButton.layer.cornerRadius = 3
        }
    }

    
    // MARK: - Layout Helper
    
    public override func setLayout() {
        addSubview(containerView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(subTitleLabel)
        containerView.addSubview(submitButton)
        
        containerView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.height.equalTo(UIScreen.main.bounds.height * 177 / 812)
            $0.width.equalTo(UIScreen.main.bounds.width * 280 / 375)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(42)
            $0.centerX.equalToSuperview()
        }
        
        subTitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(17)
            $0.centerX.equalToSuperview()
        }
        
        submitButton.snp.makeConstraints {
            $0.top.equalTo(subTitleLabel.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(UIScreen.main.bounds.height * 37 / 812)
            $0.width.equalTo(UIScreen.main.bounds.width * 242 / 375)
        }
    }
    
    // MARK: - Methods
    
    public func getSubmitButton() -> UIButton {
        return submitButton
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
