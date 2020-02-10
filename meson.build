project('com.github.maze-n.indicator-daynight', 'vala', 'c')

i18n = import('i18n')
gettext_name = meson.project_name()

add_global_arguments('-DGETTEXT_PACKAGE="@0@"'.format(gettext_name), language:'c')

wingpanel_dep = dependency('wingpanel-2.0')

dependencies = [
    dependency('gconf-2.0'),
    dependency('glib-2.0'),
    dependency('gobject-2.0'),
    dependency('granite'),
    dependency('gtk+-3.0'),
    dependency('libxml-2.0'),
    meson.get_compiler('vala').find_library('posix'),
    wingpanel_dep
]

files = [
    'src/Indicator.vala',
]

shared_module(
    meson.project_name(),
    files,
    dependencies: dependencies,
    install: true,
    install_dir : wingpanel_dep.get_pkgconfig_variable('indicatorsdir')
)

subdir('data')
subdir('po')

meson.add_install_script('meson/post_install.py')