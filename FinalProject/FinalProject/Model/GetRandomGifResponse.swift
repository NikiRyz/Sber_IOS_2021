//
//  GetRandomGifResponse.swift
//  FinalProject
//
//  Created by 18267440 on 13.07.2021.
//


struct GetRandomGifResponse: Decodable{
    let data:ResponseData
    let meta:ResponseMeta
}

struct ResponseData: Decodable{
    let title: String
    let images: ResponseDataImg
}

struct ResponseMeta: Decodable{
    let status: String
    let msg:String
}

struct ResponseDataImg: Decodable{
    let fixedHeightSmall: Url
}

struct Url: Decodable{
    let url: String
}
 

