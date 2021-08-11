# Class is used to install the core Kafka packages.
#
# @example Installing the Kafka packages.
#   include ::confluent::kafka
#
#
# @param package_ensure Ensure to be passed to the package installation.
# @param package_name Name of the package to install. This rarely needs to be changed unless you need to install a different version of Scala.
class confluent::kafka (
  String $package_name   = $confluent::params::kafka_package_name,
  String $package_ensure = $confluent::params::kafka_package_ensure,
  String $common_package_name = $confluent::params::common_package_name,
  String $common_package_ensure = $confluent::params::common_package_ensure,
  String $rest_utils_package_name = $confluent::params::rest_utils_package_name,
  String $rest_utils_package_ensure = $confluent::params::rest_utils_package_ensure,
) inherits confluent::params {
  include ::confluent

  package { $package_name:
    ensure => $package_ensure,
    tag    => '__confluent__',
  }

  package { $common_package_name:
    ensure => $common_package_ensure,
    tag    => '__confluent__',
  }

  package { $rest_utils_package_name:
    ensure => $rest_utils_package_ensure,
    tag    => '__confluent__',
  }
}
