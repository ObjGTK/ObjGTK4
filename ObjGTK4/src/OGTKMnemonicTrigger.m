/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKMnemonicTrigger.h"

@implementation OGTKMnemonicTrigger

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_MNEMONIC_TRIGGER;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)mnemonicTriggerWithKeyval:(guint)keyval
{
	GtkMnemonicTrigger* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_mnemonic_trigger_new(keyval), GtkMnemonicTrigger, GtkMnemonicTrigger);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGTKMnemonicTrigger* wrapperObject;
	@try {
		wrapperObject = [[OGTKMnemonicTrigger alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkMnemonicTrigger*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkMnemonicTrigger, GtkMnemonicTrigger);
}

- (guint)keyval
{
	guint returnValue = (guint)gtk_mnemonic_trigger_get_keyval([self castedGObject]);

	return returnValue;
}


@end