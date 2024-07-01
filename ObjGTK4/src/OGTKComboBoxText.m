/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKComboBoxText.h"

#import "OGTKWidget.h"

@implementation OGTKComboBoxText

- (instancetype)init
{
	GtkComboBoxText* gobjectValue = GTK_COMBO_BOX_TEXT(gtk_combo_box_text_new());

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

- (instancetype)initWithEntry
{
	GtkComboBoxText* gobjectValue = GTK_COMBO_BOX_TEXT(gtk_combo_box_text_new_with_entry());

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

- (GtkComboBoxText*)castedGObject
{
	return GTK_COMBO_BOX_TEXT([self gObject]);
}

- (void)appendWithId:(OFString*)id text:(OFString*)text
{
	gtk_combo_box_text_append([self castedGObject], [id UTF8String], [text UTF8String]);
}

- (void)appendText:(OFString*)text
{
	gtk_combo_box_text_append_text([self castedGObject], [text UTF8String]);
}

- (char*)activeText
{
	char* gobjectValue = gtk_combo_box_text_get_active_text([self castedGObject]);

	char* returnValue = gobjectValue;
	return returnValue;
}

- (void)insertWithPosition:(int)position id:(OFString*)id text:(OFString*)text
{
	gtk_combo_box_text_insert([self castedGObject], position, [id UTF8String], [text UTF8String]);
}

- (void)insertTextWithPosition:(int)position text:(OFString*)text
{
	gtk_combo_box_text_insert_text([self castedGObject], position, [text UTF8String]);
}

- (void)prependWithId:(OFString*)id text:(OFString*)text
{
	gtk_combo_box_text_prepend([self castedGObject], [id UTF8String], [text UTF8String]);
}

- (void)prependText:(OFString*)text
{
	gtk_combo_box_text_prepend_text([self castedGObject], [text UTF8String]);
}

- (void)remove:(int)position
{
	gtk_combo_box_text_remove([self castedGObject], position);
}

- (void)removeAll
{
	gtk_combo_box_text_remove_all([self castedGObject]);
}


@end