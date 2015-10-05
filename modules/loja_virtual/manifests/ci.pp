class loja_virtual::ci {

  include loja_virtual

  package { ['git', 'maven2', 'openjdk-6-jdk']:
    ensure => "installed",
  }

  class { 'jenkins':
    config_hash => {
      'JAVA_ARGS' => { 'value' => '-Xmx256m' }
    },
  }

  $plugins = [
    'ssh-credentials',
    'credentials',
    'scm-api',
    'git-client',
    'git',
    'javadoc',
    'mailer',
    'maven-plugin',
    'greenballs',
    'ws-cleanup'
  ]

  jenkins::plugin { $plugins: }

}
