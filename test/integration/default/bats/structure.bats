#!/usr/bin/env bats

@test "/var/www/ is present" {
  run ls -l /var/www/
  [ "$status" -eq 0 ]
}

@test "release structure exists " {
  run ls -l /var/www/standard/current
  run ls -l /var/www/standard/releases
  run ls -l /var/www/standard/shared
  [ "$status" -eq 0 ]
}

@test "Test Shared folder structure" {
  run ls -l /var/www/standard/shared/app/config
  run ls -l /var/www/standard/shared/app/logs
  run ls -l /var/www/standard/shared/app/cache
  run ls -l /var/www/standard/shared/app/spool
  [ "$status" -eq 0 ]
}

@test "Test Custom folder structure" {
  run ls -l /var/www/custom/current
  run ls -l /var/www/custom/releases
  run ls -l /var/www/custom/shared
  run ls -l /var/www/custom/shared/app/config
  run ls -l /var/www/custom/shared/app/logs
  run ls -l /var/www/custom/shared/app/cache
  run ls -l /var/www/custom/shared/app/spool
  run ls -l /var/www/custom/shared/web_public/uploads
  [ "$status" -eq 0 ]
}
