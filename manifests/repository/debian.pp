class confluent::repository::debian (
  String $apt_key                                            = $::confluent::params::apt_key,
  Variant[Stdlib::Httpsurl, Stdlib::Httpurl] $key_url        = $::confluent::params::key_url,
  Variant[Stdlib::Httpsurl, Stdlib::Httpurl] $repository_url = $::confluent::params::repository_url
) inherits confluent::params {
  include ::apt

  apt::key { $apt_key:
    source => $key_url,
    tag    => '__confluent__'
  } ->
  apt::source { 'confluent':
    comment  => 'Confluent repo',
    location => $repository_url,
    release  => 'stable',
    repos    => 'main',
    include  => {
      'src' => false,
      'deb' => true,
    },
    tag      => '__confluent__'
  } ~>
  exec { 'apt-get update':
    refreshonly => true,
  }

  # The following line is disabled, since it caused a dependency cycle on puppet version 7
  # Apt::Key<| tag == '__confluent__' |> -> Apt::Source<| tag == '__confluent__' |> -> Package<| tag == '__confluent__' |>
}
