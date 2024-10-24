//
//  File.swift
//
//
//  Created by akhil kakarla on 9/1/24.
//

import Foundation
import Fluent
import FluentPostgresDriver
import Vapor

struct TrafficIncidentsController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
        let traffic_incidents = routes.grouped("traffic_incidents")

        traffic_incidents.get(use: self.index)
        traffic_incidents.post(use: self.create)
        traffic_incidents.group(":ID") { traffic_incident in
            traffic_incidents.delete(use: self.delete)
        }
    }

    
    @Sendable
    func index(req: Request) async throws -> [TrafficIncidentsDTO] {
        try await TrafficIncidents.query(on: req.db).all().map { $0.toDTO() }
    }

    @Sendable
    func create(req: Request) async throws -> TrafficIncidentsDTO {
        let traffic_incident = try req.content.decode(TrafficIncidentsDTO.self).toModel()

        try await traffic_incident.save(on: req.db)
        return traffic_incident.toDTO()
    }

    @Sendable
    func delete(req: Request) async throws -> HTTPStatus {
        guard let incidentFind = try await TrafficIncidents.find(req.parameters.get("ID"), on: req.db) else {
            throw Abort(.notFound)
        }

        try await incidentFind.delete(on: req.db)
        return .noContent
    }
 
}


