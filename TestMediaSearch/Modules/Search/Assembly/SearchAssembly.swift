//
//  SearchAssembly.swift
//  TestMediaSearch
//
//  Created by Egor Shashkov on 19/07/2018.
//  Copyright © 2018 Egor Shashkov. All rights reserved.
//

import Foundation
import UIKit
import Swinject

final class SearchAssembly: BaseAssembly {

    static func configure() {
        let container = defaultContainer()
        configureVMB(with: container)
        configureView(with: container)
        configurePresenter(with: container)
    }
    
    private static func configureVMB(with container: Container) {
        container.register(SearchViewModelBuilderProtocol.self) { _ in
            SearchViewModelBuilder()
        }.inObjectScope(.container)
    }
    
    private static func configureView(with container: Container) {
        container.register(SearchViewInput.self) { resolver in
            let story = UIStoryboard(name: "Search", bundle: nil)
            let controller = story.instantiateViewController(withIdentifier: "SearchView") as! SearchView
            controller.output = resolver.resolve(SearchViewOutput.self, argument: (controller as SearchViewInput))!
            return controller
        }.inObjectScope(.transient)
    }
    
    private static func configurePresenter(with container: Container) {
        container.register(SearchViewOutput.self, factory: { (resolver: Resolver, view: SearchViewInput) in
            let presenter = SearchPresenter()
            presenter.githubRepository = resolver.resolve(GithubRepositoryProtocol.self)!
            presenter.itunesRepository = resolver.resolve(ItunesRepositoryProtocol.self)!
            presenter.searchVMBuilder = resolver.resolve(SearchViewModelBuilderProtocol.self)!
            presenter.view = view
            return presenter
        }).inObjectScope(.transient)
    }
}
