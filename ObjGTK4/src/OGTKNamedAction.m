/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKNamedAction.h"

@implementation OGTKNamedAction

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_NAMED_ACTION;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (instancetype)initWithName:(OFString*)name
{
	GtkNamedAction* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_named_action_new([name UTF8String]), GtkNamedAction, GtkNamedAction);

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

- (GtkNamedAction*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkNamedAction, GtkNamedAction);
}

- (OFString*)actionName
{
	const char* gobjectValue = gtk_named_action_get_action_name([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}


@end