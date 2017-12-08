//
//  TasksRoute.swift
//  ToDoDocker
//
//  Created by Danillo on 07/12/2017.
//  Copyright © 2017 Danillo. All rights reserved.
//

import Foundation
import EasyRest

enum TasksRoute: Routable {
    
    case getTasks
    
    case saveTask(title: String, description: String, expirationDate: String, complete: Bool)
    
    var rule: Rule {
        switch self {
        case .getTasks:
            return Rule(method: .get, path: "v1/tasks/",
                        isAuthenticable: false, parameters: [:]
            )
        case let .saveTask(title, description, expirationDate, complete):
            return Rule(method: .post, path: "v1/tasks/", isAuthenticable: false, parameters: [.body:[
                "expiration_date": expirationDate,
                "title": title,
                "description": description,
                "is_complete": complete
                ]])
        }
    }
    
}
