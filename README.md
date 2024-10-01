# Powerlevel10k `aws-vault` segment (GNU Compatibility)

This repository is a fork of the original [p10k-aws-vault-segment GitLab repository](https://gitlab.com/jonas-l/p10k-aws-vault-segment), modified for GNU compatibility. When using [`aws-vault`][aws-vault] to start a `zsh` for AWS session by running `aws-vault exec <profile> -- zsh`, this plugin provides an indicator in the [Powerlevel10k theme][p10k]'s prompt showing which AWS profile is currently active and notifies the user if the session is about to expire or has already expired.

## Installation

Download the plugin by cloning this repository:

```shell
git clone https://github.com/higher68/p10k-aws-vault-segment-for-gnu.git ~/.oh-my-zsh/custom/plugins/p10k-aws-vault-segment-for-gnu/

Edit ~/.zshrc by registering the new plugin: plugins=(... p10k-aws-vault-segment-for-gnu), and specifying where the new aws-vault segment will be presented, e.g. POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(aws_vault dir vcs). You can choose either POWERLEVEL9K_LEFT_PROMPT_ELEMENTS or POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS.

Existing prompt elements can be discovered by executing:

```shell
echo "$POWERLEVEL9K_LEFT_PROMPT_ELEMENTS"
```

You are now ready to start a new AWS session:

```shell
aws-vault exec <profile> -- zsh
```


## Configuration

### Running out of time threshold

The segment notifies (by changing segment's background color) when AWS session is running out of time and expires soon. By default this threshold is 5 minutes. It can be changed by setting `POWERLEVEL9K_AWS_VAULT_RUNNING_OUT_THRESHOLD_MINUTES` in `~/.zshrc`.

### Colors and icons

Segment has three states `WORKING`, `RUNNING_OUT`, and `EXPIRED`. You can adjust segment's appearance by setting the following environment variables in `~/.zshrc`: `POWERLEVEL9K_AWS_VAULT_{WORKING|RUNNING_OUT|EXPIRED}_{BACKGROUND|FOREGROUND|CONTENT_EXPANSION|VISUAL_IDENTIFIER_EXPANSION}` for background color, foreground color, text of the segment, and segment's icon respectively.


[aws-vault]: https://github.com/99designs/aws-vault
[p10k]: https://github.com/romkatv/powerlevel10k

