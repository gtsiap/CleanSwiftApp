//
//  AlbumsViewModel.swift
//  CleanSwiftApp
//
//  Created by Giorgos Tsiapaliokas on 13/02/2018.
//  Copyright © 2018 Giorgos Tsiapaliokas. All rights reserved.
//

import RxSwift
import RxCocoa
import Domain
import Presentation
import RxDataSources

typealias AlbumsSection = AnimatableSectionModel<String, Presentation.Album>

protocol AlbumsViewModelInput {}

protocol AlbumsViewModelOutput {
    var albums: Driver<[AlbumsSection]> { get }
    var error: Observable<Error> { get }
}

class AlbumsViewModel {
    struct Input: AlbumsViewModelInput {}

    struct Output: AlbumsViewModelOutput {
        let albums: Driver<[AlbumsSection]>
        let error: Observable<Error>
    }

    private let fetchAlbums: FetchAlbumsUseCase

    init(fetchAlbums: FetchAlbumsUseCase) {
        self.fetchAlbums = fetchAlbums
    }

    func transform(input: AlbumsViewModelInput) -> AlbumsViewModelOutput {
        let errorSubject = PublishSubject<Error>()

        let albumsSection = fetchAlbums
            .execute()
            .map({ return $0.mapToPresentation() })
            .map({
                return [AlbumsSection(model: "albums", items: $0)]
            }).asDriver { (error) -> Driver<[AlbumsSection]> in
                errorSubject.onNext(error)
                return Driver.just([AlbumsSection]())
            }

        return Output(albums: albumsSection, error: errorSubject)
    }
}

