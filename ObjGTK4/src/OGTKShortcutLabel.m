/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKShortcutLabel.h"

@implementation OGTKShortcutLabel

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_SHORTCUT_LABEL;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)shortcutLabel:(OFString*)accelerator
{
	GtkShortcutLabel* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_shortcut_label_new([accelerator UTF8String]), GtkShortcutLabel, GtkShortcutLabel);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKShortcutLabel* wrapperObject;
	@try {
		wrapperObject = [[OGTKShortcutLabel alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkShortcutLabel*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkShortcutLabel, GtkShortcutLabel);
}

- (OFString*)accelerator
{
	const char* gobjectValue = gtk_shortcut_label_get_accelerator([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OFString*)disabledText
{
	const char* gobjectValue = gtk_shortcut_label_get_disabled_text([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (void)setAccelerator:(OFString*)accelerator
{
	gtk_shortcut_label_set_accelerator([self castedGObject], [accelerator UTF8String]);
}

- (void)setDisabledText:(OFString*)disabledText
{
	gtk_shortcut_label_set_disabled_text([self castedGObject], [disabledText UTF8String]);
}


@end