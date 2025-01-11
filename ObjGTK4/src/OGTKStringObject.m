/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKStringObject.h"

@implementation OGTKStringObject

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_STRING_OBJECT;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)stringObject:(OFString*)string
{
	GtkStringObject* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_string_object_new([string UTF8String]), GtkStringObject, GtkStringObject);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGTKStringObject* wrapperObject;
	@try {
		wrapperObject = [[OGTKStringObject alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkStringObject*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkStringObject, GtkStringObject);
}

- (OFString*)string
{
	const char* gobjectValue = gtk_string_object_get_string([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}


@end