/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKStringList.h"

@implementation OGTKStringList

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_STRING_LIST;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)stringListWithStrings:(const char* const*)strings
{
	GtkStringList* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_string_list_new(strings), GtkStringList, GtkStringList);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGTKStringList* wrapperObject;
	@try {
		wrapperObject = [[OGTKStringList alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkStringList*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkStringList, GtkStringList);
}

- (void)appendWithString:(OFString*)string
{
	gtk_string_list_append([self castedGObject], [string UTF8String]);
}

- (OFString*)stringWithPosition:(guint)position
{
	const char* gobjectValue = gtk_string_list_get_string([self castedGObject], position);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (void)removeWithPosition:(guint)position
{
	gtk_string_list_remove([self castedGObject], position);
}

- (void)spliceWithPosition:(guint)position nremovals:(guint)nremovals additions:(const char* const*)additions
{
	gtk_string_list_splice([self castedGObject], position, nremovals, additions);
}

- (void)takeWithString:(OFString*)string
{
	gtk_string_list_take([self castedGObject], g_strdup([string UTF8String]));
}


@end