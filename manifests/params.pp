# Default parameters for the installation.
#
#
class confluent::params {
  $confluent_version = '3.2'
  $manage_repository = true
  $connect_distributed_user = 'connect-distributed'
  $connect_distributed_service = 'connect-distributed'
  $connect_distributed_manage_service = true
  $connect_distributed_service_ensure = 'running'
  $connect_distributed_service_enable = true
  $connect_distributed_file_limit = 128000
  $connect_distributed_config_path = '/etc/kafka/connect-distributed.properties'
  $connect_distributed_log_path = '/var/log/kafka-connect-distributed'
  $connect_distributed_stop_timeout_secs = 300
  $connect_distributed_heap_size = '512m'

  $connect_standalone_user = 'connect-standalone'
  $connect_standalone_service = 'connect-standalone'
  $connect_standalone_manage_service = true
  $connect_standalone_service_ensure = 'running'
  $connect_standalone_service_enable = true
  $connect_standalone_file_limit = 128000
  $connect_standalone_config_path = '/etc/kafka/connect-standalone.properties'
  $connect_standalone_log_path = '/var/log/kafka-connect-standalone'
  $connect_standalone_stop_timeout_secs = 300
  $connect_standalone_heap_size = '512m'

  $kafka_user = 'kafka'
  $kafka_service = 'kafka'
  $kafka_manage_service = true
  $kafka_service_ensure = 'running'
  $kafka_service_enable = true
  $kafka_file_limit = 128000
  $kafka_config_path = '/etc/kafka/server.properties'
  $kafka_log_path = '/var/log/kafka'
  $kafka_data_path = '/var/lib/kafka'
  $kafka_stop_timeout_secs = 300
  $kafka_heap_size = '1024m'

  $zookeeper_user = 'zookeeper'
  $zookeeper_service = 'zookeeper'
  $zookeeper_manage_service = true
  $zookeeper_service_ensure = 'running'
  $zookeeper_service_enable = true
  $zookeeper_file_limit = 128000
  $zookeeper_config_path = '/etc/kafka/zookeeper.properties'
  $zookeeper_log_path = '/var/log/zookeeper'
  $zookeeper_data_path = '/var/lib/zookeeper'
  $zookeeper_stop_timeout_secs = 300
  $zookeeper_heap_size = '512m'

  $schema_registry_user = 'schema-registry'
  $schema_registry_service = 'schema-registry'
  $schema_registry_manage_service = true
  $schema_registry_service_ensure = 'running'
  $schema_registry_service_enable = true
  $schema_registry_file_limit = 128000
  $schema_registry_config_path = '/etc/schema-registry/schema-registry.properties'
  $schema_registry_log_path = '/var/log/schema-registry'
  $schema_registry_stop_timeout_secs = 300
  $schema_registry_heap_size = '512m'

  $control_center_user = 'control-center'
  $control_center_service = 'control-center'
  $control_center_manage_service = true
  $control_center_service_ensure = 'running'
  $control_center_service_enable = true
  $control_center_file_limit = 128000
  $control_center_config_path = '/etc/confluent-control-center/control-center.properties'
  $control_center_log_path = '/var/log/control-center'
  $control_center_data_path = '/var/lib/control-center'
  $control_center_stop_timeout_secs = 300
  $control_center_heap_size = '3096m'

  $kafka_package_name = 'confluent-kafka-2.11'

  case $::osfamily {
    'RedHat': {
      $connect_distributed_environment_path = '/etc/sysconfig/kafka-connect-distributed'
      $connect_standalone_environment_path = '/etc/sysconfig/kafka-connect-standalone'
      $kafka_environment_path = '/etc/sysconfig/kafka'
      $zookeeper_environment_path = '/etc/sysconfig/zookeeper'
      $schema_registry_environment_path = '/etc/sysconfig/schema-registry'
      $control_center_environment_path = '/etc/sysconfig/control-center'
      case $::operatingsystemmajrelease {
        '7': {
          $dist_repository_url = "http://packages.confluent.io/rpm/${confluent_version}/7"
          $repository_url = "http://packages.confluent.io/rpm/${confluent_version}"
          $gpgkey_url = "http://packages.confluent.io/rpm/${confluent_version}/archive.key"
        }
        default: {
          fail("${::operatingsystem} ${::operatingsystemmajrelease} is not supported.")
        }
      }
    }
    'Debian': {
      $connect_distributed_environment_path = '/etc/default/kafka-connect-distributed'
      $connect_standalone_environment_path = '/etc/default/kafka-connect-standalone'
      $kafka_environment_path = '/etc/default/kafka'
      $zookeeper_environment_path = '/etc/default/zookeeper'
      $schema_registry_environment_path = '/etc/default/schema-registry'
      $control_center_environment_path = '/etc/default/control-center'
      $key_url = 'http://packages.confluent.io/deb/3.2/archive.key'
      $repository_url = 'http://packages.confluent.io/deb/3.2'
    }
    default: {
      fail("${::osfamily} is not currently supported.")
    }
  }


}