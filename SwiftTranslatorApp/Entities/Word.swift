//
//  Word.swift
//  SwiftTranslatorApp
//
//  Created by Ekaterina Systerova on 27/01/2019.
//  Copyright © 2019 Ekaterina Systerova. All rights reserved.
//

import RealmSwift

class Word: Object {

    @objc dynamic var nativeWord = ""
    @objc dynamic var translatedWord = ""
    @objc dynamic var changedDate = Date()
    @objc dynamic var language = Language()
    
//    override static func primaryKey() -> String? {
//        return "nativeWord"
//    }
}
