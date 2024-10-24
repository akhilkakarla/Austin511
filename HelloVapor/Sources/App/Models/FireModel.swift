//
//  File.swift
//  
//
//  Created by akhil kakarla on 8/7/24.
//

import Foundation
import Fluent
import struct Foundation.UUID

/// Property wrappers interact poorly with `Sendable` checking, causing a warning for the `@ID` property
/// It is recommended you write your model with sendability checking on and then suppress the warning
/// afterwards with `@unchecked Sendable`.
final class FireModel: Model, @unchecked Sendable {
    
    static let schema = "fireincidents"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "incidentid")
    var incidentid: String
    
    @Field(key: "yearnum")
    var yearnum: String
    
    @Field(key: "date")
    var date: String
    
    @Field(key: "problem")
    var problem: String
    
    @Field(key: "priority")
    var priority: String
    
    init() { }
    
    init(id: UUID? = nil, incidentid: String, yearnum: String, date: String, problem: String, priority: String) {
        self.id = id
        self.incidentid = incidentid
        self.yearnum = yearnum
        self.date = date
        self.problem = problem
        self.priority = priority
    }
    
    
    func toDTO() -> FireDTO {
        .init(
            id: self.id,
            incidentid: self.incidentid,
            yearnum: self.yearnum,
            date: self.date,
            problem: self.problem,
            priority: self.priority
        )
    }
}
