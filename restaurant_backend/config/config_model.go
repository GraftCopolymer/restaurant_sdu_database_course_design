package config

type ConfigModel struct {
	PicBed struct{
		AccessKeyId string `yaml:"accessKeyId"`
		AccessKeySecret string `yaml:"accessKeySecret"`
		BucketName string `yaml:"bucketName"`
		Endpoint string `yaml:"endpoint"`
		Region string `yaml:"region"`
		UrlExpiredTime int64 `yaml:"urlExpiredTime"`
	} `yaml:"pic_bed"`
}