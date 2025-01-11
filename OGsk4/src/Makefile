include ../extra.mk

SHARED_LIB = ${OGSK4_SHARED_LIB}
STATIC_LIB = ${OGSK4_STATIC_LIB}
FRAMEWORK = ${OGSK4_FRAMEWORK}
LIB_MAJOR = 4
LIB_MINOR = 0

SRCS = OGskCairoRenderer.m \
	OGskGLShader.m \
	OGskRenderer.m \
	OGskVulkanRenderer.m \
	

INCLUDES = ${SRCS:.m=.h} \
	OGsk4-Umbrella.h

include ../buildsys.mk

LD = ${OBJC}
