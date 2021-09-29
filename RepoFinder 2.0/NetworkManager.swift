//
//  NetworkManager.swift
//  RepoFinder 2.0
//
//  Created by Jacob Singer on 12/3/19.
//  Copyright © 2019 Jacob Singer. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import SwiftUI



class NetworkManager: ObservableObject {

    @Published var showLocal: Bool = false {
        didSet {
            getRepos()
            UserDefaults.standard.set(self.showLocal, forKey: "showLocal")
            UserDefaults.standard.synchronize()
        }
    }

    @Published var repos = [Repo]() {
        didSet{
            print(repos.count)
        }
    }




    func getRepos() {
        if showLocal {
            getFromJSON()
        }
        else {
            callToServer()
        }
    }

    func getFromJSON() {
        if let jsonURL = Bundle.main.url(forResource: "Repos", withExtension: "json") {
            if let jsonData = try? Data(contentsOf: jsonURL) {
                print(jsonData)
                parseData(json: jsonData)
            }
        }
    }
    func callToServer() {
        AF.request("https://www.ios-repo-updates.com/api/popular-repos/").responseJSON { response in
            if let data = response.data {
                self.parseData(json: data)
            }
            print("Show Local: \(self.showLocal)")
        }
        
        
        
    }
    
    func parseData(json: Data) {
        
        repos = []
        
        if let json = try? JSON(data: json) {
            print(json)
            for item in json.arrayValue {
                //                print("Name: \(item["name"].stringValue) - Packages: \(item["packages"].stringValue) - URL: \(item["url"].stringValue)")
                
                let repo = Repo(name: item["name"].stringValue, url: item["url"].stringValue, packages: item["packages"].stringValue)
                
                repos.append(repo)
                
            }
            
            repos.sort {
                $0.name.localizedCaseInsensitiveCompare($1.name) == ComparisonResult.orderedAscending
            }
            

        }
        
    }
}
