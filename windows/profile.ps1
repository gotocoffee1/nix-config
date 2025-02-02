$CONFIG_REPO = "{{CONFIG_REPO}}"
$ENV:STARSHIP_CONFIG = "$CONFIG_REPO\src\home\gotocoffee\shell\starship.toml"
Invoke-Expression (&starship init powershell)

