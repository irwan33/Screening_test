//
//  ScreenFourInteractor.swift
//  Suitmedia
//
//  Created by irwan on 10/05/20.
//  Copyright © 2020 irwan. All rights reserved.
//

import Foundation
class UserList: Service {
    static let shared =  UserList()
    
    func getListUser(page : Int, per_page : Int,completion: @escaping (Data?, Error?) -> Void) {
        get("\(Endpoints.BASE)\(Endpoints.USER)?page=\(page)&per_page=\(per_page)") { (result, error) in
            completion(result, error)
        }
    }
}
