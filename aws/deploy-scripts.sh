PROJECT_NAME="mythical-mysfit"
AWS_REGION="$(aws configure get region)"
DIR1="$( pwd )"
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
file_path="file://$DIR/app-bucket-policy.json"

BUCKET_POLICY_PATH=$DIR
FRONTEND_PATH="$DIR/../frontend"
FRONTEND_BUILD_PATH="$FRONTEND_PATH/dist"
if [[ -z "$AWS_REGION" ]]; then
    AWS_REGION="us-west-2"
fi
# #S3_BUCKET_NAME="mysfit-bucket-2020" -- existing bucket
# #new bucket
S3_BUCKET_NAME="$PROJECT_NAME-frontend-$(aws sts get-caller-identity --query Account --output text)"
cd $FRONTEND_PATH && \
npm run build --prod
aws s3 mb s3://$S3_BUCKET_NAME --region $AWS_REGION || true
aws s3 website s3://$S3_BUCKET_NAME --index index.html --error index.html
aws s3api put-bucket-policy --bucket $S3_BUCKET_NAME --policy $file_path

aws s3 rm s3://$S3_BUCKET_NAME --recursive
aws s3 cp $FRONTEND_BUILD_PATH s3://$S3_BUCKET_NAME --acl public-read --recursive

S3_BUCKET_LOCATION=$(aws s3api get-bucket-location s3://$S3_BUCKET_NAME --query LocationConstraint --output text)

if [ !S3_BUCKET_LOCATION = "NONE" ]; then
    echo "YOur Project at http://$S3_BUCKET_NAME.s3-website.$S3_BUCKET_LOCATION.amazonaws.com"
else
    echo "YOur Project at http://$S3_BUCKET_NAME.s3-website.us-east-1.amazonaws.com"
fi

#echo $file_path
# FRONTEND_BUILD_PATH = 
# echo $0

# full_path=$(realpath $0)
# dir_path=$(dirname $full_path)
# echo $dir_path

# echo "$(dirname $(dirname $(realpath $0)))/aws"

# count=5
# while [ $count -lt 10 ]; do
#     echo $count
#     sleep 1
#     count=$(($count+ 1))
# done

#echo ${BASH_SOURCE[0]}