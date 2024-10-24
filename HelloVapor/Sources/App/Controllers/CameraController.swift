//
//  File.swift
//  
//
//  Created by akhil kakarla on 8/25/24.
//

import Foundation
import Fluent
import FluentPostgresDriver
import Vapor

struct CameraController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
        let cameras = routes.grouped("cameras")

        cameras.get(use: self.index)
        cameras.post(use: self.create)
        cameras.group(":ID") { camera in
            camera.delete(use: self.delete)
        }
    }

    
    @Sendable
    func index(req: Request) async throws -> [CameraDTO] {
        try await Camera.query(on: req.db).all().map { $0.toDTO() }
    }

    @Sendable
    func create(req: Request) async throws -> CameraDTO {
        let camera = try req.content.decode(CameraDTO.self).toModel()

        try await camera.save(on: req.db)
        return camera.toDTO()
    }

    @Sendable
    func delete(req: Request) async throws -> HTTPStatus {
        guard let cameraFind = try await Camera.find(req.parameters.get("CameraID"), on: req.db) else {
            throw Abort(.notFound)
        }

        try await cameraFind.delete(on: req.db)
        return .noContent
    }
 
}
