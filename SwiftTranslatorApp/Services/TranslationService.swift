//
//  TranslationManager.swift
//  SwiftTranslatorApp
//
//  Created by Ekaterina Systerova on 26/01/2019.
//  Copyright © 2019 Ekaterina Systerova. All rights reserved.
//

import UIKit
import Alamofire

class TranslationService {

    static let sharedInstance = TranslationService()

    let baseUrl = "https://translate.yandex.net/api/v1.5/tr.json/"
    let apiKey = "trnsl.1.1.20150314T143415Z.27b846e36cc8cc1b.68a816b75ece8c9412a0e83d2f07d689f13426c9"
    
    func translation(nativeWord: String, language: String, completionHandler: @escaping (Bool, Error?) -> Void) {
        
        //    https://translate.yandex.net/api/v1.5/tr.json/translate
        //    ? [key=<API-ключ>]
        //    & [text=<переводимый текст>]
        //    & [lang=<направление перевода>]
        //    & [format=<формат текста>]
        //    & [options=<опции перевода>]
        //    & [callback=<имя callback-функции>]
        
        guard let encodeWord: String = nativeWord.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlHostAllowed)?.replacingOccurrences(of: "&", with: "") else {
            
            completionHandler(false, nil)
            return
        }
        
        let urlString = String("\(baseUrl)translate?key=\(apiKey)&text=\(encodeWord)&lang=\(language)&options=1")
        
        Alamofire.request(urlString).validate().responseJSON { response in
            
            switch response.result {
            case .success:
                
                print("Request: \(String(describing: response.request))")
                print("Response: \(String(describing: response.response))")
                print("Result: \(response.result)")
                
                guard let json = response.result.value as? [String:Any] else {
                    completionHandler(false, nil)
                    return
                }

                if (json["detected"] as? [String:Any]) != nil {
                    
                    guard let textArray = json["text"] as? [String] else {
                        completionHandler(false, nil)
                        return
                    }
                    
                    let text: String = textArray.first ?? ""
                    
                    DataService.sharedInstance.saveWord(nativeWord: nativeWord, translatedWord: text)
                    
                    completionHandler(true, nil)

                } else {
                    completionHandler(false, nil)
                    return
                }
                
            case .failure(let error):
                
                print(error)
                completionHandler(false, error)
            }
        }
    }
    
    func languages(completionHandler: @escaping (Bool, Error?) -> Void) {
        
        //    https://translate.yandex.net/api/v1.5/tr.json/getLangs
        //    ? [key=<API-ключ>]
        //    & [ui=<код языка>]
        //    & [callback=<имя callback-функции>]
        
        let urlString = String("\(baseUrl)getLangs?key=\(apiKey)@&ui=ru")
        
        Alamofire.request(urlString).validate().responseJSON { response in
            
            switch response.result {
            case .success:
                
                print("Request: \(String(describing: response.request))")
                print("Response: \(String(describing: response.response))")
                print("Result: \(response.result)")
                
                guard let json = response.result.value as? [String:Any] else {
                    completionHandler(false, nil);
                    return
                }
                
                if (json["langs"] as? [String:String]) != nil {
                    
                    let languagesDict: [String:String] = json["langs"] as! [String : String]

                    for (languageCode, languageName) in languagesDict
                    {
                        DataService.sharedInstance.saveLanguage(ID: languageCode, name: languageName)
                    }
                    
                    completionHandler(true, nil)
                    
                } else {
                    completionHandler(false, nil)
                    return
                }
                
            case .failure(let error):
                
                print(error)
                completionHandler(false, error)
            }
            
        }
    }
}
