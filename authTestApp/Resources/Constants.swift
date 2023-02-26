//
//  Constants.swift
//  authTestApp
//
//  Created by Илья Шахназаров on 26.02.2023.
//

import UIKit

struct Constants {

    // MARK: Content
    static var token: String {
        UserDefaults.standard.string(forKey: "token") ?? ""
    }

    static var signedIn: Bool {
        UserDefaults.standard.bool(forKey: "signedIn")
    }

    struct API {
        static let baseUrl = "https://api-events.pfdo.ru/v1"
    }

    enum Paths: String {
        case user = "/user"
        case captcha = "/captcha"
        case auth = "/auth"
    }

    struct LocStrings {

    }

    // MARK: - Design
    struct Colors {

    }

    struct Images {

    }
}
