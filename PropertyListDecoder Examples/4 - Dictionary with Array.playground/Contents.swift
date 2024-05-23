import UIKit

struct PlaceResponse: Decodable {
    var places: [Place]
}

struct Place: Decodable {
    var name: String
    var latitude: Double
    var longitude: Double
    var visited: Bool
}

let xml = """
<?xml version= "1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN"
    "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>places</key>
    <array>
        <dict>
            <key>name</key>
            <string>San Jose, Costa Rica</string>
            <key>latitude</key>
            <real>9.56</real>
            <key>longitude</key>
            <real>84.5</real>
            <key>visited</key>
            <true/>
        </dict>
        <dict>
            <key>name</key>
            <string>San Juan, Puerto Rico</string>
            <key>latitude</key>
            <real>18.24</real>
            <key>longitude</key>
            <real>66.3</real>
            <key>visited</key>
            <false/>
        </dict>
        <dict>
            <key>name</key>
            <string>Mexico City, Mexico</string>
            <key>latitude</key>
            <real>19.26</real>
            <key>longitude</key>
            <real>99.8</real>
            <key>visited</key>
            <true/>
        </dict>
    </array>
</dict>
</plist>
""".data(using: .utf8)!

let response = try! PropertyListDecoder().decode(PlaceResponse.self, from: xml)

print(response)
print(response.places)
print(response.places[0])
print(response.places[0].name)
print(response.places[0].visited)

let dict = try! PropertyListDecoder().decode([String : [Place]].self, from: xml)
print(dict["places"]!)

