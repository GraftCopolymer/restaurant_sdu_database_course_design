package pic_bed

import (
	"bytes"
	"errors"
	"github.com/aliyun/aliyun-oss-go-sdk/oss"
	"log"
	"mime"
	"path/filepath"
	config2 "restaurant_backend/config"
	"restaurant_backend/logger"
	"sync"
)

// 全局单例
var picBedServiceImpl PicBedService = nil
var once sync.Once

type PicBedService interface {
	GetImageUrl(objectKey string) string
	UploadImage(data []byte, imageName string) (string, error)
}

type PicBed struct {
	bucket oss.Bucket
	urlExpiredTime int64 // 图片URL过期事件, 单位s
	SupportImageExtensions []string
}

func (bed PicBed) GetImageUrl(objectKey string) string {
	signedUrl, err := bed.bucket.SignURL(objectKey, oss.HTTPGet, bed.urlExpiredTime)
	if err != nil {
		logger.Logger().Error("Failed to get signed image url %v", err)
		return ""
	}
	return signedUrl
}

func (bed PicBed) UploadImage(data []byte, imageName string) (string, error) {
	objectKey := filepath.Join("image", imageName)
	extension := filepath.Ext(objectKey)
	support := false
	// 检查是否是支持的图片类型
	for _, v := range bed.SupportImageExtensions {
		if v == extension {
			support = true
			break
		}
	}
	if !support {
		return "", errors.New("Do not support " + extension + " image type.")
	}

	uploadOptions := []oss.Option{
		oss.ContentType(mime.TypeByExtension(extension)),
	}
	err := bed.bucket.PutObject(objectKey, bytes.NewReader(data), uploadOptions...)
	// 拼接objectKey
	if err != nil {
		logger.Logger().Error("Failed to upload image to oss %v", err)
		return "", err
	}
	return objectKey, nil
}

func GetPicBedService() PicBedService {
	once.Do(func() {
		provider := NewYamlCredentialProvider()
		clientOptions := []oss.ClientOption{oss.SetCredentialsProvider(provider)}
		clientOptions = append(clientOptions, oss.Region(config2.Config.PicBed.Region))
		clientOptions = append(clientOptions, oss.AuthVersion(oss.AuthV4))
		client, err := oss.New(config2.Config.PicBed.Endpoint, "", "", clientOptions...)
		if err != nil {
			log.Fatal("Failed to init pic bed service")
		}
		// 获取储存桶
		bucket, err := client.Bucket(config2.Config.PicBed.BucketName)
		if err != nil {
			log.Fatal("Failed to obtain oss bucket")
		}
		picBedServiceImpl = &PicBed{
			bucket: *bucket,
			urlExpiredTime: config2.Config.PicBed.UrlExpiredTime,
			SupportImageExtensions: []string{".jpg", ".jpeg", ".png"},
		}
	})
	return picBedServiceImpl
}