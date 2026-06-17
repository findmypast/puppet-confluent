# Creates the repositories for installation.
#
#
class confluent::repository {
  case $facts['os']['family'] {
    'RedHat': {
      include ::confluent::repository::redhat
    }
    'Debian': {
      include ::confluent::repository::debian
    }
    default: {
      fail("${facts['os']['family']} is not supported.")
    }
  }
}
