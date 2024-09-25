include ../extra.mk

SHARED_LIB = ${OGDK4_SHARED_LIB}
STATIC_LIB = ${OGDK4_STATIC_LIB}
FRAMEWORK = ${OGDK4_FRAMEWORK}
LIB_MAJOR = 4
LIB_MINOR = 0

SRCS = OGGdkAppLaunchContext.m \
	OGGdkCairoContext.m \
	OGGdkClipboard.m \
	OGGdkContentDeserializer.m \
	OGGdkContentProvider.m \
	OGGdkContentSerializer.m \
	OGGdkCursor.m \
	OGGdkDevice.m \
	OGGdkDeviceTool.m \
	OGGdkDisplay.m \
	OGGdkDisplayManager.m \
	OGGdkDmabufTexture.m \
	OGGdkDmabufTextureBuilder.m \
	OGGdkDrag.m \
	OGGdkDrawContext.m \
	OGGdkDrop.m \
	OGGdkFrameClock.m \
	OGGdkGLContext.m \
	OGGdkGLTexture.m \
	OGGdkGLTextureBuilder.m \
	OGGdkMemoryTexture.m \
	OGGdkMonitor.m \
	OGGdkSeat.m \
	OGGdkSnapshot.m \
	OGGdkSurface.m \
	OGGdkTexture.m \
	OGGdkVulkanContext.m \
	

INCLUDES = ${SRCS:.m=.h} \
	OGdk4-Umbrella.h

include ../buildsys.mk

LD = ${OBJC}
