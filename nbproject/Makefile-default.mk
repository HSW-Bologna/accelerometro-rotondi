#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=mkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/accelerometro-rotondi.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/accelerometro-rotondi.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=
else
COMPARISON_BUILD=
endif

ifdef SUB_IMAGE_ADDRESS

else
SUB_IMAGE_ADDRESS_COMMAND=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=main/peripherals/system.c main/peripherals/timer.c main/peripherals/heartbit.c main/peripherals/i2c.c main/main.c main/peripherals/spi.c components/I2C/i2c_devices/accelerometer/WSEN_ITDS/wsen_itds.c components/I2C/i2c_common/i2c_common.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/main/peripherals/system.o ${OBJECTDIR}/main/peripherals/timer.o ${OBJECTDIR}/main/peripherals/heartbit.o ${OBJECTDIR}/main/peripherals/i2c.o ${OBJECTDIR}/main/main.o ${OBJECTDIR}/main/peripherals/spi.o ${OBJECTDIR}/components/I2C/i2c_devices/accelerometer/WSEN_ITDS/wsen_itds.o ${OBJECTDIR}/components/I2C/i2c_common/i2c_common.o
POSSIBLE_DEPFILES=${OBJECTDIR}/main/peripherals/system.o.d ${OBJECTDIR}/main/peripherals/timer.o.d ${OBJECTDIR}/main/peripherals/heartbit.o.d ${OBJECTDIR}/main/peripherals/i2c.o.d ${OBJECTDIR}/main/main.o.d ${OBJECTDIR}/main/peripherals/spi.o.d ${OBJECTDIR}/components/I2C/i2c_devices/accelerometer/WSEN_ITDS/wsen_itds.o.d ${OBJECTDIR}/components/I2C/i2c_common/i2c_common.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/main/peripherals/system.o ${OBJECTDIR}/main/peripherals/timer.o ${OBJECTDIR}/main/peripherals/heartbit.o ${OBJECTDIR}/main/peripherals/i2c.o ${OBJECTDIR}/main/main.o ${OBJECTDIR}/main/peripherals/spi.o ${OBJECTDIR}/components/I2C/i2c_devices/accelerometer/WSEN_ITDS/wsen_itds.o ${OBJECTDIR}/components/I2C/i2c_common/i2c_common.o

