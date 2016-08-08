STREAM_NAME=$1
SHARD_INDEX=${2:-0}
SHARD_ITERATOR_TYPE=${SHARD_ITERATOR_TYPE:-LATEST} # TRIM_HORIZON
aws kinesis get-records \
    --shard-iterator $(aws kinesis get-shard-iterator \
                           --shard-id $(aws kinesis describe-stream \
                                            --stream-name ${STREAM_NAME} \
                                            --output text \
                                            --query "StreamDescription.Shards[${SHARD_INDEX}].ShardId") \
                           --shard-iterator-type ${SHARD_ITERATOR_TYPE} \
                           --stream-name ${STREAM_NAME} \
                           --query "ShardIterator" \
                           --output text)
