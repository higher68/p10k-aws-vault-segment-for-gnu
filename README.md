# Powerlevel10k `aws-vault` segment

When using [`aws-vault`][aws-vault] to start a `zsh` for AWS session by running `aws-vault exec <profile> -- zsh` this plugin provides indicator in [Powerlevel10k theme][p10k]'s prompt what AWS profile is currently on and notifies in case the session expires.


## Installation

Download plugin by cloning this repository:

```shell
git clone https://gitlab.com/jonas-l/p10k-aws-vault-segment.git ~/.oh-my-zsh/custom/plugins/p10k-aws-vault-segment/
```

Edit `~/.zshrc` by registering a new plugin: `plugins=(... p10k-aws-vault-segment)`, and specifying where new `aws-vault` segment will be presented, e.g. `POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(aws_vault dir vcs)`. You can choose either `POWERLEVEL9K_LEFT_PROMPT_ELEMENTS` or `POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS`.

Existing prompt elements can be discovered by executing:

```shell
echo "$POWERLEVEL9K_LEFT_PROMPT_ELEMENTS"
```

You are now ready to start a new AWS session:

```shell
aws-vault exec <profile> -- zsh
```


## Configuration

The segment notifies (by changing segment's background color) when AWS session is running out of time and expires soon. By default this threshold is 5 minutes. It can be changed by setting `POWERLEVEL9K_AWS_VAULT_RUNNING_OUT_THRESHOLD_MINUTES` in `~/.zshrc`.


[aws-vault]: https://github.com/99designs/aws-vault
[p10k]: https://github.com/romkatv/powerlevel10k

