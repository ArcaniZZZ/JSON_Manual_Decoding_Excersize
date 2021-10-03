//
//  File.swift
//  ParsingJSONExcersize
//
//  Created by Arcani on 02.10.2021.
//

import Foundation

struct User: Codable {
    
    let gender: String?
    let name: Name?
    let location: Location?
    let email: String?
    let login: Login?
    let dob: Date?
    let registered: Date?
    let phone: String?
    let cell: String?
    let id: Id?
    let picture: Picture?
    let nat: String?
    
    init(value: [String: Any]) {
        
        gender = value["gender"] as? String
        
        let nameDict = value["name"] as? [String: String] ?? [:]
        name = Name(value: nameDict)
        
        let locationDict = value["location"] as? [String: Any] ?? [:]
        location = Location(value: locationDict)
        
        email = value["email"] as? String
        
        let loginDict = value["login"] as? [String: String] ?? [:]
        login = Login(value: loginDict)
        
        let dobDict = value["dob"] as? [String: Any] ?? [:]
        dob = Date(value: dobDict)
        
        let registeredDict = value["registered"] as? [String: Any] ?? [:]
        registered = Date(value: registeredDict)
        
        phone = value["phone"] as? String
        
        cell = value["cell"] as? String
        
        let idDict = value["id"] as? [String: String] ?? [:]
        id = Id(value: idDict)
        
        let pictureDict = value["picture"] as? [String: String] ?? [:]
        picture = Picture(value: pictureDict)
        
        nat = value["nat"] as? String
    }
    
    static func fetchUsers(data: [String: Any]) -> [User]? {
        guard let results = data["results"] as? [[String: Any]] else { return [] }
        return results.compactMap { User(value: $0) }
    }
}

struct Name: Codable {
    let title, first, last: String?
    
    init(value: [String: String]) {
        title = value["title"]
        first = value["first"]
        last = value["last"]
    }
}

struct Location: Codable {
    let street: Street?
    let city, state, country: String?
    let postcode: Int?
    let coordinates: Coordinates?
    let timezone: Timezone?
    
    init(value: [String: Any]) {
        street = value["Street"] as? Street
        city = value["city"] as? String
        state = value["state"] as? String
        country = value["country"] as? String
        postcode = value["postcode"] as? Int
        coordinates = value["coordinates"] as? Coordinates
        timezone = value["timezone"] as? Timezone
    }
}

struct Street: Codable {
    let number: Int?
    let name: String?
    
    init(value: [String: Any]) {
        number = value["number"] as? Int
        name = value["name"] as? String
    }
}

struct Coordinates: Codable {
    let latitude: String?
    let longitude: String?
    
    init(value: [String: String]){
        latitude = value["latitude"]
        longitude = value["longitude"]
    }
}

struct Timezone: Codable {
    let offset: String?
    let description: String?
    
    init(value: [String: String]){
        offset = value["offset"]
        description = value["description"]
    }
}

struct Login: Codable {
    let uuid, username, password, salt, md5, sha1, sha256: String?
    
    init(value: [String: String]) {
        uuid = value["uuid"]
        username = value["username"]
        password = value["password"]
        salt = value["salt"]
        md5 = value["md5"]
        sha1 = value["sha1"]
        sha256 = value["sha256"]
    }
}

struct Date: Codable {
    let date: String?
    let age: Int?
    
    init(value: [String: Any]) {
        date = value["date"] as? String
        age = value["age"] as? Int
    }
}

struct Id: Codable {
    let name, value: String?
    
    init(value: [String: String]) {
        name = value["name"]
        self.value = value["value"]
    }
}

struct Picture: Codable {
    let large, medium, thumbnail: String?
    
    init(value: [String: String]) {
        large = value["large"]
        medium = value["medium"]
        thumbnail = value["thumbnail"]
    }
}
