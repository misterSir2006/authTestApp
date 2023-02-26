//
//  ProfileModel.swift
//  authTestApp
//
//  Created by Илья Шахназаров on 26.02.2023.
//

import Foundation

class ProfileModel {

    // MARK: User
    struct User: Codable {
        let resultCode, resultMessage: String
        let data: UserData

        enum CodingKeys: String, CodingKey {
            case resultCode = "result_code"
            case resultMessage = "result_message"
            case data
        }
    }

    struct UserData: Codable {
        let id: Int
        let username, createdAt: String
        let status: Int
        let isPfdoUser: Bool
        let roles: [Municipality]
        let profile: Profile
        let timezone: String
        let activeSystem: Int

        enum CodingKeys: String, CodingKey {
            case id, username
            case createdAt = "created_at"
            case status
            case isPfdoUser = "is_pfdo_user"
            case roles, profile, timezone
            case activeSystem = "active_system"
        }
    }

    // MARK: - Profile
    struct Profile: Codable {
        let email: String
        let phone: String?
        let birthdayAt, caption, firstName, middleName: String
        let lastName, emailVerifiedAt, name: String
        let region, municipality: Municipality
        let avatar: Avatar

        enum CodingKeys: String, CodingKey {
            case email, phone
            case birthdayAt = "birthday_at"
            case caption
            case firstName = "first_name"
            case middleName = "middle_name"
            case lastName = "last_name"
            case emailVerifiedAt = "email_verified_at"
            case name, region, municipality, avatar
        }
    }

    // MARK: - Avatar
    struct Avatar: Codable {
        let id: Int
        let url, thumb: String
    }

    // MARK: - Municipality
    struct Municipality: Codable {
        let id: Int
        let name: String
    }

}
