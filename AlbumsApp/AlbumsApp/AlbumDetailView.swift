//
//  AlbumDetailView.swift
//  AlbumsApp
//
//  Created by 박지영 on 2021/07/08.
//

import SwiftUI

struct AlbumDetailView: View {
    var album: Album
    @State var image: Image?
    var body: some View {
        NavigationLink(destination: AlbumDetailView(album: album)){
            HStack{
                loadAlbumImage()
                    .resizable()
                    .frame(width: 100, height: 100, alignment: .center)
                VStack(alignment: .leading){
                    Text(album.albumTitle)
                        .font(.headline)
                        .foregroundColor(.argb(0xFF283747))
                        .frame(height: 60)
                    Text(album.artistName)
                        .font(.caption)
                        .foregroundColor(.argb(0xFF333333))
                        .lineLimit(1)
                }
            }
        }
    }
    func loadAlbumImage() -> Image {
        if image != nil{
            return image!
        }
//        if let image = image{
//            return image
//        }
        return ImageStore.load(strUrl: album.image) { image in
            self.image = image
        }
    }
}

struct AlbumDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumDetailView(album: Album(albumTitle : "위험한 상견례 OST Part 2", artistName: "이시영", image : "http://scgyong.net/thumbs/slow.php/204_192546.jpg"))
    }
}
