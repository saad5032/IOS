import UIKit

struct Customer: Decodable {
    var firstName: String
    var lastName: String
    var age: Int
}

let xml = """
<?xml version= "1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN"
    "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>firstName</key>
    <string>John</string>
    <key>lastName</key>
    <string>Doe</string>
    <key>age</key>
    <integer>34</integer>
</dict>
</plist>
""".data(using: .utf8)!

let customer = try! PropertyListDecoder().decode(Customer.self, from: xml)
print(customer)
print(customer.age)
