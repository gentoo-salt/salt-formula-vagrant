{% if grains['os'] == 'Gentoo' %}

{% for pkg in 'app-emulation/vagrant','dev-ruby/net-ssh','dev-ruby/rake','dev-libs/libxml2','dev-ruby/net-scp','dev-ruby/nokogiri','dev-ruby/hashicorp-checkpoint','dev-ruby/listen','dev-ruby/i18n','dev-ruby/rb-inotify','dev-libs/libxslt','dev-ruby/ruby_dep' %}
keyword-{{ pkg }}:
  file.replace:
    - name: /etc/portage/package.accept_keywords/all
    - pattern: .*{{ pkg }}.*
    - repl: {{ pkg }}
    - append_if_not_found: True
{% endfor %}

app-emulation/vagrant:
  pkg.latest

{% endif %}
