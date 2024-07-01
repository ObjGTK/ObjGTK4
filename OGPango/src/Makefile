include ../extra.mk

SHARED_LIB = ${OGPANGO_SHARED_LIB}
STATIC_LIB = ${OGPANGO_STATIC_LIB}
FRAMEWORK = ${OGPANGO_FRAMEWORK}
LIB_MAJOR = 1
LIB_MINOR = 0

SRCS = OGPangoContext.m \
	OGPangoCoverage.m \
	OGPangoFont.m \
	OGPangoFontFace.m \
	OGPangoFontFamily.m \
	OGPangoFontMap.m \
	OGPangoFontset.m \
	OGPangoFontsetSimple.m \
	OGPangoLayout.m \
	OGPangoRenderer.m \
	

INCLUDES = ${SRCS:.m=.h} \
	OGPango-Umbrella.h

include ../buildsys.mk

LD = ${OBJC}
