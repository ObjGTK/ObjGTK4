/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGskGLShader.h"

#import "OGskRenderer.h"

@implementation OGskGLShader

+ (void)load
{
	GType gtypeToAssociate = GSK_TYPE_GL_SHADER;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)gLShaderFromBytesWithSourcecode:(GBytes*)sourcecode
{
	GskGLShader* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gsk_gl_shader_new_from_bytes(sourcecode), GskGLShader, GskGLShader);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGskGLShader* wrapperObject;
	@try {
		wrapperObject = [[OGskGLShader alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

+ (instancetype)gLShaderFromResourceWithResourcePath:(OFString*)resourcePath
{
	GskGLShader* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gsk_gl_shader_new_from_resource([resourcePath UTF8String]), GskGLShader, GskGLShader);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGskGLShader* wrapperObject;
	@try {
		wrapperObject = [[OGskGLShader alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GskGLShader*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GskGLShader, GskGLShader);
}

- (bool)compileWithRenderer:(OGskRenderer*)renderer
{
	GError* err = NULL;

	bool returnValue = (bool)gsk_gl_shader_compile([self castedGObject], [renderer castedGObject], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (int)findUniformByName:(OFString*)name
{
	int returnValue = (int)gsk_gl_shader_find_uniform_by_name([self castedGObject], [name UTF8String]);

	return returnValue;
}

- (GBytes*)formatArgsVaWithUniforms:(va_list)uniforms
{
	GBytes* returnValue = (GBytes*)gsk_gl_shader_format_args_va([self castedGObject], uniforms);

	return returnValue;
}

- (bool)argBoolWithArgs:(GBytes*)args idx:(int)idx
{
	bool returnValue = (bool)gsk_gl_shader_get_arg_bool([self castedGObject], args, idx);

	return returnValue;
}

- (float)argFloatWithArgs:(GBytes*)args idx:(int)idx
{
	float returnValue = (float)gsk_gl_shader_get_arg_float([self castedGObject], args, idx);

	return returnValue;
}

- (gint32)argIntWithArgs:(GBytes*)args idx:(int)idx
{
	gint32 returnValue = (gint32)gsk_gl_shader_get_arg_int([self castedGObject], args, idx);

	return returnValue;
}

- (guint32)argUintWithArgs:(GBytes*)args idx:(int)idx
{
	guint32 returnValue = (guint32)gsk_gl_shader_get_arg_uint([self castedGObject], args, idx);

	return returnValue;
}

- (void)argVec2WithArgs:(GBytes*)args idx:(int)idx outValue:(graphene_vec2_t*)outValue
{
	gsk_gl_shader_get_arg_vec2([self castedGObject], args, idx, outValue);
}

- (void)argVec3WithArgs:(GBytes*)args idx:(int)idx outValue:(graphene_vec3_t*)outValue
{
	gsk_gl_shader_get_arg_vec3([self castedGObject], args, idx, outValue);
}

- (void)argVec4WithArgs:(GBytes*)args idx:(int)idx outValue:(graphene_vec4_t*)outValue
{
	gsk_gl_shader_get_arg_vec4([self castedGObject], args, idx, outValue);
}

- (gsize)argsSize
{
	gsize returnValue = (gsize)gsk_gl_shader_get_args_size([self castedGObject]);

	return returnValue;
}

- (int)ntextures
{
	int returnValue = (int)gsk_gl_shader_get_n_textures([self castedGObject]);

	return returnValue;
}

- (int)nuniforms
{
	int returnValue = (int)gsk_gl_shader_get_n_uniforms([self castedGObject]);

	return returnValue;
}

- (OFString*)resource
{
	const char* gobjectValue = gsk_gl_shader_get_resource([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (GBytes*)source
{
	GBytes* returnValue = (GBytes*)gsk_gl_shader_get_source([self castedGObject]);

	return returnValue;
}

- (OFString*)uniformNameWithIdx:(int)idx
{
	const char* gobjectValue = gsk_gl_shader_get_uniform_name([self castedGObject], idx);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (int)uniformOffsetWithIdx:(int)idx
{
	int returnValue = (int)gsk_gl_shader_get_uniform_offset([self castedGObject], idx);

	return returnValue;
}

- (GskGLUniformType)uniformTypeWithIdx:(int)idx
{
	GskGLUniformType returnValue = (GskGLUniformType)gsk_gl_shader_get_uniform_type([self castedGObject], idx);

	return returnValue;
}


@end