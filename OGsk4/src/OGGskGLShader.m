/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGGskGLShader.h"

#import "OGGskRenderer.h"

@implementation OGGskGLShader

- (instancetype)initFromBytes:(GBytes*)sourcecode
{
	GskGLShader* gobjectValue = GSK_GL_SHADER(gsk_gl_shader_new_from_bytes(sourcecode));

	@try {
		self = [super initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[self release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return self;
}

- (instancetype)initFromResource:(OFString*)resourcePath
{
	GskGLShader* gobjectValue = GSK_GL_SHADER(gsk_gl_shader_new_from_resource([resourcePath UTF8String]));

	@try {
		self = [super initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[self release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return self;
}

- (GskGLShader*)castedGObject
{
	return GSK_GL_SHADER([self gObject]);
}

- (bool)compile:(OGGskRenderer*)renderer
{
	GError* err = NULL;

	bool returnValue = gsk_gl_shader_compile([self castedGObject], [renderer castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (int)findUniformByName:(OFString*)name
{
	int returnValue = gsk_gl_shader_find_uniform_by_name([self castedGObject], [name UTF8String]);

	return returnValue;
}

- (GBytes*)formatArgsVa:(va_list)uniforms
{
	GBytes* returnValue = gsk_gl_shader_format_args_va([self castedGObject], uniforms);

	return returnValue;
}

- (bool)argBoolWithArgs:(GBytes*)args idx:(int)idx
{
	bool returnValue = gsk_gl_shader_get_arg_bool([self castedGObject], args, idx);

	return returnValue;
}

- (float)argFloatWithArgs:(GBytes*)args idx:(int)idx
{
	float returnValue = gsk_gl_shader_get_arg_float([self castedGObject], args, idx);

	return returnValue;
}

- (gint32)argIntWithArgs:(GBytes*)args idx:(int)idx
{
	gint32 returnValue = gsk_gl_shader_get_arg_int([self castedGObject], args, idx);

	return returnValue;
}

- (guint32)argUintWithArgs:(GBytes*)args idx:(int)idx
{
	guint32 returnValue = gsk_gl_shader_get_arg_uint([self castedGObject], args, idx);

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
	gsize returnValue = gsk_gl_shader_get_args_size([self castedGObject]);

	return returnValue;
}

- (int)ntextures
{
	int returnValue = gsk_gl_shader_get_n_textures([self castedGObject]);

	return returnValue;
}

- (int)nuniforms
{
	int returnValue = gsk_gl_shader_get_n_uniforms([self castedGObject]);

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
	GBytes* returnValue = gsk_gl_shader_get_source([self castedGObject]);

	return returnValue;
}

- (OFString*)uniformName:(int)idx
{
	const char* gobjectValue = gsk_gl_shader_get_uniform_name([self castedGObject], idx);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (int)uniformOffset:(int)idx
{
	int returnValue = gsk_gl_shader_get_uniform_offset([self castedGObject], idx);

	return returnValue;
}

- (GskGLUniformType)uniformType:(int)idx
{
	GskGLUniformType returnValue = gsk_gl_shader_get_uniform_type([self castedGObject], idx);

	return returnValue;
}


@end