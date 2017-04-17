import Vapor

let drop = Droplet()

drop.get("fbwebhook") { request in
    print("get webhook")
    guard let token = request.data["hub.verify_token"]?.string else {
        throw Abort.badRequest
    }
    guard let response = request.data["hub.challenge"]?.string else {
        throw Abort.badRequest
    }
    
    if token == "2318934571" {
        print("send response")
        return response(status: .ok, body: response)
    } else {
        return response(status: .ok, body: "Error, invalid token")
    }
}

drop.run()

