/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKEntry.h"

#import <OGdk4/OGGdkContentProvider.h>
#import "OGTKEntryBuffer.h"
#import "OGTKEntryCompletion.h"
#import <OGio/OGMenuModel.h>

@implementation OGTKEntry

- (instancetype)init
{
	GtkEntry* gobjectValue = GTK_ENTRY(gtk_entry_new());

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
	GtkEntry* gobjectValue = GTK_ENTRY(gtk_entry_new_with_buffer([buffer castedGObject]));

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

- (GtkEntry*)castedGObject
{
	return GTK_ENTRY([self gObject]);
}

- (bool)activatesDefault
{
	bool returnValue = gtk_entry_get_activates_default([self castedGObject]);

	return returnValue;
}

- (float)alignment
{
	float returnValue = gtk_entry_get_alignment([self castedGObject]);

	return returnValue;
}

- (PangoAttrList*)attributes
{
	PangoAttrList* returnValue = gtk_entry_get_attributes([self castedGObject]);

	return returnValue;
}

- (OGTKEntryBuffer*)buffer
{
	GtkEntryBuffer* gobjectValue = GTK_ENTRY_BUFFER(gtk_entry_get_buffer([self castedGObject]));

	OGTKEntryBuffer* returnValue = [OGTKEntryBuffer withGObject:gobjectValue];
	return returnValue;
}

- (OGTKEntryCompletion*)completion
{
	GtkEntryCompletion* gobjectValue = GTK_ENTRY_COMPLETION(gtk_entry_get_completion([self castedGObject]));

	OGTKEntryCompletion* returnValue = [OGTKEntryCompletion withGObject:gobjectValue];
	return returnValue;
}

- (int)currentIconDragSource
{
	int returnValue = gtk_entry_get_current_icon_drag_source([self castedGObject]);

	return returnValue;
}

- (OGMenuModel*)extraMenu
{
	GMenuModel* gobjectValue = G_MENU_MODEL(gtk_entry_get_extra_menu([self castedGObject]));

	OGMenuModel* returnValue = [OGMenuModel withGObject:gobjectValue];
	return returnValue;
}

- (bool)hasFrame
{
	bool returnValue = gtk_entry_get_has_frame([self castedGObject]);

	return returnValue;
}

- (bool)iconActivatable:(GtkEntryIconPosition)iconPos
{
	bool returnValue = gtk_entry_get_icon_activatable([self castedGObject], iconPos);

	return returnValue;
}

- (void)iconAreaWithIconPos:(GtkEntryIconPosition)iconPos iconArea:(GdkRectangle*)iconArea
{
	gtk_entry_get_icon_area([self castedGObject], iconPos, iconArea);
}

- (int)iconAtPosWithX:(int)x y:(int)y
{
	int returnValue = gtk_entry_get_icon_at_pos([self castedGObject], x, y);

	return returnValue;
}

- (GIcon*)iconGicon:(GtkEntryIconPosition)iconPos
{
	GIcon* returnValue = gtk_entry_get_icon_gicon([self castedGObject], iconPos);

	return returnValue;
}

- (OFString*)iconName:(GtkEntryIconPosition)iconPos
{
	const char* gobjectValue = gtk_entry_get_icon_name([self castedGObject], iconPos);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (GdkPaintable*)iconPaintable:(GtkEntryIconPosition)iconPos
{
	GdkPaintable* returnValue = gtk_entry_get_icon_paintable([self castedGObject], iconPos);

	return returnValue;
}

- (bool)iconSensitive:(GtkEntryIconPosition)iconPos
{
	bool returnValue = gtk_entry_get_icon_sensitive([self castedGObject], iconPos);

	return returnValue;
}

- (GtkImageType)iconStorageType:(GtkEntryIconPosition)iconPos
{
	GtkImageType returnValue = gtk_entry_get_icon_storage_type([self castedGObject], iconPos);

	return returnValue;
}

- (char*)iconTooltipMarkup:(GtkEntryIconPosition)iconPos
{
	char* gobjectValue = gtk_entry_get_icon_tooltip_markup([self castedGObject], iconPos);

	char* returnValue = gobjectValue;
	return returnValue;
}

- (char*)iconTooltipText:(GtkEntryIconPosition)iconPos
{
	char* gobjectValue = gtk_entry_get_icon_tooltip_text([self castedGObject], iconPos);

	char* returnValue = gobjectValue;
	return returnValue;
}

- (GtkInputHints)inputHints
{
	GtkInputHints returnValue = gtk_entry_get_input_hints([self castedGObject]);

	return returnValue;
}

- (GtkInputPurpose)inputPurpose
{
	GtkInputPurpose returnValue = gtk_entry_get_input_purpose([self castedGObject]);

	return returnValue;
}

- (gunichar)invisibleChar
{
	gunichar returnValue = gtk_entry_get_invisible_char([self castedGObject]);

	return returnValue;
}

- (int)maxLength
{
	int returnValue = gtk_entry_get_max_length([self castedGObject]);

	return returnValue;
}

- (bool)overwriteMode
{
	bool returnValue = gtk_entry_get_overwrite_mode([self castedGObject]);

	return returnValue;
}

- (OFString*)placeholderText
{
	const char* gobjectValue = gtk_entry_get_placeholder_text([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (double)progressFraction
{
	double returnValue = gtk_entry_get_progress_fraction([self castedGObject]);

	return returnValue;
}

- (double)progressPulseStep
{
	double returnValue = gtk_entry_get_progress_pulse_step([self castedGObject]);

	return returnValue;
}

- (PangoTabArray*)tabs
{
	PangoTabArray* returnValue = gtk_entry_get_tabs([self castedGObject]);

	return returnValue;
}

- (guint16)textLength
{
	guint16 returnValue = gtk_entry_get_text_length([self castedGObject]);

	return returnValue;
}

- (bool)visibility
{
	bool returnValue = gtk_entry_get_visibility([self castedGObject]);

	return returnValue;
}

- (bool)grabFocusWithoutSelecting
{
	bool returnValue = gtk_entry_grab_focus_without_selecting([self castedGObject]);

	return returnValue;
}

- (void)progressPulse
{
	gtk_entry_progress_pulse([self castedGObject]);
}

- (void)resetImContext
{
	gtk_entry_reset_im_context([self castedGObject]);
}

- (void)setActivatesDefault:(bool)setting
{
	gtk_entry_set_activates_default([self castedGObject], setting);
}

- (void)setAlignment:(float)xalign
{
	gtk_entry_set_alignment([self castedGObject], xalign);
}

- (void)setAttributes:(PangoAttrList*)attrs
{
	gtk_entry_set_attributes([self castedGObject], attrs);
}

- (void)setBuffer:(OGTKEntryBuffer*)buffer
{
	gtk_entry_set_buffer([self castedGObject], [buffer castedGObject]);
}

- (void)setCompletion:(OGTKEntryCompletion*)completion
{
	gtk_entry_set_completion([self castedGObject], [completion castedGObject]);
}

- (void)setExtraMenu:(OGMenuModel*)model
{
	gtk_entry_set_extra_menu([self castedGObject], [model castedGObject]);
}

- (void)setHasFrame:(bool)setting
{
	gtk_entry_set_has_frame([self castedGObject], setting);
}

- (void)setIconActivatableWithIconPos:(GtkEntryIconPosition)iconPos activatable:(bool)activatable
{
	gtk_entry_set_icon_activatable([self castedGObject], iconPos, activatable);
}

- (void)setIconDragSourceWithIconPos:(GtkEntryIconPosition)iconPos provider:(OGGdkContentProvider*)provider actions:(GdkDragAction)actions
{
	gtk_entry_set_icon_drag_source([self castedGObject], iconPos, [provider castedGObject], actions);
}

- (void)setIconFromGiconWithIconPos:(GtkEntryIconPosition)iconPos icon:(GIcon*)icon
{
	gtk_entry_set_icon_from_gicon([self castedGObject], iconPos, icon);
}

- (void)setIconFromIconNameWithIconPos:(GtkEntryIconPosition)iconPos iconName:(OFString*)iconName
{
	gtk_entry_set_icon_from_icon_name([self castedGObject], iconPos, [iconName UTF8String]);
}

- (void)setIconFromPaintableWithIconPos:(GtkEntryIconPosition)iconPos paintable:(GdkPaintable*)paintable
{
	gtk_entry_set_icon_from_paintable([self castedGObject], iconPos, paintable);
}

- (void)setIconSensitiveWithIconPos:(GtkEntryIconPosition)iconPos sensitive:(bool)sensitive
{
	gtk_entry_set_icon_sensitive([self castedGObject], iconPos, sensitive);
}

- (void)setIconTooltipMarkupWithIconPos:(GtkEntryIconPosition)iconPos tooltip:(OFString*)tooltip
{
	gtk_entry_set_icon_tooltip_markup([self castedGObject], iconPos, [tooltip UTF8String]);
}

- (void)setIconTooltipTextWithIconPos:(GtkEntryIconPosition)iconPos tooltip:(OFString*)tooltip
{
	gtk_entry_set_icon_tooltip_text([self castedGObject], iconPos, [tooltip UTF8String]);
}

- (void)setInputHints:(GtkInputHints)hints
{
	gtk_entry_set_input_hints([self castedGObject], hints);
}

- (void)setInputPurpose:(GtkInputPurpose)purpose
{
	gtk_entry_set_input_purpose([self castedGObject], purpose);
}

- (void)setInvisibleChar:(gunichar)ch
{
	gtk_entry_set_invisible_char([self castedGObject], ch);
}

- (void)setMaxLength:(int)max
{
	gtk_entry_set_max_length([self castedGObject], max);
}

- (void)setOverwriteMode:(bool)overwrite
{
	gtk_entry_set_overwrite_mode([self castedGObject], overwrite);
}

- (void)setPlaceholderText:(OFString*)text
{
	gtk_entry_set_placeholder_text([self castedGObject], [text UTF8String]);
}

- (void)setProgressFraction:(double)fraction
{
	gtk_entry_set_progress_fraction([self castedGObject], fraction);
}

- (void)setProgressPulseStep:(double)fraction
{
	gtk_entry_set_progress_pulse_step([self castedGObject], fraction);
}

- (void)setTabs:(PangoTabArray*)tabs
{
	gtk_entry_set_tabs([self castedGObject], tabs);
}

- (void)setVisibility:(bool)visible
{
	gtk_entry_set_visibility([self castedGObject], visible);
}

- (void)unsetInvisibleChar
{
	gtk_entry_unset_invisible_char([self castedGObject]);
}


@end