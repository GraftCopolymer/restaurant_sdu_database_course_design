package rpc_impl

import (
	"errors"
	"google.golang.org/grpc"
	"io"
	restaurant_rpc "restaurant_backend/restaurant_backend/rpc"
	"restaurant_backend/service/pic_bed"
)

type FileServer struct {
	restaurant_rpc.UnimplementedFileServiceServer
}

func (s *FileServer) UploadImage(stream grpc.ClientStreamingServer[restaurant_rpc.UploadImageRequest, restaurant_rpc.UploadImageResponse]) error {
	var filename string
	var fileBytes []byte

	for {
		req, err := stream.Recv()
		if err == io.EOF {
			// 上传完成, 保存文件
			if len(fileBytes) <= 0 { // 没有接收到图片数据
				return nil
			}
			// 上传至图床
			objectKey, uploadErr := pic_bed.GetPicBedService().UploadImage(fileBytes, filename)
			if uploadErr != nil {
				return errors.New("服务器错误")
			}
			imageUrl, ok := pic_bed.GetPicBedService().GetImageUrl(objectKey)
			if !ok || len(imageUrl) == 0 {
				return errors.New("获取图片链接失败")
			}
			return stream.SendAndClose(&restaurant_rpc.UploadImageResponse{
				Message: "上传成功",
				Success: true,
				Url: imageUrl,
			})
		}
		if err != nil {
			return errors.New("图片上传失败")
		}

		if req.FileName != "" && filename == "" { // 接收文件名
			filename = req.FileName
		}

		fileBytes = append(fileBytes, req.Chunk...)
	}
}
