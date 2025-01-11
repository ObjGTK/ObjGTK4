/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKTextMark.h"

#import "OGTKTextBuffer.h"

@implementation OGTKTextMark

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_TEXT_MARK;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)textMarkWithName:(OFString*)name leftGravity:(bool)leftGravity
{
	GtkTextMark* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_text_mark_new([name UTF8String], leftGravity), GtkTextMark, GtkTextMark);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGTKTextMark* wrapperObject;
	@try {
		wrapperObject = [[OGTKTextMark alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkTextMark*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkTextMark, GtkTextMark);
}

- (OGTKTextBuffer*)buffer
{
	GtkTextBuffer* gobjectValue = gtk_text_mark_get_buffer([self castedGObject]);

	OGTKTextBuffer* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (bool)deleted
{
	bool returnValue = (bool)gtk_text_mark_get_deleted([self castedGObject]);

	return returnValue;
}

- (bool)leftGravity
{
	bool returnValue = (bool)gtk_text_mark_get_left_gravity([self castedGObject]);

	return returnValue;
}

- (OFString*)name
{
	const char* gobjectValue = gtk_text_mark_get_name([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (bool)visible
{
	bool returnValue = (bool)gtk_text_mark_get_visible([self castedGObject]);

	return returnValue;
}

- (void)setVisible:(bool)setting
{
	gtk_text_mark_set_visible([self castedGObject], setting);
}


@end