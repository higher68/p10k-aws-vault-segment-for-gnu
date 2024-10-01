function prompt_aws_vault() {
  if [ -z "$AWS_VAULT" ]; then
    return # aws-vault session is not active
  fi

  # Get the current UTC time
  local current_time
  current_time=$(date -u +'%Y-%m-%dT%H:%M:%SZ')

  # Convert the current time to epoch seconds
  local current_epoch
  current_epoch=$(date -u --date="$current_time" '+%s')

  # Convert AWS credential expiration time to epoch seconds
  local expiration_epoch
  expiration_epoch=$(date -u --date="$AWS_CREDENTIAL_EXPIRATION" '+%s')

  # Calculate the number of seconds until the expiration time
  local seconds_until_expiration
  seconds_until_expiration=$((expiration_epoch - current_epoch))

  # Calculate the number of minutes until the expiration time
  local minutes_until_expiration
  minutes_until_expiration=$((seconds_until_expiration / 60))

  # Switch the display segment based on the expiration status
  if [ "$seconds_until_expiration" -le 0 ]; then
    p10k segment -s EXPIRED -b red -f white -i '🌧️' -t " $AWS_VAULT"
  elif [ "$minutes_until_expiration" -lt "${POWERLEVEL9K_AWS_VAULT_RUNNING_OUT_THRESHOLD_MINUTES:-5}" ]; then
    p10k segment -s RUNNING_OUT -b red -f white -i '⛅' -t " $AWS_VAULT"
  else
    p10k segment -s WORKING -b yellow -i '☀️' -t " $AWS_VAULT"
  fi
}
