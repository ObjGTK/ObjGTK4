/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKStringList.h"

@implementation OGTKStringList

- (instancetype)init:(const char* const*)strings
{
	GtkStringList* gobjectValue = GTK_STRING_LIST(gtk_string_list_new(strings));

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

- (GtkStringList*)castedGObject
{
	return GTK_STRING_LIST([self gObject]);
}

- (void)append:(OFString*)string
{
	gtk_string_list_append([self castedGObject], [string UTF8String]);
}

- (OFString*)string:(guint)position
{
	const char* gobjectValue = gtk_string_list_get_string([self castedGObject], position);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (void)remove:(guint)position
{
	gtk_string_list_remove([self castedGObject], position);
}

- (void)spliceWithPosition:(guint)position nremovals:(guint)nremovals additions:(const char* const*)additions
{
	gtk_string_list_splice([self castedGObject], position, nremovals, additions);
}

- (void)take:(char*)string
{
	gtk_string_list_take([self castedGObject], string);
}


@end