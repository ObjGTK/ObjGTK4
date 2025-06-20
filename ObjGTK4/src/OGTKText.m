/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKText.h"

#import <OGio/OGMenuModel.h>
#import "OGTKEntryBuffer.h"

@implementation OGTKText

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_TEXT;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_TEXT);
	return gObjectClass;
}

+ (instancetype)text
{
	GtkText* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_text_new(), GTK_TYPE_TEXT, GtkText);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKText* wrapperObject;
	@try {
		wrapperObject = [[OGTKText alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

+ (instancetype)textWithBuffer:(OGTKEntryBuffer*)buffer
{
	GtkText* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_text_new_with_buffer([buffer castedGObject]), GTK_TYPE_TEXT, GtkText);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKText* wrapperObject;
	@try {
		wrapperObject = [[OGTKText alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkText*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_TEXT, GtkText);
}

- (void)computeCursorExtentsWithPosition:(gsize)position strong:(graphene_rect_t*)strong weak:(graphene_rect_t*)weak
{
	gtk_text_compute_cursor_extents((GtkText*)[self castedGObject], position, strong, weak);
}

- (bool)activatesDefault
{
	bool returnValue = (bool)gtk_text_get_activates_default((GtkText*)[self castedGObject]);

	return returnValue;
}

- (PangoAttrList*)attributes
{
	PangoAttrList* returnValue = (PangoAttrList*)gtk_text_get_attributes((GtkText*)[self castedGObject]);

	return returnValue;
}

- (OGTKEntryBuffer*)buffer
{
	GtkEntryBuffer* gobjectValue = gtk_text_get_buffer((GtkText*)[self castedGObject]);

	OGTKEntryBuffer* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (bool)enableEmojiCompletion
{
	bool returnValue = (bool)gtk_text_get_enable_emoji_completion((GtkText*)[self castedGObject]);

	return returnValue;
}

- (OGMenuModel*)extraMenu
{
	GMenuModel* gobjectValue = gtk_text_get_extra_menu((GtkText*)[self castedGObject]);

	OGMenuModel* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (GtkInputHints)inputHints
{
	GtkInputHints returnValue = (GtkInputHints)gtk_text_get_input_hints((GtkText*)[self castedGObject]);

	return returnValue;
}

- (GtkInputPurpose)inputPurpose
{
	GtkInputPurpose returnValue = (GtkInputPurpose)gtk_text_get_input_purpose((GtkText*)[self castedGObject]);

	return returnValue;
}

- (gunichar)invisibleChar
{
	gunichar returnValue = (gunichar)gtk_text_get_invisible_char((GtkText*)[self castedGObject]);

	return returnValue;
}

- (int)maxLength
{
	int returnValue = (int)gtk_text_get_max_length((GtkText*)[self castedGObject]);

	return returnValue;
}

- (bool)overwriteMode
{
	bool returnValue = (bool)gtk_text_get_overwrite_mode((GtkText*)[self castedGObject]);

	return returnValue;
}

- (OFString*)placeholderText
{
	const char* gobjectValue = gtk_text_get_placeholder_text((GtkText*)[self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (bool)propagateTextWidth
{
	bool returnValue = (bool)gtk_text_get_propagate_text_width((GtkText*)[self castedGObject]);

	return returnValue;
}

- (PangoTabArray*)tabs
{
	PangoTabArray* returnValue = (PangoTabArray*)gtk_text_get_tabs((GtkText*)[self castedGObject]);

	return returnValue;
}

- (guint16)textLength
{
	guint16 returnValue = (guint16)gtk_text_get_text_length((GtkText*)[self castedGObject]);

	return returnValue;
}

- (bool)truncateMultiline
{
	bool returnValue = (bool)gtk_text_get_truncate_multiline((GtkText*)[self castedGObject]);

	return returnValue;
}

- (bool)visibility
{
	bool returnValue = (bool)gtk_text_get_visibility((GtkText*)[self castedGObject]);

	return returnValue;
}

- (bool)grabFocusWithoutSelecting
{
	bool returnValue = (bool)gtk_text_grab_focus_without_selecting((GtkText*)[self castedGObject]);

	return returnValue;
}

- (void)setActivatesDefault:(bool)activates
{
	gtk_text_set_activates_default((GtkText*)[self castedGObject], activates);
}

- (void)setAttributesWithAttrs:(PangoAttrList*)attrs
{
	gtk_text_set_attributes((GtkText*)[self castedGObject], attrs);
}

- (void)setBuffer:(OGTKEntryBuffer*)buffer
{
	gtk_text_set_buffer((GtkText*)[self castedGObject], [buffer castedGObject]);
}

- (void)setEnableEmojiCompletion:(bool)enableEmojiCompletion
{
	gtk_text_set_enable_emoji_completion((GtkText*)[self castedGObject], enableEmojiCompletion);
}

- (void)setExtraMenuWithModel:(OGMenuModel*)model
{
	gtk_text_set_extra_menu((GtkText*)[self castedGObject], [model castedGObject]);
}

- (void)setInputHints:(GtkInputHints)hints
{
	gtk_text_set_input_hints((GtkText*)[self castedGObject], hints);
}

- (void)setInputPurpose:(GtkInputPurpose)purpose
{
	gtk_text_set_input_purpose((GtkText*)[self castedGObject], purpose);
}

- (void)setInvisibleChar:(gunichar)ch
{
	gtk_text_set_invisible_char((GtkText*)[self castedGObject], ch);
}

- (void)setMaxLength:(int)length
{
	gtk_text_set_max_length((GtkText*)[self castedGObject], length);
}

- (void)setOverwriteMode:(bool)overwrite
{
	gtk_text_set_overwrite_mode((GtkText*)[self castedGObject], overwrite);
}

- (void)setPlaceholderText:(OFString*)text
{
	gtk_text_set_placeholder_text((GtkText*)[self castedGObject], [text UTF8String]);
}

- (void)setPropagateTextWidth:(bool)propagateTextWidth
{
	gtk_text_set_propagate_text_width((GtkText*)[self castedGObject], propagateTextWidth);
}

- (void)setTabs:(PangoTabArray*)tabs
{
	gtk_text_set_tabs((GtkText*)[self castedGObject], tabs);
}

- (void)setTruncateMultiline:(bool)truncateMultiline
{
	gtk_text_set_truncate_multiline((GtkText*)[self castedGObject], truncateMultiline);
}

- (void)setVisibilityWithVisible:(bool)visible
{
	gtk_text_set_visibility((GtkText*)[self castedGObject], visible);
}

- (void)unsetInvisibleChar
{
	gtk_text_unset_invisible_char((GtkText*)[self castedGObject]);
}


@end