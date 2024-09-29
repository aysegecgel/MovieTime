//
//  NetworkConstant.swift
//  MovieTime
//
//  Created by Ayse Gecgel on 31.08.2024.
//

import Foundation

class NetworkConstant{
    
    public static var shared: NetworkConstant = NetworkConstant()
    
    private init(){
        
    }
    
    
    public var apiKey: String {
        
        get{
            //d50843c16104f2447a186e3ff19f3918
            return "91540bd9c5f66b73ecfbef341a5bcd5f"
        }
    }
    
    public var serverAdress: String {
        get {
            return "https://api.themoviedb.org/3/"
        }
    }
    
    public var imageServerAdress: String {
        get{
            return "https://image.tmdb.org/t/p/w500/"
        }
    }
}
