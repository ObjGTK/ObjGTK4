/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKTextTag.h"

@implementation OGTKTextTag

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_TEXT_TAG;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (instancetype)initWithName:(OFString*)name
{
	GtkTextTag* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_text_tag_new([name UTF8String]), GtkTextTag, GtkTextTag);

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

- (GtkTextTag*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkTextTag, GtkTextTag);
}

- (void)changed:(bool)sizeChanged
{
	gtk_text_tag_changed([self castedGObject], sizeChanged);
}

- (int)priority
{
	int returnValue = (int)gtk_text_tag_get_priority([self castedGObject]);

	return returnValue;
}

- (void)setPriority:(int)priority
{
	gtk_text_tag_set_priority([self castedGObject], priority);
}


@end