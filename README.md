# Run

## Backend

The backend project use alibaba's OSS as the picture store, so you need to provide your own OSS info.

To run the backend program, you need to create `config.yaml` file to the root path of **backend project**. Add the following content to your `config.yaml`: 

```yaml
pic_bed:
  accessKeyId: your_access_key_id
  accessKeySecret: your_access_key_secret
  bucketName: your_bucket_name
  endpoint: your_bucket_endpoint
  region: your_bucket_region
  urlExpiredTime: 86400 # the expired time of image url, you can decide it by yourself
```