//
//  Repo.swift
//  RepoFinder 2.0
//
//  Created by Jacob Singer on 12/3/19.
//  Copyright © 2019 Jacob Singer. All rights reserved.
//

import Foundation

struct Repo: Codable, Hashable {
    var name: String
    var url: String
    var packages: String
    
}