# Source Files
SOURCEFILES=main/peripherals/system.c main/peripherals/timer.c main/peripherals/heartbit.c main/peripherals/i2c.c main/main.c main/peripherals/spi.c components/I2C/i2c_devices/accelerometer/WSEN_ITDS/wsen_itds.c components/I2C/i2c_common/i2c_common.c



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/accelerometro-rotondi.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=24FJ64GA702
MP_LINKER_FILE_OPTION=,--script=p24FJ64GA702.gld
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/main/peripherals/system.o: main/peripherals/system.c  .generated_files/flags/default/44f093b64a07b21a1aa315e6713040ed5b7b84f5 .generated_files/flags/default/f7fa59b844370e750320d1cb9047fa862ac4f079
	@${MKDIR} "${OBJECTDIR}/main/peripherals" 
	@${RM} ${OBJECTDIR}/main/peripherals/system.o.d 
	@${RM} ${OBJECTDIR}/main/peripherals/system.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/peripherals/system.c  -o ${OBJECTDIR}/main/peripherals/system.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/main/peripherals/system.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -I"components/generic_embedded_libs" -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/main/peripherals/timer.o: main/peripherals/timer.c  .generated_files/flags/default/424b7696661cdc3fcf54b07f5cdfd94fcccb0607 .generated_files/flags/default/f7fa59b844370e750320d1cb9047fa862ac4f079
	@${MKDIR} "${OBJECTDIR}/main/peripherals" 
	@${RM} ${OBJECTDIR}/main/peripherals/timer.o.d 
	@${RM} ${OBJECTDIR}/main/peripherals/timer.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/peripherals/timer.c  -o ${OBJECTDIR}/main/peripherals/timer.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/main/peripherals/timer.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -I"components/generic_embedded_libs" -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/main/peripherals/heartbit.o: main/peripherals/heartbit.c  .generated_files/flags/default/679aa524b970ddb498cc4d960004b8bbb9b2a15a .generated_files/flags/default/f7fa59b844370e750320d1cb9047fa862ac4f079
	@${MKDIR} "${OBJECTDIR}/main/peripherals" 
	@${RM} ${OBJECTDIR}/main/peripherals/heartbit.o.d 
	@${RM} ${OBJECTDIR}/main/peripherals/heartbit.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/peripherals/heartbit.c  -o ${OBJECTDIR}/main/peripherals/heartbit.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/main/peripherals/heartbit.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -I"components/generic_embedded_libs" -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/main/peripherals/i2c.o: main/peripherals/i2c.c  .generated_files/flags/default/766ae0002603843eb4284a0482af1d030f52b453 .generated_files/flags/default/f7fa59b844370e750320d1cb9047fa862ac4f079
	@${MKDIR} "${OBJECTDIR}/main/peripherals" 
	@${RM} ${OBJECTDIR}/main/peripherals/i2c.o.d 
	@${RM} ${OBJECTDIR}/main/peripherals/i2c.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/peripherals/i2c.c  -o ${OBJECTDIR}/main/peripherals/i2c.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/main/peripherals/i2c.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -I"components/generic_embedded_libs" -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/main/main.o: main/main.c  .generated_files/flags/default/4c629a9a5d5cc8202602a1d34515da06566ed7c5 .generated_files/flags/default/f7fa59b844370e750320d1cb9047fa862ac4f079
	@${MKDIR} "${OBJECTDIR}/main" 
	@${RM} ${OBJECTDIR}/main/main.o.d 
	@${RM} ${OBJECTDIR}/main/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/main.c  -o ${OBJECTDIR}/main/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/main/main.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -I"components/generic_embedded_libs" -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/main/peripherals/spi.o: main/peripherals/spi.c  .generated_files/flags/default/dced221215736140a7e7ede579e013f220a759e7 .generated_files/flags/default/f7fa59b844370e750320d1cb9047fa862ac4f079
	@${MKDIR} "${OBJECTDIR}/main/peripherals" 
	@${RM} ${OBJECTDIR}/main/peripherals/spi.o.d 
	@${RM} ${OBJECTDIR}/main/peripherals/spi.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/peripherals/spi.c  -o ${OBJECTDIR}/main/peripherals/spi.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/main/peripherals/spi.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -I"components/generic_embedded_libs" -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/components/I2C/i2c_devices/accelerometer/WSEN_ITDS/wsen_itds.o: components/I2C/i2c_devices/accelerometer/WSEN_ITDS/wsen_itds.c  .generated_files/flags/default/790e64dd92c42ad83f79588cc2b926e0f7acf4e1 .generated_files/flags/default/f7fa59b844370e750320d1cb9047fa862ac4f079
	@${MKDIR} "${OBJECTDIR}/components/I2C/i2c_devices/accelerometer/WSEN_ITDS" 
	@${RM} ${OBJECTDIR}/components/I2C/i2c_devices/accelerometer/WSEN_ITDS/wsen_itds.o.d 
	@${RM} ${OBJECTDIR}/components/I2C/i2c_devices/accelerometer/WSEN_ITDS/wsen_itds.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/I2C/i2c_devices/accelerometer/WSEN_ITDS/wsen_itds.c  -o ${OBJECTDIR}/components/I2C/i2c_devices/accelerometer/WSEN_ITDS/wsen_itds.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/components/I2C/i2c_devices/accelerometer/WSEN_ITDS/wsen_itds.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -I"components/generic_embedded_libs" -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/components/I2C/i2c_common/i2c_common.o: components/I2C/i2c_common/i2c_common.c  .generated_files/flags/default/c89d3b9186a95af4beecca798df32912a7b47d65 .generated_files/flags/default/f7fa59b844370e750320d1cb9047fa862ac4f079
	@${MKDIR} "${OBJECTDIR}/components/I2C/i2c_common" 
	@${RM} ${OBJECTDIR}/components/I2C/i2c_common/i2c_common.o.d 
	@${RM} ${OBJECTDIR}/components/I2C/i2c_common/i2c_common.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/I2C/i2c_common/i2c_common.c  -o ${OBJECTDIR}/components/I2C/i2c_common/i2c_common.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/components/I2C/i2c_common/i2c_common.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -I"components/generic_embedded_libs" -msmart-io=1 -Wall -msfr-warn=off   
	
