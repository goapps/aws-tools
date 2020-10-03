# aws-tools
Set of AWS scripts for some common use cases.

## Before setup
`aws-auth` uses the aws cli to complete authentication, make sure you have this configured first.

For example within aws cli folder which defaults to ~/.aws/ there should be two files `config` & `creditionals` these are created when you add a profile. You will need a named profile created for each profile you want to mfa against.

The profile should have a region and mfa serial set in `config`

```
// config
[default]
region = us-east-1
mfa_serial = 
```

Initially in creditionals there should be your key and secret which will be used each time, when `aws-cli` first loads it creates an additional profile in `creditionals` named <profile_name>-mfa ie default-mfa.

```
// creditionals
[default]
aws_access_key_id = 123456890ABC
aws_secret_access_key = 0987654321CBA
```


## aws-auth
`aws-auth` - Makes it easer to manage multiple aws profiles.

### install
To install run these commands:

Copy `aws-auth` to a folder within your $PATH (Mac OS example belo

`cp aws-auth /usr/local/bin/`

Install man page

`install -g 0 -o 0 -m 0644 aws-auth.1 /usr/local/man/man1/`

`gzip /usr/local/man/man1/aws-auth.1`

### exit codes
10 = AWS cli not installed