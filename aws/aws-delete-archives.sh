#!/bin/bash

AWS_ACCOUNT_ID=$1
AWS_REGION=$2
AWS_VAULT_NAME=$3
file=$4

 if [[ -z ${AWS_ACCOUNT_ID} ]] || [[ -z ${AWS_REGION} ]] || [[ -z ${AWS_VAULT_NAME} ]]; then
	echo "Please set the following environment variables: "
	echo "AWS_ACCOUNT_ID"
	echo "AWS_REGION"
	echo "AWS_VAULT_NAME"
	exit 1
fi

archive_ids=$(jq .ArchiveList[].ArchiveId < $file)

for archive_id in ${archive_ids}; do
    echo "Deleting Archive: ${archive_id}"
    aws glacier delete-archive --archive-id=${archive_id} --vault-name ${AWS_VAULT_NAME} --account-id ${AWS_ACCOUNT_ID} --region ${AWS_REGION}
done

echo "Finished deleting archives"