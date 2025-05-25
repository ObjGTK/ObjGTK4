/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKEntry.h"

#import <OGio/OGMenuModel.h>
#import <OGdk4/OGdkContentProvider.h>
#import "OGTKEntryBuffer.h"
#import "OGTKEntryCompletion.h"

@implementation OGTKEntry

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_ENTRY;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_ENTRY);
	return gObjectClass;
}

+ (instancetype)entry
{
	GtkEntry* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_entry_new(), GTK_TYPE_ENTRY, GtkEntry);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKEntry* wrapperObject;
	@try {
		wrapperObject = [[OGTKEntry alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

+ (instancetype)entryWithBuffer:(OGTKEntryBuffer*)buffer
{
	GtkEntry* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_entry_new_with_buffer([buffer castedGObject]), GTK_TYPE_ENTRY, GtkEntry);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKEntry* wrapperObject;
	@try {
		wrapperObject = [[OGTKEntry alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkEntry*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_ENTRY, GtkEntry);
}

- (bool)activatesDefault
{
	bool returnValue = (bool)gtk_entry_get_activates_default((GtkEntry*)[self castedGObject]);

	return returnValue;
}

- (float)alignment
{
	float returnValue = (float)gtk_entry_get_alignment((GtkEntry*)[self castedGObject]);

	return returnValue;
}

- (PangoAttrList*)attributes
{
	PangoAttrList* returnValue = (PangoAttrList*)gtk_entry_get_attributes((GtkEntry*)[self castedGObject]);

	return returnValue;
}

- (OGTKEntryBuffer*)buffer
{
	GtkEntryBuffer* gobjectValue = gtk_entry_get_buffer((GtkEntry*)[self castedGObject]);

	OGTKEntryBuffer* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OGTKEntryCompletion*)completion
{
	GtkEntryCompletion* gobjectValue = gtk_entry_get_completion((GtkEntry*)[self castedGObject]);

	OGTKEntryCompletion* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (int)currentIconDragSource
{
	int returnValue = (int)gtk_entry_get_current_icon_drag_source((GtkEntry*)[self castedGObject]);

	return returnValue;
}

- (OGMenuModel*)extraMenu
{
	GMenuModel* gobjectValue = gtk_entry_get_extra_menu((GtkEntry*)[self castedGObject]);

	OGMenuModel* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (bool)hasFrame
{
	bool returnValue = (bool)gtk_entry_get_has_frame((GtkEntry*)[self castedGObject]);

	return returnValue;
}

- (bool)iconActivatableWithIconPos:(GtkEntryIconPosition)iconPos
{
	bool returnValue = (bool)gtk_entry_get_icon_activatable((GtkEntry*)[self castedGObject], iconPos);

	return returnValue;
}

- (void)iconAreaWithIconPos:(GtkEntryIconPosition)iconPos iconArea:(GdkRectangle*)iconArea
{
	gtk_entry_get_icon_area((GtkEntry*)[self castedGObject], iconPos, iconArea);
}

- (int)iconAtPosWithX:(int)x y:(int)y
{
	int returnValue = (int)gtk_entry_get_icon_at_pos((GtkEntry*)[self castedGObject], x, y);

	return returnValue;
}

- (GIcon*)iconGiconWithIconPos:(GtkEntryIconPosition)iconPos
{
	GIcon* returnValue = (GIcon*)gtk_entry_get_icon_gicon((GtkEntry*)[self castedGObject], iconPos);

	return returnValue;
}

- (OFString*)iconNameWithIconPos:(GtkEntryIconPosition)iconPos
{
	const char* gobjectValue = gtk_entry_get_icon_name((GtkEntry*)[self castedGObject], iconPos);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (GdkPaintable*)iconPaintableWithIconPos:(GtkEntryIconPosition)iconPos
{
	GdkPaintable* returnValue = (GdkPaintable*)gtk_entry_get_icon_paintable((GtkEntry*)[self castedGObject], iconPos);

	return returnValue;
}

- (bool)iconSensitiveWithIconPos:(GtkEntryIconPosition)iconPos
{
	bool returnValue = (bool)gtk_entry_get_icon_sensitive((GtkEntry*)[self castedGObject], iconPos);

	return returnValue;
}

- (GtkImageType)iconStorageTypeWithIconPos:(GtkEntryIconPosition)iconPos
{
	GtkImageType returnValue = (GtkImageType)gtk_entry_get_icon_storage_type((GtkEntry*)[self castedGObject], iconPos);

	return returnValue;
}

- (OFString*)iconTooltipMarkupWithIconPos:(GtkEntryIconPosition)iconPos
{
	char* gobjectValue = gtk_entry_get_icon_tooltip_markup((GtkEntry*)[self castedGObject], iconPos);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

- (OFString*)iconTooltipTextWithIconPos:(GtkEntryIconPosition)iconPos
{
	char* gobjectValue = gtk_entry_get_icon_tooltip_text((GtkEntry*)[self castedGObject], iconPos);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

- (GtkInputHints)inputHints
{
	GtkInputHints returnValue = (GtkInputHints)gtk_entry_get_input_hints((GtkEntry*)[self castedGObject]);

	return returnValue;
}

- (GtkInputPurpose)inputPurpose
{
	GtkInputPurpose returnValue = (GtkInputPurpose)gtk_entry_get_input_purpose((GtkEntry*)[self castedGObject]);

	return returnValue;
}

- (gunichar)invisibleChar
{
	gunichar returnValue = (gunichar)gtk_entry_get_invisible_char((GtkEntry*)[self castedGObject]);

	return returnValue;
}

- (int)maxLength
{
	int returnValue = (int)gtk_entry_get_max_length((GtkEntry*)[self castedGObject]);

	return returnValue;
}

- (bool)overwriteMode
{
	bool returnValue = (bool)gtk_entry_get_overwrite_mode((GtkEntry*)[self castedGObject]);

	return returnValue;
}

- (OFString*)placeholderText
{
	const char* gobjectValue = gtk_entry_get_placeholder_text((GtkEntry*)[self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (double)progressFraction
{
	double returnValue = (double)gtk_entry_get_progress_fraction((GtkEntry*)[self castedGObject]);

	return returnValue;
}

- (double)progressPulseStep
{
	double returnValue = (double)gtk_entry_get_progress_pulse_step((GtkEntry*)[self castedGObject]);

	return returnValue;
}

- (PangoTabArray*)tabs
{
	PangoTabArray* returnValue = (PangoTabArray*)gtk_entry_get_tabs((GtkEntry*)[self castedGObject]);

	return returnValue;
}

- (guint16)textLength
{
	guint16 returnValue = (guint16)gtk_entry_get_text_length((GtkEntry*)[self castedGObject]);

	return returnValue;
}

- (bool)visibility
{
	bool returnValue = (bool)gtk_entry_get_visibility((GtkEntry*)[self castedGObject]);

	return returnValue;
}

- (bool)grabFocusWithoutSelecting
{
	bool returnValue = (bool)gtk_entry_grab_focus_without_selecting((GtkEntry*)[self castedGObject]);

	return returnValue;
}

- (void)progressPulse
{
	gtk_entry_progress_pulse((GtkEntry*)[self castedGObject]);
}

- (void)resetImContext
{
	gtk_entry_reset_im_context((GtkEntry*)[self castedGObject]);
}

- (void)setActivatesDefaultWithSetting:(bool)setting
{
	gtk_entry_set_activates_default((GtkEntry*)[self castedGObject], setting);
}

- (void)setAlignmentWithXalign:(float)xalign
{
	gtk_entry_set_alignment((GtkEntry*)[self castedGObject], xalign);
}

- (void)setAttributesWithAttrs:(PangoAttrList*)attrs
{
	gtk_entry_set_attributes((GtkEntry*)[self castedGObject], attrs);
}

- (void)setBuffer:(OGTKEntryBuffer*)buffer
{
	gtk_entry_set_buffer((GtkEntry*)[self castedGObject], [buffer castedGObject]);
}

- (void)setCompletion:(OGTKEntryCompletion*)completion
{
	gtk_entry_set_completion((GtkEntry*)[self castedGObject], [completion castedGObject]);
}

- (void)setExtraMenuWithModel:(OGMenuModel*)model
{
	gtk_entry_set_extra_menu((GtkEntry*)[self castedGObject], [model castedGObject]);
}

- (void)setHasFrameWithSetting:(bool)setting
{
	gtk_entry_set_has_frame((GtkEntry*)[self castedGObject], setting);
}

- (void)setIconActivatableWithIconPos:(GtkEntryIconPosition)iconPos activatable:(bool)activatable
{
	gtk_entry_set_icon_activatable((GtkEntry*)[self castedGObject], iconPos, activatable);
}

- (void)setIconDragSourceWithIconPos:(GtkEntryIconPosition)iconPos provider:(OGdkContentProvider*)provider actions:(GdkDragAction)actions
{
	gtk_entry_set_icon_drag_source((GtkEntry*)[self castedGObject], iconPos, [provider castedGObject], actions);
}

- (void)setIconFromGiconWithIconPos:(GtkEntryIconPosition)iconPos icon:(GIcon*)icon
{
	gtk_entry_set_icon_from_gicon((GtkEntry*)[self castedGObject], iconPos, icon);
}

- (void)setIconFromIconNameWithIconPos:(GtkEntryIconPosition)iconPos iconName:(OFString*)iconName
{
	gtk_entry_set_icon_from_icon_name((GtkEntry*)[self castedGObject], iconPos, [iconName UTF8String]);
}

- (void)setIconFromPaintableWithIconPos:(GtkEntryIconPosition)iconPos paintable:(GdkPaintable*)paintable
{
	gtk_entry_set_icon_from_paintable((GtkEntry*)[self castedGObject], iconPos, paintable);
}

- (void)setIconSensitiveWithIconPos:(GtkEntryIconPosition)iconPos sensitive:(bool)sensitive
{
	gtk_entry_set_icon_sensitive((GtkEntry*)[self castedGObject], iconPos, sensitive);
}

- (void)setIconTooltipMarkupWithIconPos:(GtkEntryIconPosition)iconPos tooltip:(OFString*)tooltip
{
	gtk_entry_set_icon_tooltip_markup((GtkEntry*)[self castedGObject], iconPos, [tooltip UTF8String]);
}

- (void)setIconTooltipTextWithIconPos:(GtkEntryIconPosition)iconPos tooltip:(OFString*)tooltip
{
	gtk_entry_set_icon_tooltip_text((GtkEntry*)[self castedGObject], iconPos, [tooltip UTF8String]);
}

- (void)setInputHints:(GtkInputHints)hints
{
	gtk_entry_set_input_hints((GtkEntry*)[self castedGObject], hints);
}

- (void)setInputPurpose:(GtkInputPurpose)purpose
{
	gtk_entry_set_input_purpose((GtkEntry*)[self castedGObject], purpose);
}

- (void)setInvisibleChar:(gunichar)ch
{
	gtk_entry_set_invisible_char((GtkEntry*)[self castedGObject], ch);
}

- (void)setMaxLength:(int)max
{
	gtk_entry_set_max_length((GtkEntry*)[self castedGObject], max);
}

- (void)setOverwriteMode:(bool)overwrite
{
	gtk_entry_set_overwrite_mode((GtkEntry*)[self castedGObject], overwrite);
}

- (void)setPlaceholderText:(OFString*)text
{
	gtk_entry_set_placeholder_text((GtkEntry*)[self castedGObject], [text UTF8String]);
}

- (void)setProgressFraction:(double)fraction
{
	gtk_entry_set_progress_fraction((GtkEntry*)[self castedGObject], fraction);
}

- (void)setProgressPulseStepWithFraction:(double)fraction
{
	gtk_entry_set_progress_pulse_step((GtkEntry*)[self castedGObject], fraction);
}

- (void)setTabs:(PangoTabArray*)tabs
{
	gtk_entry_set_tabs((GtkEntry*)[self castedGObject], tabs);
}

- (void)setVisibilityWithVisible:(bool)visible
{
	gtk_entry_set_visibility((GtkEntry*)[self castedGObject], visible);
}

- (void)unsetInvisibleChar
{
	gtk_entry_unset_invisible_char((GtkEntry*)[self castedGObject]);
}


@end