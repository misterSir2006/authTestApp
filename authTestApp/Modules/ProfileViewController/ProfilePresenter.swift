//
//  ProfilePresenter.swift
//  authTestApp
//
//  Created by Илья Шахназаров on 26.02.2023.
//

import UIKit

class ProfilePresenter {

    // MARK: API
    func getUserInfo(_ view: ProfileView) {
        let url = UrlBuilder.buildUrl(path: .user)
        let type = ProfileModel.User.self
        let token = Constants.token

        ApiService.call(for: type, token: token,
                        url: url, method: .get) { result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    view.nameLabel.text = data.data.profile.name
                    view.cityLabel.text = "\(data.data.profile.municipality.name), \(data.data.profile.region.name)"
                    view.avatarImageView.kf.setImage(with: URL(string: data.data.profile.avatar.url))
                    view.emailLabel.text = data.data.profile.email
                }
            case .failure(let fail):
                switch fail {
                case .httpError:
                    DispatchQueue.main.async {
                        AlertService.noConnectionAlert()
                    }
                case .serviceError(let err):
                    DispatchQueue.main.async {
                        AlertService.showAlert(style: .alert, title: err.resultMessage, message: nil)
                    }
                }
            }
        }
    }
}
