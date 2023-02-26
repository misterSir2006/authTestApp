//
//  AuthModel.swift
//  authTestApp
//
//  Created by Илья Шахназаров on 26.02.2023.
//

import Foundation

class AuthModel {

    // MARK: Captcha
    struct Captcha: Codable {
        let resultCode, resultMessage: String
        let data: CaptchaData

        enum CodingKeys: String, CodingKey {
            case resultCode = "result_code"
            case resultMessage = "result_message"
            case data
        }
    }

    struct CaptchaData: Codable {
        let key, imageData: String

        enum CodingKeys: String, CodingKey {
            case key
            case imageData = "image_data"
        }
    }

    // MARK: Auth
    struct Auth: Codable {
        let resultCode, resultMessage: String
        let data: AuthData

        enum CodingKeys: String, CodingKey {
            case resultCode = "result_code"
            case resultMessage = "result_message"
            case data
        }
    }

    struct AuthData: Codable {
        let tokenType: String
        let expiresIn: Int
        let accessToken, refreshToken: String

        enum CodingKeys: String, CodingKey {
            case tokenType = "token_type"
            case expiresIn = "expires_in"
            case accessToken = "access_token"
            case refreshToken = "refresh_token"
        }
    }

    // MARK: AuthObject
    struct AuthObject: Codable {
        let username, password: String
        let captcha: AuthObjectCaptcha

        struct AuthObjectCaptcha: Codable {
            let key, value: String
        }
    }

}
