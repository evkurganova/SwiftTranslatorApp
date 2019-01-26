//
//  DataService.swift
//  SwiftTranslatorApp
//
//  Created by Ekaterina Systerova on 27/01/2019.
//  Copyright © 2019 Ekaterina Systerova. All rights reserved.
//

import UIKit
import RealmSwift

class DataService {

    private var realm: Realm
    
    static let sharedInstance = DataService()
    
    private init() {
        realm = try! Realm()
    }
    
    func getDataFromDB() -> Results<Word> {
        let results: Results<Word> = realm.objects(Word.self)
//        let results = realm.objects(Word.self).filter(NSPredicate(format: "name contains 'x'"))
        return results
    }
    
    func addData(object: Word) {
        try! realm.write {
            realm.add(object, update: true)
            print("Added new object")
        }
    }
    
    func deleteAllFromDatabase() {
        try! realm.write {
            realm.deleteAll()
        }
    }
    
    func deleteFromDb(object: Word) {
        try! realm.write {
            realm.delete(object)
        }
    }
}
