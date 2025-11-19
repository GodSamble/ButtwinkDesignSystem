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
    private let _titleLabel = UILabel()
    private let _subTitleLabel = UILabel()
    private let _submitButton = UIButton()
    public var volumeString = 0
    
    private var alertType: AlertType
    
    public enum AlertType {
        case recordRegister
        case report
        case fail
    }
    
    // MARK: - Init
    public init(frame: CGRect, alertType: AlertView.AlertType) {
        self.alertType = alertType
        super.init(frame: frame)
        setStyles()
        setLayout()
        setupActions()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Setup
    public override func setStyles() {
        backgroundColor = UIColor.black.withAlphaComponent(0.6)
        containerView.backgroundColor = UIColor(hex: "#2E2E2E")
        containerView.layer.cornerRadius = 20
        
        _titleLabel.font = .systemFont(ofSize: 18, weight: .bold)
        _titleLabel.textAlignment = .center
        _subTitleLabel.font = .systemFont(ofSize: 12, weight: .medium)
        _subTitleLabel.textAlignment = .center
        _subTitleLabel.numberOfLines = 0
        
        _submitButton.layer.cornerRadius = 10
        _submitButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        
        switch alertType {
        case .recordRegister:
            _titleLabel.text = "기록이 저장됐습니다!"
            _titleLabel.textColor = UIColor(hex: "#FFFFFF")
            _subTitleLabel.text = "오늘 기록으로 \(volumeString)kg 볼륨이 저장됐어요!\n대단한걸요!"
            _subTitleLabel.textColor = UIColor(hex: "#A8A8A8")
            _submitButton.setTitle("닫기", for: .normal)
            _submitButton.setTitleColor(.black, for: .normal)
            _submitButton.backgroundColor = UIColor(hex: "#82F80E")
        case .report:
            _titleLabel.text = "신고가 접수되었습니다"
            _titleLabel.textColor = UIColor(hex: "#FFFFFF")
            _subTitleLabel.text = "신고가 접수되어 조치될 예정입니다 감사합니다"
            _subTitleLabel.textColor = UIColor(hex: "#FFFFFF")
            _submitButton.setTitle("닫기", for: .normal)
            _submitButton.setTitleColor(UIColor(hex: "#FFFFFF"), for: .normal)
            _submitButton.backgroundColor = UIColor(hex: "#83AC66")
            _submitButton.layer.cornerRadius = 3
        case .fail:
            _titleLabel.text = "결제 처리가 실패되었습니다."
            _titleLabel.textColor = UIColor(hex: "#FFFFFF")
            _subTitleLabel.text = "다시 시도 바랍니다."
            _subTitleLabel.textColor = UIColor(hex: "#FFFFFF")
            _submitButton.setTitle("닫기", for: .normal)
            _submitButton.setTitleColor(UIColor(hex: "#FFFFFF"), for: .normal)
            _submitButton.backgroundColor = UIColor(hex: "#83AC66")
            _submitButton.layer.cornerRadius = 3
        }
    }
    
    public override func setLayout() {
        addSubview(containerView)
        containerView.addSubview(_titleLabel)
        containerView.addSubview(_subTitleLabel)
        containerView.addSubview(_submitButton)
        
        containerView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalTo(self.safeAreaLayoutGuide.snp.centerY).offset(-80)
            $0.height.equalTo(UIScreen.main.bounds.height * 177 / 812)
            $0.width.equalTo(UIScreen.main.bounds.width * 280 / 375)
        }
        
        _titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(42)
            $0.centerX.equalToSuperview()
        }
        
        _subTitleLabel.snp.makeConstraints {
            $0.top.equalTo(_titleLabel.snp.bottom).offset(17)
            $0.centerX.equalToSuperview()
        }
        
        _submitButton.snp.makeConstraints {
            $0.top.equalTo(_subTitleLabel.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(UIScreen.main.bounds.height * 37 / 812)
            $0.width.equalTo(UIScreen.main.bounds.width * 242 / 375)
        }
    }
    
    // MARK: - Actions
    private func setupActions() {
        _submitButton.addTarget(self, action: #selector(submitTapped), for: .touchUpInside)
    }
    
    @objc private func submitTapped() {
        self.removeFromSuperview()
    }
    
    // MARK: - Getter
    public var titleLabel: UILabel { _titleLabel }
    public var subTitleLabel: UILabel { _subTitleLabel }
    public var submitButton: UIButton { _submitButton }
}