else
${OBJECTDIR}/main/peripherals/system.o: main/peripherals/system.c  .generated_files/flags/default/d745d22b5d0c3248a2f1da173fb8166582ec21e2 .generated_files/flags/default/f7fa59b844370e750320d1cb9047fa862ac4f079
	@${MKDIR} "${OBJECTDIR}/main/peripherals" 
	@${RM} ${OBJECTDIR}/main/peripherals/system.o.d 
	@${RM} ${OBJECTDIR}/main/peripherals/system.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/peripherals/system.c  -o ${OBJECTDIR}/main/peripherals/system.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/main/peripherals/system.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -I"components/generic_embedded_libs" -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/main/peripherals/timer.o: main/peripherals/timer.c  .generated_files/flags/default/f5bc57254180c0b5d83457a5122a8e3e1ce21e50 .generated_files/flags/default/f7fa59b844370e750320d1cb9047fa862ac4f079
	@${MKDIR} "${OBJECTDIR}/main/peripherals" 
	@${RM} ${OBJECTDIR}/main/peripherals/timer.o.d 
	@${RM} ${OBJECTDIR}/main/peripherals/timer.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/peripherals/timer.c  -o ${OBJECTDIR}/main/peripherals/timer.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/main/peripherals/timer.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -I"components/generic_embedded_libs" -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/main/peripherals/heartbit.o: main/peripherals/heartbit.c  .generated_files/flags/default/a3fe4a37a9a17b82a315b634a239595b2b3d0d01 .generated_files/flags/default/f7fa59b844370e750320d1cb9047fa862ac4f079
	@${MKDIR} "${OBJECTDIR}/main/peripherals" 
	@${RM} ${OBJECTDIR}/main/peripherals/heartbit.o.d 
	@${RM} ${OBJECTDIR}/main/peripherals/heartbit.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/peripherals/heartbit.c  -o ${OBJECTDIR}/main/peripherals/heartbit.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/main/peripherals/heartbit.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -I"components/generic_embedded_libs" -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/main/peripherals/i2c.o: main/peripherals/i2c.c  .generated_files/flags/default/6cd24afe0765279d6b4e76249bf0eb7556e4fa8e .generated_files/flags/default/f7fa59b844370e750320d1cb9047fa862ac4f079
	@${MKDIR} "${OBJECTDIR}/main/peripherals" 
	@${RM} ${OBJECTDIR}/main/peripherals/i2c.o.d 
	@${RM} ${OBJECTDIR}/main/peripherals/i2c.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/peripherals/i2c.c  -o ${OBJECTDIR}/main/peripherals/i2c.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/main/peripherals/i2c.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -I"components/generic_embedded_libs" -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/main/main.o: main/main.c  .generated_files/flags/default/9517922dffcfe054179d42ffd4e1815b34f075b7 .generated_files/flags/default/f7fa59b844370e750320d1cb9047fa862ac4f079
	@${MKDIR} "${OBJECTDIR}/main" 
	@${RM} ${OBJECTDIR}/main/main.o.d 
	@${RM} ${OBJECTDIR}/main/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/main.c  -o ${OBJECTDIR}/main/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/main/main.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -I"components/generic_embedded_libs" -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/main/peripherals/spi.o: main/peripherals/spi.c  .generated_files/flags/default/85a76b3e6e1feae34fc9620ab424cf933f8f59a7 .generated_files/flags/default/f7fa59b844370e750320d1cb9047fa862ac4f079
	@${MKDIR} "${OBJECTDIR}/main/peripherals" 
	@${RM} ${OBJECTDIR}/main/peripherals/spi.o.d 
	@${RM} ${OBJECTDIR}/main/peripherals/spi.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/peripherals/spi.c  -o ${OBJECTDIR}/main/peripherals/spi.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/main/peripherals/spi.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -I"components/generic_embedded_libs" -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/components/I2C/i2c_devices/accelerometer/WSEN_ITDS/wsen_itds.o: components/I2C/i2c_devices/accelerometer/WSEN_ITDS/wsen_itds.c  .generated_files/flags/default/7847165ec1f9efaf21f7aa6c3c0fd74f4eab5f61 .generated_files/flags/default/f7fa59b844370e750320d1cb9047fa862ac4f079
	@${MKDIR} "${OBJECTDIR}/components/I2C/i2c_devices/accelerometer/WSEN_ITDS" 
	@${RM} ${OBJECTDIR}/components/I2C/i2c_devices/accelerometer/WSEN_ITDS/wsen_itds.o.d 
	@${RM} ${OBJECTDIR}/components/I2C/i2c_devices/accelerometer/WSEN_ITDS/wsen_itds.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/I2C/i2c_devices/accelerometer/WSEN_ITDS/wsen_itds.c  -o ${OBJECTDIR}/components/I2C/i2c_devices/accelerometer/WSEN_ITDS/wsen_itds.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/components/I2C/i2c_devices/accelerometer/WSEN_ITDS/wsen_itds.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -I"components/generic_embedded_libs" -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/components/I2C/i2c_common/i2c_common.o: components/I2C/i2c_common/i2c_common.c  .generated_files/flags/default/3aa8472a70fc4d925bec854ae9411da91abb9557 .generated_files/flags/default/f7fa59b844370e750320d1cb9047fa862ac4f079
	@${MKDIR} "${OBJECTDIR}/components/I2C/i2c_common" 
	@${RM} ${OBJECTDIR}/components/I2C/i2c_common/i2c_common.o.d 
	@${RM} ${OBJECTDIR}/components/I2C/i2c_common/i2c_common.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/I2C/i2c_common/i2c_common.c  -o ${OBJECTDIR}/components/I2C/i2c_common/i2c_common.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/components/I2C/i2c_common/i2c_common.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -I"components/generic_embedded_libs" -msmart-io=1 -Wall -msfr-warn=off   
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemblePreproc
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/accelerometro-rotondi.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o dist/${CND_CONF}/${IMAGE_TYPE}/accelerometro-rotondi.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -D__DEBUG=__DEBUG   -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -Wl,,,--defsym=__MPLAB_BUILD=1,--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D__DEBUG=__DEBUG,,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem$(MP_EXTRA_LD_POST)  
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/accelerometro-rotondi.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o dist/${CND_CONF}/${IMAGE_TYPE}/accelerometro-rotondi.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -Wl,,,--defsym=__MPLAB_BUILD=1,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem$(MP_EXTRA_LD_POST)  
	${MP_CC_DIR}/xc16-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/accelerometro-rotondi.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} -a  -omf=elf   
	
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/default
	${RM} -r dist/default

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell "${PATH_TO_IDE_BIN}"mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
