/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <gdk/gdk.h>

#import <OGObject/OGObject.h>

@class OGdkGLContext;
@class OGdkTexture;

/**
 * `GdkGLTextureBuilder` is a builder used to construct [class@Gdk.Texture] objects from
 * GL textures.
 * 
 * The operation is quite simple: Create a texture builder, set all the necessary
 * properties - keep in mind that the properties [property@Gdk.GLTextureBuilder:context],
 * [property@Gdk.GLTextureBuilder:id], [property@Gdk.GLTextureBuilder:width], and
 * [property@Gdk.GLTextureBuilder:height] are mandatory - and then call
 * [method@Gdk.GLTextureBuilder.build] to create the new texture.
 * 
 * `GdkGLTextureBuilder` can be used for quick one-shot construction of
 * textures as well as kept around and reused to construct multiple textures.
 *
 */
@interface OGdkGLTextureBuilder : OGObject
{

}

/**
 * Functions and class methods
 */
+ (void)load;

+ (GTypeClass*)gObjectClass;

/**
 * Constructors
 */
+ (instancetype)gLTextureBuilder;

/**
 * Methods
 */

- (GdkGLTextureBuilder*)castedGObject;

/**
 * Builds a new `GdkTexture` with the values set up in the builder.
 * 
 * The `destroy` function gets called when the returned texture gets released;
 * either when the texture is finalized or by an explicit call to
 * [method@Gdk.GLTexture.release]. It should release all GL resources associated
 * with the texture, such as the [property@Gdk.GLTextureBuilder:id] and the
 * [property@Gdk.GLTextureBuilder:sync].
 * 
 * Note that it is a programming error to call this function if any mandatory
 * property has not been set.
 * 
 * It is possible to call this function multiple times to create multiple textures,
 * possibly with changing properties in between.
 *
 * @param destroy destroy function to be called when the texture is
 *   released
 * @param data user data to pass to the destroy function
 * @return a newly built `GdkTexture`
 */
- (OGdkTexture*)buildWithDestroy:(GDestroyNotify)destroy data:(gpointer)data;

/**
 * Gets the context previously set via gdk_gl_texture_builder_set_context() or
 * %NULL if none was set.
 *
 * @return The context
 */
- (OGdkGLContext*)context;

/**
 * Gets the format previously set via gdk_gl_texture_builder_set_format().
 *
 * @return The format
 */
- (GdkMemoryFormat)format;

/**
 * Gets whether the texture has a mipmap.
 *
 * @return Whether the texture has a mipmap
 */
- (bool)hasMipmap;

/**
 * Gets the height previously set via gdk_gl_texture_builder_set_height() or
 * 0 if the height wasn't set.
 *
 * @return The height
 */
- (int)height;

/**
 * Gets the texture id previously set via gdk_gl_texture_builder_set_id() or
 * 0 if the id wasn't set.
 *
 * @return The id
 */
- (guint)id;

/**
 * Gets the `GLsync` previously set via gdk_gl_texture_builder_set_sync().
 *
 * @return the `GLSync`
 */
- (gpointer)sync;

/**
 * Gets the region previously set via gdk_gl_texture_builder_set_update_region() or
 * %NULL if none was set.
 *
 * @return The region
 */
- (cairo_region_t*)updateRegion;

/**
 * Gets the texture previously set via gdk_gl_texture_builder_set_update_texture() or
 * %NULL if none was set.
 *
 * @return The texture
 */
- (OGdkTexture*)updateTexture;

/**
 * Gets the width previously set via gdk_gl_texture_builder_set_width() or
 * 0 if the width wasn't set.
 *
 * @return The width
 */
- (int)width;

/**
 * Sets the context to be used for the texture. This is the context that owns
 * the texture.
 * 
 * The context must be set before calling [method@Gdk.GLTextureBuilder.build].
 *
 * @param context The context the texture beongs to or %NULL to unset
 */
- (void)setContext:(OGdkGLContext*)context;

/**
 * Sets the format of the texture. The default is `GDK_MEMORY_R8G8B8A8_PREMULTIPLIED`.
 * 
 * The format is the preferred format the texture data should be downloaded to. The
 * format must be supported by the GL version of [property@Gdk.GLTextureBuilder:context].
 * 
 * GDK's texture download code assumes that the format corresponds to the storage
 * parameters of the GL texture in an obvious way. For example, a format of
 * `GDK_MEMORY_R16G16B16A16_PREMULTIPLIED` is expected to be stored as `GL_RGBA16`
 * texture, and `GDK_MEMORY_G8A8` is expected to be stored as `GL_RG8` texture.
 * 
 * Setting the right format is particularly useful when using high bit depth textures
 * to preserve the bit depth, to set the correct value for unpremultiplied textures
 * and to make sure opaque textures are treated as such.
 * 
 * Non-RGBA textures need to have swizzling parameters set up properly to be usable
 * in GSK's shaders.
 *
 * @param format The texture's format
 */
- (void)setFormat:(GdkMemoryFormat)format;

/**
 * Sets whether the texture has a mipmap. This allows the renderer and other users of the
 * generated texture to use a higher quality downscaling.
 * 
 * Typically, the `glGenerateMipmap` function is used to generate a mimap.
 *
 * @param hasMipmap Whether the texture has a mipmap
 */
- (void)setHasMipmap:(bool)hasMipmap;

/**
 * Sets the height of the texture.
 * 
 * The height must be set before calling [method@Gdk.GLTextureBuilder.build].
 *
 * @param height The texture's height or 0 to unset
 */
- (void)setHeight:(int)height;

/**
 * Sets the texture id of the texture. The texture id must remain unmodified
 * until the texture was finalized. See [method@Gdk.GLTextureBuilder.build]
 * for a longer discussion.
 * 
 * The id must be set before calling [method@Gdk.GLTextureBuilder.build].
 *
 * @param identifier The texture id to be used for creating the texture
 */
- (void)setIdWithIdentifier:(guint)identifier;

/**
 * Sets the GLSync object to use for the texture.
 * 
 * GTK will wait on this object before using the created `GdkTexture`.
 * 
 * The `destroy` function that is passed to [method@Gdk.GLTextureBuilder.build]
 * is responsible for freeing the sync object when it is no longer needed.
 * The texture builder does not destroy it and it is the callers
 * responsibility to make sure it doesn't leak.
 *
 * @param sync the GLSync object
 */
- (void)setSync:(gpointer)sync;

/**
 * Sets the region to be updated by this texture. Together with
 * [property@Gdk.GLTextureBuilder:update-texture] this describes an
 * update of a previous texture.
 * 
 * When rendering animations of large textures, it is possible that
 * consecutive textures are only updating contents in parts of the texture.
 * It is then possible to describe this update via these two properties,
 * so that GTK can avoid rerendering parts that did not change.
 * 
 * An example would be a screen recording where only the mouse pointer moves.
 *
 * @param region the region to update
 */
- (void)setUpdateRegion:(cairo_region_t*)region;

/**
 * Sets the texture to be updated by this texture. See
 * [method@Gdk.GLTextureBuilder.set_update_region] for an explanation.
 *
 * @param texture the texture to update
 */
- (void)setUpdateTexture:(OGdkTexture*)texture;

/**
 * Sets the width of the texture.
 * 
 * The width must be set before calling [method@Gdk.GLTextureBuilder.build].
 *
 * @param width The texture's width or 0 to unset
 */
- (void)setWidth:(int)width;

@end