//
//  PostsStore.swift
//  data
//
//  Created by Giorgos Tsiapaliokas on 25/01/2018.
//  Copyright © 2018 Giorgos Tsiapaliokas. All rights reserved.
//

import RxSwift
import CoreData
import Domain

typealias RemotePostsStore = RemoteStore<FetchPostsResponse>

typealias LocalPostsStore = LocalStore<PostEntity>
