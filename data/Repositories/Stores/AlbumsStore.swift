//
//  AlbumsStore.swift
//  data
//
//  Created by Giorgos Tsiapaliokas on 09/02/2018.
//  Copyright © 2018 Giorgos Tsiapaliokas. All rights reserved.
//

import Foundation
import RxSwift

typealias RemoteAlbumsStore = RemoteStore<FetchAlbumsResponse>

typealias LocalAlbumsStore = LocalStore<AlbumEntity>
