/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGdkGLTexture.h"

#import "OGdkGLContext.h"

@implementation OGdkGLTexture

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GDK_TYPE_GL_TEXTURE;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GDK_TYPE_GL_TEXTURE);
	return gObjectClass;
}

+ (instancetype)gLTextureWithContext:(OGdkGLContext*)context identifier:(guint)identifier width:(int)width height:(int)height destroy:(GDestroyNotify)destroy data:(gpointer)data
{
	GdkGLTexture* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gdk_gl_texture_new([context castedGObject], identifier, width, height, destroy, data), GDK_TYPE_GL_TEXTURE, GdkGLTexture);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGdkGLTexture* wrapperObject;
	@try {
		wrapperObject = [[OGdkGLTexture alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GdkGLTexture*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GDK_TYPE_GL_TEXTURE, GdkGLTexture);
}

- (void)decreaseCount
{
	gdk_gl_texture_release((GdkGLTexture*)[self castedGObject]);
}


@end