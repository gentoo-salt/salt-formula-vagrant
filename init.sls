{% if grains['os'] == 'Gentoo' %}

{% set keywords_file = '/etc/portage/package.accept_keywords/all' %}

{% for pkg in 'app-emulation/vagrant','dev-ruby/net-ssh','dev-ruby/rake','dev-libs/libxml2','dev-ruby/net-scp','dev-ruby/nokogiri','dev-ruby/hashicorp-checkpoint','dev-ruby/listen','dev-ruby/i18n','dev-ruby/rb-inotify','dev-libs/libxslt','dev-ruby/ruby_dep' %}
keyword-{{ pkg }}:
  file.replace:
    - name: {{ keywords_file }}
    - pattern: .*{{ pkg }}.*
    - repl: {{ pkg }}
    - append_if_not_found: True
{% endfor %}

vagrant:
  pkg.installed:
    - name: app-emulation/vagrant
    - version: latest

{% endif %}
