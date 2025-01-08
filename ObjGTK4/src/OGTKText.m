/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKText.h"

#import <OGio/OGMenuModel.h>
#import "OGTKEntryBuffer.h"

@implementation OGTKText

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_TEXT;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (instancetype)init
{
	GtkText* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_text_new(), GtkText, GtkText);

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

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

- (instancetype)initWithBuffer:(OGTKEntryBuffer*)buffer
{
	GtkText* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_text_new_with_buffer([buffer castedGObject]), GtkText, GtkText);

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

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

- (GtkText*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkText, GtkText);
}

- (void)computeCursorExtentsWithPosition:(gsize)position strong:(graphene_rect_t*)strong weak:(graphene_rect_t*)weak
{
	gtk_text_compute_cursor_extents([self castedGObject], position, strong, weak);
}

- (bool)activatesDefault
{
	bool returnValue = (bool)gtk_text_get_activates_default([self castedGObject]);

	return returnValue;
}

- (PangoAttrList*)attributes
{
	PangoAttrList* returnValue = (PangoAttrList*)gtk_text_get_attributes([self castedGObject]);

	return returnValue;
}

- (OGTKEntryBuffer*)buffer
{
	GtkEntryBuffer* gobjectValue = gtk_text_get_buffer([self castedGObject]);

	OGTKEntryBuffer* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (bool)enableEmojiCompletion
{
	bool returnValue = (bool)gtk_text_get_enable_emoji_completion([self castedGObject]);

	return returnValue;
}

- (OGMenuModel*)extraMenu
{
	GMenuModel* gobjectValue = gtk_text_get_extra_menu([self castedGObject]);

	OGMenuModel* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (GtkInputHints)inputHints
{
	GtkInputHints returnValue = (GtkInputHints)gtk_text_get_input_hints([self castedGObject]);

	return returnValue;
}

- (GtkInputPurpose)inputPurpose
{
	GtkInputPurpose returnValue = (GtkInputPurpose)gtk_text_get_input_purpose([self castedGObject]);

	return returnValue;
}

- (gunichar)invisibleChar
{
	gunichar returnValue = (gunichar)gtk_text_get_invisible_char([self castedGObject]);

	return returnValue;
}

- (int)maxLength
{
	int returnValue = (int)gtk_text_get_max_length([self castedGObject]);

	return returnValue;
}

- (bool)overwriteMode
{
	bool returnValue = (bool)gtk_text_get_overwrite_mode([self castedGObject]);

	return returnValue;
}

- (OFString*)placeholderText
{
	const char* gobjectValue = gtk_text_get_placeholder_text([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (bool)propagateTextWidth
{
	bool returnValue = (bool)gtk_text_get_propagate_text_width([self castedGObject]);

	return returnValue;
}

- (PangoTabArray*)tabs
{
	PangoTabArray* returnValue = (PangoTabArray*)gtk_text_get_tabs([self castedGObject]);

	return returnValue;
}

- (guint16)textLength
{
	guint16 returnValue = (guint16)gtk_text_get_text_length([self castedGObject]);

	return returnValue;
}

- (bool)truncateMultiline
{
	bool returnValue = (bool)gtk_text_get_truncate_multiline([self castedGObject]);

	return returnValue;
}

- (bool)visibility
{
	bool returnValue = (bool)gtk_text_get_visibility([self castedGObject]);

	return returnValue;
}

- (bool)grabFocusWithoutSelecting
{
	bool returnValue = (bool)gtk_text_grab_focus_without_selecting([self castedGObject]);

	return returnValue;
}

- (void)setActivatesDefault:(bool)activates
{
	gtk_text_set_activates_default([self castedGObject], activates);
}

- (void)setAttributes:(PangoAttrList*)attrs
{
	gtk_text_set_attributes([self castedGObject], attrs);
}

- (void)setBuffer:(OGTKEntryBuffer*)buffer
{
	gtk_text_set_buffer([self castedGObject], [buffer castedGObject]);
}

- (void)setEnableEmojiCompletion:(bool)enableEmojiCompletion
{
	gtk_text_set_enable_emoji_completion([self castedGObject], enableEmojiCompletion);
}

- (void)setExtraMenu:(OGMenuModel*)model
{
	gtk_text_set_extra_menu([self castedGObject], [model castedGObject]);
}

- (void)setInputHints:(GtkInputHints)hints
{
	gtk_text_set_input_hints([self castedGObject], hints);
}

- (void)setInputPurpose:(GtkInputPurpose)purpose
{
	gtk_text_set_input_purpose([self castedGObject], purpose);
}

- (void)setInvisibleChar:(gunichar)ch
{
	gtk_text_set_invisible_char([self castedGObject], ch);
}

- (void)setMaxLength:(int)length
{
	gtk_text_set_max_length([self castedGObject], length);
}

- (void)setOverwriteMode:(bool)overwrite
{
	gtk_text_set_overwrite_mode([self castedGObject], overwrite);
}

- (void)setPlaceholderText:(OFString*)text
{
	gtk_text_set_placeholder_text([self castedGObject], [text UTF8String]);
}

- (void)setPropagateTextWidth:(bool)propagateTextWidth
{
	gtk_text_set_propagate_text_width([self castedGObject], propagateTextWidth);
}

- (void)setTabs:(PangoTabArray*)tabs
{
	gtk_text_set_tabs([self castedGObject], tabs);
}

- (void)setTruncateMultiline:(bool)truncateMultiline
{
	gtk_text_set_truncate_multiline([self castedGObject], truncateMultiline);
}

- (void)setVisibility:(bool)visible
{
	gtk_text_set_visibility([self castedGObject], visible);
}

- (void)unsetInvisibleChar
{
	gtk_text_unset_invisible_char([self castedGObject]);
}


@end