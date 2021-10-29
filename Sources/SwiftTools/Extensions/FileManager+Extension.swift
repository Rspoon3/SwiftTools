//
//  File+Extension.swift
//  
//
//  Created by Richard Witherspoon on 9/19/19.
//

import Foundation

public extension FileManager{
    static var documentsDirectory : URL{
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first! as URL
    }
    
    static var tempDirectory : String{
        return NSTemporaryDirectory()
    }
    
    static var cachesDirectory : URL{
        return FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first! as URL
    }
    
    static func filePathInDocumentsDirecotry(fileName: String)->URL{
        return FileManager.documentsDirectory.appendingPathComponent(fileName)
    }
    
    static func fileExistsInDocumentsDirectory(fileName: String)-> Bool{
        let path = filePathInDocumentsDirecotry(fileName: fileName).path
        return FileManager.default.fileExists(atPath: path)
    }
    
    static func deleteFileInDocumentsDirectory(fileName: String){
        let path = filePathInDocumentsDirecotry(fileName: fileName).path
        do {
            try FileManager.default.removeItem(atPath: path)
            print("FILE: \(path) was deleted!")
        } catch {
            print("ERROR: \(error) - For File: \(path)")
        }
    }
    
    static func contentsOfDir(url:URL) -> [String]{
        do{
            if let paths = try FileManager.default.contentsOfDirectory(atPath: url.path) as [String]?{
                return paths
            } else {
                print("none found")
                return [String]() //return emptry array of strings
            }
        } catch {
            print("Error: \(error)")
            return [String]() //return emptry array of Strings on error
        }
    }
    
    static func clearDocumentsFolder() {
        let fileManager = FileManager.default
        let docsFolderPath = FileManager.documentsDirectory.path
        
        do{
            let filePaths = try fileManager.contentsOfDirectory(atPath: docsFolderPath)
            for filePath in filePaths{
                try fileManager.removeItem(atPath: docsFolderPath + "/" + filePath)
            }
            print("Cleared Documents folder")
        } catch{
            print("Could not clear Documents folder: \(error)")
        }
    }
}


