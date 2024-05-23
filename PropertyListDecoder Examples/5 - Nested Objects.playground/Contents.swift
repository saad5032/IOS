import UIKit

struct CustomerResponse: Decodable {
    var customers: [Customer]
}

struct Customer: Decodable {
    var firstName: String
    var lastName: String
    var address: Address
    
    // the keys of dictiionary are all lowecase with underscores(snake case), so we use this enum to correctly correspond to ther struct properties above.
    private enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
        case address = "address"
    }
}

struct Address: Decodable {
    var street: String
    var city: String
    var state: String
    var geo: Geo
}

struct Geo: Decodable {
    var latitude: Double
    var longitude: Double
}

let xml = """
<?xml version= "1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN"
    "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>customers</key>
    <array>
        <dict>
            <key>first_name</key>
            <string>John</string>
            <key>last_name</key>
            <string>Doe</string>
            <key>address</key>
            <dict>
                <key>street</key>
                <string>1200 Richmond Ave</string>
                <key>city</key>
                <string>Houston</string>
                <key>state</key>
                <string>TX</string>
                <key>geo</key>
                <dict>
                    <key>latitude</key>
                    <real>34.56</real>
                    <key>longitude</key>
                    <real>35.56</real>
                </dict>
            </dict>
        </dict>
        <dict>
            <key>first_name</key>
            <string>Ann</string>
            <key>last_name</key>
            <string>Smith</string>
            <key>address</key>
            <dict>
                <key>street</key>
                <string>800 S Loomis St</string>
                <key>city</key>
                <string>Chicago</string>
                <key>state</key>
                <string>IL</string>
                <key>geo</key>
                <dict>
                    <key>latitude</key>
                    <real>41.52</real>
                    <key>longitude</key>
                    <real>87.37</real>
                </dict>
            </dict>
        </dict>
    </array>
</dict>
</plist>
""".data(using: .utf8)!

let response = try! PropertyListDecoder().decode(CustomerResponse.self, from: xml)

print(response)
print(response.customers)
print(response.customers[0])
print(response.customers[0].firstName)
print(response.customers[0].address)
print(response.customers[0].address.street)
print(response.customers[0].address.geo)
print(response.customers[0].address.geo.longitude)

