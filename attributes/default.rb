# Install ZSH
default['symfony']['zsh'] = true

# Base directory
default['symfony']['shared']['directory'] = "/var/www"

# Symfony Version
default['symfony']['shared']['version'] = "2"

# User/Group for Permissions
default['symfony']['shared']['user'] = "www-data"
default['symfony']['shared']['group'] = "www-data"

# Application folder structure
default['symfony']['shared']['app_name'] = "app"
default['symfony']['shared']['app_directories'] = [
    "config",
    "logs",
    "spool",
    "cache"
]

default['symfony']['shared']['directories'] = [
    "web"
]

default['symfony']['sites'] = {}