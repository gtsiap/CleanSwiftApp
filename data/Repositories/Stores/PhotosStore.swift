//
//  PhotosStore.swift
//  data
//
//  Created by Giorgos Tsiapaliokas on 12/04/2018.
//  Copyright © 2018 Giorgos Tsiapaliokas. All rights reserved.
//

import Foundation
import RxSwift

typealias RemotePhotosStore = RemoteStore<FetchPhotosResponse>

typealias LocalPhotosStore = LocalStore<PhotoEntity>
