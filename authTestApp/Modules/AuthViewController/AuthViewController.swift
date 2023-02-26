//
//  ViewController.swift
//  authTestApp
//
//  Created by Илья Шахназаров on 26.02.2023.
//

import UIKit

class AuthViewController: UIViewController {

    private let vcView = AuthView()
    private let presenter = AuthPresenter()

    override func loadView() {
        view = vcView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        navigationItem.hidesBackButton = true
        hideKeyboardGesture()
        presenter.getCaptcha(imageView: vcView.captchaImageView)

        vcView.authButton.addTarget(self, action: #selector(signIn), for: .touchUpInside)
    }

    @objc func signIn() {
        presenter.signIn(loginForm: vcView.loginForm,
                         passwordForm: vcView.passwordForm,
                         captchaForm: vcView.captchaForm,
                         check: vcView.checkLabel)
    }
}
