#!/bin/bash
trap "exit 1" TERM
export TOP_PID=$$

tag=$1

main() {
  echo "Release of version $tag is starting"
  check_tag_existence
  confirm "Are you sure you want to release this version? (y/n)"
  confirm "All uncommitted changes will be discarded. Do you want to continue? (y/n)"

  push_tag
  push_pod
}

check_tag_existence() {
  local existing_tag=$(git tag | grep -x "$tag")
  if [[ $existing_tag != "" ]]
  then
    echo "Tag $tag already exists."
    stop_script
  fi
}

push_tag() {
  git tag $tag
  local remote=$(get_remote)
  echo "Pushing tag $tag to $remote"
  git push $(get_remote) $tag
  echo "Tag pushed"
}

push_pod() {
  confirm "Make sure you are registered using a proper email to CocoaPods trunk. Continue? (y/n)"
  bundle exec fastlane set_podspec_version version:"$tag"
  bundle exec pod trunk push ModelValidator.podspec
  git reset --hard
  echo "Pod pushed"
}

confirm() {
  read -p "$1 " input
  if [[ $input = "y" || $input = "yes" || $input = "Y" || $input = "YES" ]]
  then
    echo "Releasing new version"
  else
    echo "Aborted release"
    stop_script
  fi
}

get_remote() {
  local remote_name=$(git remote | grep -x "origin")
  if [[ $remote_name != "" && $remote_name = "$(git remote | grep "")" ]]
  then
    echo $remote_name
    return 0
  fi
  until [[ $remote_name != "" ]]
  do
    read -p "Type remote name: " typed_remote
    remote_name=$(git remote | grep -x $typed_remote)
  done
  echo $remote_name
}

stop_script() {
  kill -s TERM $TOP_PID
}

main
