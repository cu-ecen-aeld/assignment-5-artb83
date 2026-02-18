
##############################################################
#
# LDD
#
##############################################################

#TODO: Fill up the contents below in order to reference your assignment 7 git contents
#LDD_VERSION = 1debe889ea7134feb33a448b54b52d4ac581e7b7 #first commit with assignment 7-2 br 1st time build.sh.
LDD_VERSION = e2a78ce88f5128d1e4e93940b4ceae5189f43c52 #3rd commit with assignment 7-2 - modified k-modules loading scripts
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
LDD_SITE = 'git@github.com:cu-ecen-aeld/assignment-7-artb83.git'
LDD_SITE_METHOD = git
LDD_GIT_SUBMODULES = YES

LDD_MODULE_SUBDIRS += misc-modules
LDD_MODULE_SUBDIRS += scull

define LDD_BUILD_CMDS
	echo "------ PRINT VARS ------"
	echo "------- PRINT @D -------"
	make -s printvars VARS='$(@D)'
	echo "------- PRINT STAGING_DIR -------"
	make -s printvars VARS='$(STAGING_DIR)'
	echo "------- PRINT TARGET_DIR -------"
	make -s printvars VARS='$(TARGET_DIR)'
endef

# TODO add your writer, finder and finder-test utilities/scripts to the installation steps below
define LDD_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/scull/scull_load            $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/scull/scull_unload          $(TARGET_DIR)/usr/bin	
	$(INSTALL) -m 0755 $(@D)/misc-modules/module_load    $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/misc-modules/module_unload  $(TARGET_DIR)/usr/bin
endef

$(eval $(kernel-module))
$(eval $(generic-package))
