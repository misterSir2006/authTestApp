//
//  AuthService.swift
//  authTestApp
//
//  Created by Илья Шахназаров on 26.02.2023.
//

import Foundation

final class AuthService {

    static func call<T: Codable>(for: T.Type = T.self,
                                 body: AuthModel.AuthObject,
                                 url: String, method: ApiService.NetworkMethods,
                                 completionHandler: @escaping (Result<T, ApiService.ApiError>) -> Void) {
        guard let requestUrl = URL(string: url) else { return }
        var request = URLRequest(url: requestUrl)

        let json = try? JSONEncoder().encode(body)

        request.httpBody = json
        request.httpMethod = method.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        URLSession.shared.dataTask(with: request) { data, _, error in
            guard data != nil else {
                completionHandler(.failure(.httpError))
                return
            }

            if let decodedData = try? JSONDecoder().decode(T.self, from: data!) {
                DispatchQueue.main.async {
                    completionHandler(.success(decodedData))
                }
            } else {
                let error = try? JSONDecoder().decode(ApiService.ErrorObject.self, from: data!)
                guard let error = error else { return }
                completionHandler(.failure(.serviceError(error)))
            }
        }.resume()
    }
}
