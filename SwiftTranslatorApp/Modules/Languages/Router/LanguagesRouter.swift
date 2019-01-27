//
//  LanguagesLanguagesRouter.swift
//  SwiftTranslatorApp
//
//  Created by Kate Systerova on 26/01/2019.
//  Copyright © 2019 katesysterova. All rights reserved.
//

class LanguagesRouter: LanguagesRouterInput {
    
    weak var viewController: LanguagesViewController!
    
    func closeCurrentViewController() {
        
        viewController.dismiss(animated: true, completion: nil)

    }
    
}
