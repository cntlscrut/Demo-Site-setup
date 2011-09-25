; demo site for drupalcamp atl
api = 2
core = 7.0


; core files ================================================
projects[drupal][type] = core
projects[drupal][patch][] = http://drupal.org/files/issues/object_conversion_menu_router_build-972536-1.patch

; theme files ===============================================
projects[zen][type] = theme
projects[zen][version] = 3.1

; module files ==============================================
projects[devel][subdir] = 'contrib'
projects[devel][type] = 'module'
projects[devel][version] = '1.2'