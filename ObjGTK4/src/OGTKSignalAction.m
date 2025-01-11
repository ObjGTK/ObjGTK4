/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKSignalAction.h"

@implementation OGTKSignalAction

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_SIGNAL_ACTION;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)signalAction:(OFString*)signalName
{
	GtkSignalAction* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_signal_action_new([signalName UTF8String]), GtkSignalAction, GtkSignalAction);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGTKSignalAction* wrapperObject;
	@try {
		wrapperObject = [[OGTKSignalAction alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkSignalAction*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkSignalAction, GtkSignalAction);
}

- (OFString*)signalName
{
	const char* gobjectValue = gtk_signal_action_get_signal_name([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}


@end