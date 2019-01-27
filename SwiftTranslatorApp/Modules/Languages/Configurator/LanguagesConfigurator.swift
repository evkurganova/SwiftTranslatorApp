//
//  LanguagesLanguagesConfigurator.swift
//  SwiftTranslatorApp
//
//  Created by Kate Systerova on 26/01/2019.
//  Copyright © 2019 katesysterova. All rights reserved.
//

import UIKit

class LanguagesModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? LanguagesViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: LanguagesViewController) {

        let router = LanguagesRouter()
        router.viewController = viewController

        let presenter = LanguagesPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = LanguagesInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
