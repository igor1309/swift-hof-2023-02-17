public enum FileAction {
    
    public struct Open: Action {
        
        public let file: File
        
        public init(_ file: File) {
            self.file = file
        }
    }
    
    public struct Close: Action {
        public init() {}
    }
    
    public struct Lock: Action {
        public init() {}
    }
}

public struct File {
    
    public let name: String
    public let ext: String
    
    public init(name: String, ext: String) {
        self.name = name
        self.ext = ext
    }

    public static func textFile(named name: String) -> Self {
        
        .init(name: name, ext: "txt")
    }
}
