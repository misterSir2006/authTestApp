//
//  AuthView.swift
//  authTestApp
//
//  Created by Илья Шахназаров on 26.02.2023.
//

import UIKit

class AuthView: UIView {

    // MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        fill()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Properties
    lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.keyboardDismissMode = .onDrag
        scroll.showsVerticalScrollIndicator = false
        scroll.bounces = false

        return scroll
    }()

    lazy var contentView = UIView()

    lazy var checkLabel: UILabel = {
        let label = UILabel()
        label.isHidden = true
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textColor = .red
        label.numberOfLines = 0
        label.sizeToFit()

        return label
    }()

    lazy var loginForm: FormField = {
        let form = FormField()
        form.placeholder = "Login"
        form.autocorrectionType = .no
        form.autocapitalizationType = .none
        form.delegate = self

        return form
    }()

    lazy var passwordForm: FormField = {
        let form = FormField()
        form.placeholder = "Password"
        form.isSecureTextEntry = true
        form.delegate = self

        return form
    }()

    lazy var captchaForm: FormField = {
        let form = FormField()
        form.placeholder = "Captcha"
        form.autocorrectionType = .no
        form.autocapitalizationType = .none
        form.delegate = self

        return form
    }()

    lazy var captchaImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 15
        imageView.backgroundColor = .lightGray
        imageView.contentMode = .scaleAspectFit

        return imageView
    }()

    lazy var authButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign in", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10

        return button
    }()

    // MARK: Fill
    private func fill() {
        backgroundColor = .white

        addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.top.bottom.centerX.width.equalTo(scrollView)
            make.height.equalTo(scrollView).priority(250)
        }

        contentView.addSubview(checkLabel)
        checkLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(80)
            make.left.right.equalToSuperview().inset(30)
        }

        contentView.addSubview(loginForm)
        loginForm.snp.makeConstraints { make in
            make.top.equalTo(checkLabel.snp.bottom).offset(30)
            make.left.right.equalToSuperview().inset(30)
            make.height.equalTo(50)
        }

        contentView.addSubview(passwordForm)
        passwordForm.snp.makeConstraints { make in
            make.top.equalTo(loginForm.snp.bottom).offset(30)
            make.left.right.height.equalTo(loginForm)
        }

        contentView.addSubview(captchaForm)
        captchaForm.snp.makeConstraints { make in
            make.top.equalTo(passwordForm.snp.bottom).offset(30)
            make.left.right.height.equalTo(passwordForm)
        }

        contentView.addSubview(captchaImageView)
        captchaImageView.snp.makeConstraints { make in
            make.top.equalTo(captchaForm.snp.bottom).offset(20)
            make.left.right.equalTo(captchaForm)
            make.height.equalTo(90)
        }

        contentView.addSubview(authButton)
        authButton.snp.makeConstraints { make in
            make.top.equalTo(captchaImageView.snp.bottom).offset(50)
            make.left.right.equalTo(captchaForm)
            make.height.equalTo(60)
            make.bottom.equalToSuperview().offset(-60)
        }
    }
}

extension AuthView: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        endEditing(true)
        return false
    }
}
