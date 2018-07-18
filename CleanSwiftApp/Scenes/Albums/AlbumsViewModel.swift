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
typealias PhotoSection = AnimatableSectionModel<String, Presentation.Photo>

protocol AlbumsViewModelInput {
    var selectAlbum: ControlEvent<Presentation.Album> { get }
}

protocol AlbumsViewModelOutput {
    var albums: Driver<[AlbumsSection]> { get }
    var photosForSelectedAlbum: Driver<[PhotoSection]> { get }
    var error: Observable<Error> { get }
}

class AlbumsViewModel {
    struct Input: AlbumsViewModelInput {
        let selectAlbum: ControlEvent<Presentation.Album>
    }

    struct Output: AlbumsViewModelOutput {
        let albums: Driver<[AlbumsSection]>
        let photosForSelectedAlbum: Driver<[PhotoSection]>
        let error: Observable<Error>
    }

    private let fetchAlbums: FetchAlbumsUseCase
    private let fetchPhotosForAlbum: FetchPhotosForAlbum

    init(fetchAlbums: FetchAlbumsUseCase, fetchPhotosForAlbum: FetchPhotosForAlbum) {
        self.fetchAlbums = fetchAlbums
        self.fetchPhotosForAlbum = fetchPhotosForAlbum
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

        let photosForSelectedAlbum = input.selectAlbum.flatMap({ [unowned self] in
            self.fetchPhotosForAlbum.execute(parameter: $0.id)
        }).map({
            return $0.mapToPresentation()
        }).map({
            return [PhotoSection(model: "photos", items: $0)]
        }).asDriver { (error) -> Driver<[PhotoSection]> in
            errorSubject.onNext(error)
            return Driver.just([PhotoSection]())
        }

        return Output(albums: albumsSection,
                      photosForSelectedAlbum: photosForSelectedAlbum,
                      error: errorSubject)
    }
}

