/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKComboBoxText.h"

#import "OGTKWidget.h"

@implementation OGTKComboBoxText

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_COMBO_BOX_TEXT;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_COMBO_BOX_TEXT);
	return gObjectClass;
}

+ (instancetype)comboBoxText
{
	GtkComboBoxText* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_combo_box_text_new(), GTK_TYPE_COMBO_BOX_TEXT, GtkComboBoxText);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKComboBoxText* wrapperObject;
	@try {
		wrapperObject = [[OGTKComboBoxText alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

+ (instancetype)comboBoxTextWithEntry
{
	GtkComboBoxText* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_combo_box_text_new_with_entry(), GTK_TYPE_COMBO_BOX_TEXT, GtkComboBoxText);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKComboBoxText* wrapperObject;
	@try {
		wrapperObject = [[OGTKComboBoxText alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkComboBoxText*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_COMBO_BOX_TEXT, GtkComboBoxText);
}

- (void)appendWithIdentifier:(OFString*)identifier text:(OFString*)text
{
	gtk_combo_box_text_append((GtkComboBoxText*)[self castedGObject], [identifier UTF8String], [text UTF8String]);
}

- (void)appendText:(OFString*)text
{
	gtk_combo_box_text_append_text((GtkComboBoxText*)[self castedGObject], [text UTF8String]);
}

- (OFString*)activeText
{
	char* gobjectValue = gtk_combo_box_text_get_active_text((GtkComboBoxText*)[self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

- (void)insertWithPosition:(int)position identifier:(OFString*)identifier text:(OFString*)text
{
	gtk_combo_box_text_insert((GtkComboBoxText*)[self castedGObject], position, [identifier UTF8String], [text UTF8String]);
}

- (void)insertTextWithPosition:(int)position text:(OFString*)text
{
	gtk_combo_box_text_insert_text((GtkComboBoxText*)[self castedGObject], position, [text UTF8String]);
}

- (void)prependWithIdentifier:(OFString*)identifier text:(OFString*)text
{
	gtk_combo_box_text_prepend((GtkComboBoxText*)[self castedGObject], [identifier UTF8String], [text UTF8String]);
}

- (void)prependText:(OFString*)text
{
	gtk_combo_box_text_prepend_text((GtkComboBoxText*)[self castedGObject], [text UTF8String]);
}

- (void)removeWithPosition:(int)position
{
	gtk_combo_box_text_remove((GtkComboBoxText*)[self castedGObject], position);
}

- (void)removeAll
{
	gtk_combo_box_text_remove_all((GtkComboBoxText*)[self castedGObject]);
}


@end