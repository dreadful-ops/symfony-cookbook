#!/usr/bin/env bats

@test "/var/www/ is present" {
  run ls -l /var/www/
  [ "$status" -eq 0 ]
}

@test "release structure exists " {
  run ls -l /var/www/standard/current
  [ "$status" -eq 0 ]
}

@test "Test Shared folder structure" {
  run ls -l /var/www/standard/shared/app/config
  [ "$status" -eq 0 ]
}

@test "Test Custom folder structure" {
  run ls -l /var/www/custom/shared/app_us/config
  [ "$status" -eq 0 ]
}
