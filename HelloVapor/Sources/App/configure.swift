import NIOSSL
import Fluent
import FluentPostgresDriver
import Leaf
import Vapor

// configures your application
public func configure(_ app: Application) async throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    app.databases.use(.postgres(
        hostname: "localhost",
        port: 5432,
        username: "akhilkakarla",
        password: "",
        database: "studentsdb"
//        tls: .prefer(try .init(configuration: .clientDefault))
        )
    , as: .psql)

 //   app.migrations.add(CreateStudents())
 //   app.migrations.add(CreateFireIncidents())
    app.views.use(.leaf)


    // register routes
    try routes(app)
}
