//
//  DataService.swift
//  SwiftTranslatorApp
//
//  Created by Ekaterina Systerova on 27/01/2019.
//  Copyright © 2019 Ekaterina Systerova. All rights reserved.
//

import UIKit
import RealmSwift

extension Notification.Name {
    
    static let currentLanguageChanged = Notification.Name("currentLanguageChanged")
}

class DataService {

    private var realm: Realm
    
    static let sharedInstance = DataService()
    
    private init() {
        
        realm = try! Realm()
    }
    
    func getAllLanguages() -> [Language] {
        
        let results: Results<Language> = realm.objects(Language.self).sorted(byKeyPath: "name", ascending: true)
        let array = Array(results)
        return array;
    }
    
    func getCurrentLanguage() -> Language {
        
        let results = realm.objects(Language.self).filter(NSPredicate(format: "isCurrent == true"))
        
        if let language = results.first {
            return language
        } else {

            let defaultLanguage = Language()
            defaultLanguage.ID = "en"
            defaultLanguage.name = "Английский"
            defaultLanguage.isCurrent = true

            realm.beginWrite()
            realm.add(defaultLanguage)
            try! realm.commitWrite()
            
            return defaultLanguage
        }
    }
    
    func setCurrentLanguage(newCurrentLanguage:Language)
    {
        let oldLanguage = self.getCurrentLanguage()
        
        try! realm.write {
            oldLanguage.isCurrent = false
            newCurrentLanguage.isCurrent = true
            
            NotificationCenter.default.post(name: .currentLanguageChanged, object: nil)
        }
    }
    
    func saveLanguage(ID: String, name: String) {
        
        let currentLanguage = self.getCurrentLanguage()

        let results = realm.objects(Language.self).filter(NSPredicate(format: "ID == '\(ID)'"))
        
        if let language = results.first {
            
            try! realm.write {
                language.name = name
                language.isCurrent = (currentLanguage.ID == ID)
            }
            
        } else {
            
            let language = Language()
            language.ID = ID
            language.name = name
            language.isCurrent = (currentLanguage.ID == ID)
            
            realm.beginWrite()
            realm.add(language)
            try! realm.commitWrite()
        }
    }
    
    func getAllWords() -> [Word] {
        
        let results: Results<Word> = realm.objects(Word.self).sorted(byKeyPath: "changedDate", ascending: false)
        let array = Array(results)
        return array;
    }
    
    func getAllWords(searchText: String) -> [Word] {
        
        let results = realm.objects(Word.self).filter(NSPredicate(format: "translatedWord contains '\(searchText)' OR nativeWord contains '\(searchText)'")).sorted(byKeyPath: "changedDate", ascending: false)
        let array = Array(results)
        return array;
    }
    
    func createWord(nativeWord: String) {
        
        let currentLanguage = self.getCurrentLanguage()

        let results = realm.objects(Word.self).filter(NSPredicate(format: "nativeWord == '\(nativeWord)' AND language.ID == '\(currentLanguage.ID)'"))

        if let word = results.first {
            
            try! realm.write {
                word.changedDate = Date()
            }
            
        } else {
            
            let word = Word()
            word.nativeWord = nativeWord
            word.language = currentLanguage
            word.changedDate = Date()

            realm.beginWrite()
            realm.add(word)
            try! realm.commitWrite()
        }
    }
    
    func saveWord(nativeWord: String, translatedWord: String) {
        
        let currentLanguage = self.getCurrentLanguage()
        
        let results = realm.objects(Word.self).filter(NSPredicate(format: "nativeWord == '\(nativeWord)' AND language.ID == '\(currentLanguage.ID)'"))
        
        if let word = results.first {
            
            try! realm.write {
                word.translatedWord = translatedWord
                word.changedDate = Date()
            }
            
        } else {
            
            let word = Word()
            word.nativeWord = nativeWord
            word.translatedWord = translatedWord
            word.language = currentLanguage
            word.changedDate = Date()
            
            realm.beginWrite()
            realm.add(word)
            try! realm.commitWrite()
        }
    }
    
    func removeWord(object: Word) {
        
        try! realm.write {
            realm.delete(object)
        }
    }
}
