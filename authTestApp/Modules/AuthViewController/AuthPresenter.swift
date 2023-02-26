//
//  AuthPresenter.swift
//  authTestApp
//
//  Created by Илья Шахназаров on 26.02.2023.
//

import UIKit

final class AuthPresenter {

    // MARK: UI
    enum FormAction {
        case correct
        case incorrect
    }

    func formOperation(forms: [FormField], _ state: FormAction) {
        var color: CGColor = UIColor.clear.cgColor

        switch state {
        case .incorrect:
            color = UIColor.red.cgColor
        case .correct:
            break
        }

        for form in forms {
            form.layer.borderColor = color
        }
    }

    // MARK: API
    var captchaKey: String = ""
    func getCaptcha(imageView: UIImageView) {
        let url = UrlBuilder.buildUrl(path: .captcha)
        let type = AuthModel.Captcha.self

        ApiService.call(for: type, token: nil, url: url, method: .post) { result in
            switch result {
            case .success(let data):
                self.captchaKey = data.data.key

                let results = data.data.imageData.matches(for: "data:image\\/([a-zA-Z]*);base64,([^\\\"]*)")
                for imageString in results {
                    autoreleasepool {
                        imageView.image = imageString.base64ToImage()
                    }
                }

            case .failure(let fail):
                switch fail {
                case .httpError:
                    DispatchQueue.main.async {
                        AlertService.noConnectionAlert()
                    }
                case .serviceError(let error):
                    print(error)
                }
            }
        }
    }

    func signIn(loginForm: FormField, passwordForm: FormField, captchaForm: FormField, check: UILabel) {
        self.formOperation(forms: [loginForm, passwordForm, captchaForm], .correct)

        guard let login = loginForm.text,
              let password = passwordForm.text,
              let captcha = captchaForm.text else {
            return
        }

        let body = AuthModel.AuthObject(username: login,
                                        password: password,
                                        captcha: AuthModel.AuthObject.AuthObjectCaptcha(key: self.captchaKey,
                                                                                        value: captcha))
        let url = UrlBuilder.buildUrl(path: .auth)
        let type = AuthModel.Auth.self

        AuthService.call(for: type, body: body,
                         url: url, method: .post) { result in
            switch result {
            case .success(let data):
                UserDefaults.standard.set(data.data.accessToken, forKey: "token")
                UserDefaults.standard.set(true, forKey: "signedIn")
                UIApplication.getTopVC()?.navigationController?.pushViewController(ProfileViewController(),
                                                                                   animated: true)

            case .failure(let fail):
                switch fail {
                case .httpError:
                    DispatchQueue.main.async {
                        AlertService.noConnectionAlert()
                    }
                case .serviceError(let err):
                    print(err)
                    DispatchQueue.main.async {
                        let message = err.resultMessage.lowercased()
                        if message.contains("валидация") {
                            self.formOperation(forms: [captchaForm], .incorrect)
                            self.formOperation(forms: [loginForm, passwordForm], .correct)
                        } else {
                            self.formOperation(forms: [loginForm, passwordForm], .incorrect)
                        }

                        check.isHidden = false
                        check.text = err.resultMessage
                    }
                }

            }
        }
    }
}
