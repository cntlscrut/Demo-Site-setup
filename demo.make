; demo site for drupalcamp atl
api = 2
core = 7.0


; core files ================================================
projects[drupal][type] = core
projects[drupal][patch][] = http://drupal.org/files/issues/object_conversion_menu_router_build-972536-1.patch

; theme files ===============================================
projects[zen][type] = theme
projects[zen][version] = 3.1

projects[omega][type] = theme
projects[omega][version] = 3.0

; module files ==============================================
projects[devel][subdir] = 'dev'
projects[devel][type] = 'module'
projects[devel][version] = '1.2'

projects[context][subdir] = 'contrib'
projects[context][type] = 'module'
projects[context][version] = 3.0-beta2

projects[views][subdir] = 'contrib'
projects[views][type] = 'module'
projects[views][version] = 3.0-rc1

projects[ctools][subdir] = 'contrib'
projects[ctools][type] = 'module'
projects[ctools][version] = 1.0-rc1

projects[jcarousel][subdir] = 'contrib'
projects[jcarousel][type] = 'module'
projects[jcarousel][version] = 2.4-alpha3
