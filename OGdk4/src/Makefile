include ../extra.mk

SHARED_LIB = ${OGDK4_SHARED_LIB}
STATIC_LIB = ${OGDK4_STATIC_LIB}
FRAMEWORK = ${OGDK4_FRAMEWORK}
LIB_MAJOR = 4
LIB_MINOR = 0

SRCS = OGdkAppLaunchContext.m \
	OGdkCairoContext.m \
	OGdkClipboard.m \
	OGdkContentDeserializer.m \
	OGdkContentProvider.m \
	OGdkContentSerializer.m \
	OGdkCursor.m \
	OGdkDevice.m \
	OGdkDeviceTool.m \
	OGdkDisplay.m \
	OGdkDisplayManager.m \
	OGdkDmabufTexture.m \
	OGdkDmabufTextureBuilder.m \
	OGdkDrag.m \
	OGdkDrawContext.m \
	OGdkDrop.m \
	OGdkFrameClock.m \
	OGdkGLContext.m \
	OGdkGLTexture.m \
	OGdkGLTextureBuilder.m \
	OGdkMemoryTexture.m \
	OGdkMonitor.m \
	OGdkSeat.m \
	OGdkSnapshot.m \
	OGdkSurface.m \
	OGdkTexture.m \
	OGdkVulkanContext.m \
	

INCLUDES = ${SRCS:.m=.h} \
	OGdk4-Umbrella.h

include ../buildsys.mk

LD = ${OBJC}
