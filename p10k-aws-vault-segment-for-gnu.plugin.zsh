function prompt_aws_vault() {
  if [ -z "$AWS_VAULT" ]; then
    return # aws-vault session is not active
  fi

  local current_time
  current_time=`date -u +'%Y-%m-%dT%H:%M:%SZ'`
  local current_epoch
  current_epoch=`date -j -u -f '%Y-%m-%dT%H:%M:%SZ' "$current_time" '+%s'`

  local expiration_epoch
  expiration_epoch=`date -j -u -f '%Y-%m-%dT%H:%M:%SZ' "$AWS_CREDENTIAL_EXPIRATION" '+%s'`

  local seconds_until_expiration
  seconds_until_expiration=`expr "$expiration_epoch" '-' "$current_epoch"`

  local minutes_until_expiration
  minutes_until_expiration=`expr "$seconds_until_expiration" '/' 60`

  if [ "$seconds_until_expiration" -le 0 ]; then
    p10k segment -s EXPIRED -b red -f white -i '☀️' -t " $AWS_VAULT"
  elif [ "$minutes_until_expiration" -lt "${POWERLEVEL9K_AWS_VAULT_RUNNING_OUT_THRESHOLD_MINUTES:-5}" ]; then
    p10k segment -s RUNNING_OUT -b red -f white -i '⛅' -t " $AWS_VAULT"
  else
    p10k segment -s WORKING -b yellow -i '☁️' -t " $AWS_VAULT"
  fi
}

