from time import time
from minio import Minio
from minio.error import S3Error

def main():
    # Create a client with the MinIO server playground, its access key
    # and secret key.
    client = Minio(
        "IPAddr:9000",
        access_key="test",
        secret_key="test12345",
        secure=False
    )
    ts = time()

    # Make 'asiatrip' bucket if not exist.
    found = client.bucket_exists("testupload")
    if not found:
        client.make_bucket("testupload")
    else:
        print("Bucket 'testupload' already exists")

    # Upload '/home/user/Photos/asiaphotos.zip' as object name
    # 'hello-world.txt' to bucket 'testupload'.
    client.fput_object(
        "testupload", "hello-world-{}.txt".format(ts), "/root/hello-world.txt",
    )
    print(
        "'hello-world-{}.txt' is successfully uploaded as object 'hello-world.txt' to bucket 'testupload'.".format(ts)
    )


if __name__ == "__main__":
    try:
        main()
    except S3Error as exc:
        print("error occurred.", exc)
