// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation
import OpenAPIRuntime
import OpenAPIVapor
import Vapor

struct Handler: APIProtocol {
    func getInfoPage(_ input: Operations.getInfoPage.Input) async throws -> Operations.getInfoPage.Output {
        return .ok(Operations.getInfoPage.Output.Ok(body: .text("""
        <!doctype html>
        <html>
            <head>
                <meta charset="utf-8">
                <title>Screenlogger</title>
            <style type="text/css">
            /* CSS styles here... */
            </style>
            </head>
            
            <body>
                <h1>linusbw's advanced screenlogger</h1>
                <p>This is a proof of concept of a basic "screenlogger" using Shortcuts and Flask.</p>
                <p>This is the server for the application, the client side is a Shortcuts automation with the content of <a href="static/Screenlogger.shortcut" action="download" >this shortcut</a>. The trigger for the automation can be anything, although I recommend "When App Opened", as it can run fully in the background.</p>
                <h2>Most recent image</h2>
                <img src="static/recent.png" />
            
            </body>
            
        </html>
        """)))
    }
    
    func addImage(_ input: Operations.addImage.Input) async throws -> Operations.addImage.Output {
        return .created(Operations.addImage.Output.Created(body: .text("Image Uploaded.")))
    }
    
    
}

@main
struct CatService {
    public static func main() throws {
        let app = Vapor.Application()
        let transport = VaporTransport(routesBuilder: app)
        let handler = Handler()
        try handler.registerHandlers(on: transport, serverURL: URL(string: "0.0.0.0")!)
        try app.run()
    }
}
