#/bin/sh

DOCKER_REPOSITORY="michalfoksa/postres-with-admin"
printf "Repository name: $DOCKER_REPOSITORY\n\n"

IMAGE_ID=`cat build-image-id.txt`
printf "Working with image id:\n$IMAGE_ID\n\n"

# -r prevents backslash escapes from being interpreted.
# || [[ -n $line ]] prevents the last line from being ignored if it doesn't end
# with a \n (since read returns a non-zero exit code when it encounters EOF).

printf "Stamping image with following tags:\n"
while IFS='' read -r TAG || [[ -n "$TAG" ]]; do
  echo $TAG
  docker tag $IMAGE_ID $DOCKER_REPOSITORY:$TAG
done < .dockertag
