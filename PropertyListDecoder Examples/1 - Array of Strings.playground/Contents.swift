import UIKit


// rememeber string is an object and we can call methods on it.
let xml = """
<?xml version= "1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN"
    "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<array>
    <string>chicken</string>
    <string>cow</string>
    <string>alligator</string>
    <string>elephant</string>
    <string>dolphin</string>
    <string>dog</string>
    <string>cat</string>
</array>
</plist>
""".data(using: .utf8)!
// data method of string converts string to binary 1,0


// there is a class called PropertyListdecoder (PropertyListDecoder()) also there is a class called Property list encoder which turns text to property list. Normally you can modify property list and re encode, but is not a good practise, if data is to be changed dynamically for this we use core data.

// from: xml --> i am decoding this xml defined above using let contant, to array of strings that is to ,
// string data type - [String].self -->
let array = try! PropertyListDecoder().decode([String].self, from: xml)
print(array)
print(array[0])
