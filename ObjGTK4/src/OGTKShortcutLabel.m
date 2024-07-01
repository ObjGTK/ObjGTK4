/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKShortcutLabel.h"

@implementation OGTKShortcutLabel

- (instancetype)init:(OFString*)accelerator
{
	GtkShortcutLabel* gobjectValue = GTK_SHORTCUT_LABEL(gtk_shortcut_label_new([accelerator UTF8String]));

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

- (GtkShortcutLabel*)castedGObject
{
	return GTK_SHORTCUT_LABEL([self gObject]);
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