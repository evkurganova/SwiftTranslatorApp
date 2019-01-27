//
//  Language.swift
//  SwiftTranslatorApp
//
//  Created by Ekaterina Systerova on 27/01/2019.
//  Copyright © 2019 Ekaterina Systerova. All rights reserved.
//

import RealmSwift

class Language: Object {

    @objc dynamic var ID = ""
    @objc dynamic var name = ""
    @objc dynamic var isCurrent = false

    override static func primaryKey() -> String? {
        return "ID"
    }
}
