//
//  CommonTextAlertView.swift
//  DesignSystem
//
//  Created by 고영민 on 11/13/25.
//

import UIKit
import SnapKit
import Then

public final class CommonTextAlertView: UIView {

    // MARK: - Type
    public enum AlertType {
        case question
        case answer
        case review
        case report
        case memo
        case feedbackToMember
        case feedbackFromTrainer
    }

    // MARK: - UI Components
    private let container = UIView()
    private let titleLabel = UILabel()
    private let textView = UITextView()
    private let cancelButton = UIButton()
    private let submitButton = UIButton()

    // MARK: - Callbacks
    public var onSubmit: ((String) -> Void)?
    public var onCancelTapped: (() -> Void)?

    // MARK: - Init
    public init(type: AlertType) {
        super.init(frame: UIScreen.main.bounds)
        setupUI()
        configure(type: type)
        setupActions()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - UI Setup
    
    public func setText(_ text: String) {
        textView.text = text
    }

    public func getText() -> String {
        return textView.text ?? ""
    }
    
    private func setupUI() {
        backgroundColor = UIColor.black.withAlphaComponent(0.6)

        container.do {
            $0.backgroundColor = UIColor(hex: "#313131")
            $0.layer.cornerRadius = 10
        }

        titleLabel.do {
            $0.textColor = UIColor(hex: "#FFFFD2")
            $0.font = .systemFont(ofSize: 11, weight: .regular)
            $0.textAlignment = .center
            $0.numberOfLines = 0
        }

        textView.do {
            $0.font = .systemFont(ofSize: 15)
            $0.textColor = .black
            $0.backgroundColor = .white
            $0.layer.cornerRadius = 8
            $0.textContainerInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
            $0.isScrollEnabled = false
        }

        cancelButton.do {
            $0.setTitle("닫기", for: .normal)
            $0.setTitleColor(.black, for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
            $0.backgroundColor = UIColor(hex: "#E0E5EB")
            $0.layer.cornerRadius = 3
        }

        submitButton.do {
            $0.setTitleColor(.black, for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
            $0.backgroundColor = UIColor(hex: "#82F80E")
            $0.layer.cornerRadius = 3
        }

        addSubview(container)
        container.addSubview(titleLabel)
        container.addSubview(textView)
        container.addSubview(cancelButton)
        container.addSubview(submitButton)

        container.snp.makeConstraints {
            $0.centerY.equalTo(self.safeAreaLayoutGuide.snp.centerY).offset(-80)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(UIScreen.main.bounds.width * 345 / 375)
            $0.height.equalTo(UIScreen.main.bounds.height * 317 / 812)
        }

        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(15)
            $0.leading.trailing.equalToSuperview().inset(10)
        }

        textView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(12)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(UIScreen.main.bounds.width * 305 / 375)
            $0.height.equalTo(UIScreen.main.bounds.height * 206 / 812)
        }

        cancelButton.snp.makeConstraints {
            $0.top.equalTo(textView.snp.bottom).offset(15)
            $0.leading.equalToSuperview().offset(20)
            $0.height.equalTo(UIScreen.main.bounds.height * 37 / 812)
            $0.width.equalTo(UIScreen.main.bounds.width * 143 / 375)
        }

        submitButton.snp.makeConstraints {
            $0.top.equalTo(textView.snp.bottom).offset(15)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(UIScreen.main.bounds.height * 37 / 812)
            $0.width.equalTo(UIScreen.main.bounds.width * 143 / 375)
        }
    }

    // MARK: - Actions
    private func setupActions() {
        cancelButton.addTarget(self, action: #selector(cancelTapped), for: .touchUpInside)
        submitButton.addTarget(self, action: #selector(submitTapped), for: .touchUpInside)
    }

    @objc private func cancelTapped() {
        onCancelTapped?()
        removeFromSuperview()
    }

    @objc private func submitTapped() {
        onSubmit?(textView.text ?? "")
        removeFromSuperview()
    }

    // MARK: - Configure
    private func configure(type: AlertType) {
        switch type {
        case .question:
            titleLabel.text = "200자 이내 작성가능하며, 강의자에게 피해를 주는 질문은 삭제 될 수 있습니다."
            submitButton.setTitle("질문 등록하기", for: .normal)
        case .answer:
            titleLabel.text = "200자 이내 작성가능하며, 수강생에게 피해를 주는 답변은 삭제 될 수 있습니다."
            submitButton.setTitle("답변 등록하기", for: .normal)
        case .review:
            titleLabel.text = "200자 이내 작성가능하며, 강의자에게 피해를 주는 리뷰는 삭제 될 수 있습니다."
            submitButton.setTitle("리뷰 등록하기", for: .normal)
        case .report:
            titleLabel.text = "200자 이내 작성가능하며, 허위 사실 신고는 제재 대상이 될 수 있습니다."
            submitButton.setTitle("신고하기", for: .normal)
        case .memo:
            titleLabel.text = "자유로운 메모장으로 이용가능합니다. 작성하신 메모는 캘린더에 저장됩니다."
            submitButton.setTitle("메모 등록하기", for: .normal)
        case .feedbackToMember:
            titleLabel.text = "회원님에게 피드백을 남길 수 있어요"
            submitButton.setTitle("피드백 등록", for: .normal)
        case .feedbackFromTrainer:
            titleLabel.text = "트레이너님께서 피드백을 주셨어요! 메모에 반영해보는건 어떨까요?"
            submitButton.setTitle("좋아요", for: .normal)
        }
    }
}
