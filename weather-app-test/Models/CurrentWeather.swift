//
//  Weather.swift
//  weather-app-test
//
//  Created by shyamlal on 14/12/21.
//

import Foundation

class Weather: Codable {

    var name: String?
    var phone: String?
    var location: String?
    var email: String?
    var uuid: String?
    var jwt: String?

    enum CodingKeys: String, CodingKey {

      case name = "user_name", phone = "user_phone",
           location = "user_location", email = "user_email",
           uuid = "user_uuid", jwt

    }

    init(name: String?, phone: String?, location: String?, email: String?, uuid: String?, jwt: String?) {

        self.name = name
        self.phone = phone
        self.location = location
        self.email = email
        self.uuid = uuid
        self.jwt = jwt

    }

}
