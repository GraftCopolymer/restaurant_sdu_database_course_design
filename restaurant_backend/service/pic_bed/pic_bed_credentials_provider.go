package pic_bed

import (
	"github.com/aliyun/aliyun-oss-go-sdk/oss"
	config2 "restaurant_backend/config"
)

type YamlCredentialProvider struct {
	config *oss.Config
}

func (ymp YamlCredentialProvider) GetCredentials() oss.Credentials {
	config := &oss.Config{
		AccessKeyID:     config2.Config.PicBed.AccessKeyId,
		AccessKeySecret: config2.Config.PicBed.AccessKeySecret,
		SecurityToken:   "",
	}
	return &YamlCredentialProvider{
		config,
	}
}

func (ymp YamlCredentialProvider) GetAccessKeyID() string {
	return ymp.config.AccessKeyID
}

func (ymp YamlCredentialProvider) GetAccessKeySecret() string {
	return ymp.config.AccessKeySecret
}

func (ymp YamlCredentialProvider) GetSecurityToken() string {
	return ymp.config.SecurityToken
}

func NewYamlCredentialProvider() YamlCredentialProvider {
	return YamlCredentialProvider{}
}