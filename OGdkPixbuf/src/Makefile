include ../extra.mk

SHARED_LIB = ${OGDKPIXBUF_SHARED_LIB}
STATIC_LIB = ${OGDKPIXBUF_STATIC_LIB}
FRAMEWORK = ${OGDKPIXBUF_FRAMEWORK}
LIB_MAJOR = 2
LIB_MINOR = 0

SRCS = OGdkPixbuf.m \
	OGdkPixbufAnimation.m \
	OGdkPixbufAnimationIter.m \
	OGdkPixbufLoader.m \
	OGdkPixbufSimpleAnim.m \
	

INCLUDES = ${SRCS:.m=.h} \
	OGdkPixbuf-Umbrella.h

include ../buildsys.mk

LD = ${OBJC}
