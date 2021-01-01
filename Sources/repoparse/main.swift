import Foundation

// Getting repo
if let url = URL(string: "https://repo.packix.com/Packages") {
    do {
        let contents = try String(contentsOf: url)
   // Running the function 
var packaages = parseRepo(repo:contents);
print(packaages.count);

    } catch {
        // contents could not be loaded
    }
} else {
    // the URL was bad!
}

// Creating a blank struct for package
// Everything is optional as I don;t know whats required and what isnt so I just made everything optional
struct Package {
    var id:String?
    var name:String?
    var depends:String?
    var architecture:String?
    var description:String?
    var maintainer:String?
    var author:String?
    var section:String?
    var version:String?
    var installedSize:String?
    var tag:String?
    var icon:String?
    var depiction:String?
    var sileoDepiction:String?
    var filename:String?
    var SHA256:String?
    var MD5sum:String?
    var size:String? 
}
// Parses repo from input and returrns a list of packages
func parseRepo(repo: String) -> [Package]{
    // Creating a blank array of packages
    var packages = [Package]();
    // Converting to a string array thats seprated by \n\n
    let sep = repo.components(separatedBy: "\n\n");
    for pack in sep {
        packages.append(parsePackage(packageString: pack));
    }
    return packages;
}

func parsePackage(packageString: String) -> Package {
    // Creating blank package
    var package = Package();
    // Seprating by line to get key
    let lines = packageString.components(separatedBy: "\n")
    for line in lines {
        // Getting the key
        let key = line.components(separatedBy: ":");
        // Creating the package
        switch (key[0]) {
            case "Package": 
                package.id = key[1];
                break;
            case "Name":
                package.name = key[1];
                break;
            case "Depends":
                package.depends = key[1];
                break;
            case "Architecture":
                package.architecture = key[1];
                break;
            case "Description": 
                package.description = key[1];
                break;
            case "Maintainer":
                package.maintainer = key[1];
                break;
            case "Author":
                package.author = key[1];
                break;
            case "Section":
                package.section = key[1];
                break;
            case "Version":
                package.version = key[1];
                break;
            case "Installed-Size":
                package.installedSize = key[1];
                break;
            case "Tag":
                package.tag = key[1];
                break;
            case "Icon":
                package.icon = key[1];
                break;
            case "Depiction":
                package.depiction = key[1];
                break;
            case "SileoDepiction":
                package.sileoDepiction = key[1];
                break;
            case "Filename":
                package.filename = key[1];
                break;
            case "SHA256":
                package.SHA256 = key[1];
                break;
            case "MD5sum":
                package.MD5sum = key[1];
                break;
            case "Size":
                package.size = key[1];
                break;
            default:
                break;
            }
        }
    return package;

    }
