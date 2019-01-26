//
//  TranslationsTranslationsConfigurator.swift
//  SwiftTranslatorApp
//
//  Created by Kate Systerova on 26/01/2019.
//  Copyright © 2019 katesysterova. All rights reserved.
//

import UIKit

class TranslationsModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? TranslationsViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: TranslationsViewController) {

        let router = TranslationsRouter()

        let presenter = TranslationsPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = TranslationsInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
