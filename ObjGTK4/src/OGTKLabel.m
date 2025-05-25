/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKLabel.h"

#import <OGio/OGMenuModel.h>
#import <OGPango/OGPangoLayout.h>

@implementation OGTKLabel

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_LABEL;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_LABEL);
	return gObjectClass;
}

+ (instancetype)labelWithStr:(OFString*)str
{
	GtkLabel* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_label_new([str UTF8String]), GTK_TYPE_LABEL, GtkLabel);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKLabel* wrapperObject;
	@try {
		wrapperObject = [[OGTKLabel alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

+ (instancetype)labelWithMnemonicWithStr:(OFString*)str
{
	GtkLabel* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_label_new_with_mnemonic([str UTF8String]), GTK_TYPE_LABEL, GtkLabel);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKLabel* wrapperObject;
	@try {
		wrapperObject = [[OGTKLabel alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkLabel*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_LABEL, GtkLabel);
}

- (PangoAttrList*)attributes
{
	PangoAttrList* returnValue = (PangoAttrList*)gtk_label_get_attributes((GtkLabel*)[self castedGObject]);

	return returnValue;
}

- (OFString*)currentUri
{
	const char* gobjectValue = gtk_label_get_current_uri((GtkLabel*)[self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (PangoEllipsizeMode)ellipsize
{
	PangoEllipsizeMode returnValue = (PangoEllipsizeMode)gtk_label_get_ellipsize((GtkLabel*)[self castedGObject]);

	return returnValue;
}

- (OGMenuModel*)extraMenu
{
	GMenuModel* gobjectValue = gtk_label_get_extra_menu((GtkLabel*)[self castedGObject]);

	OGMenuModel* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (GtkJustification)justify
{
	GtkJustification returnValue = (GtkJustification)gtk_label_get_justify((GtkLabel*)[self castedGObject]);

	return returnValue;
}

- (OFString*)label
{
	const char* gobjectValue = gtk_label_get_label((GtkLabel*)[self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OGPangoLayout*)layout
{
	PangoLayout* gobjectValue = gtk_label_get_layout((GtkLabel*)[self castedGObject]);

	OGPangoLayout* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (void)layoutOffsetsWithX:(int*)x y:(int*)y
{
	gtk_label_get_layout_offsets((GtkLabel*)[self castedGObject], x, y);
}

- (int)lines
{
	int returnValue = (int)gtk_label_get_lines((GtkLabel*)[self castedGObject]);

	return returnValue;
}

- (int)maxWidthChars
{
	int returnValue = (int)gtk_label_get_max_width_chars((GtkLabel*)[self castedGObject]);

	return returnValue;
}

- (guint)mnemonicKeyval
{
	guint returnValue = (guint)gtk_label_get_mnemonic_keyval((GtkLabel*)[self castedGObject]);

	return returnValue;
}

- (OGTKWidget*)mnemonicWidget
{
	GtkWidget* gobjectValue = gtk_label_get_mnemonic_widget((GtkLabel*)[self castedGObject]);

	OGTKWidget* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (GtkNaturalWrapMode)naturalWrapMode
{
	GtkNaturalWrapMode returnValue = (GtkNaturalWrapMode)gtk_label_get_natural_wrap_mode((GtkLabel*)[self castedGObject]);

	return returnValue;
}

- (bool)selectable
{
	bool returnValue = (bool)gtk_label_get_selectable((GtkLabel*)[self castedGObject]);

	return returnValue;
}

- (bool)selectionBoundsWithStart:(int*)start end:(int*)end
{
	bool returnValue = (bool)gtk_label_get_selection_bounds((GtkLabel*)[self castedGObject], start, end);

	return returnValue;
}

- (bool)singleLineMode
{
	bool returnValue = (bool)gtk_label_get_single_line_mode((GtkLabel*)[self castedGObject]);

	return returnValue;
}

- (PangoTabArray*)tabs
{
	PangoTabArray* returnValue = (PangoTabArray*)gtk_label_get_tabs((GtkLabel*)[self castedGObject]);

	return returnValue;
}

- (OFString*)text
{
	const char* gobjectValue = gtk_label_get_text((GtkLabel*)[self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (bool)useMarkup
{
	bool returnValue = (bool)gtk_label_get_use_markup((GtkLabel*)[self castedGObject]);

	return returnValue;
}

- (bool)useUnderline
{
	bool returnValue = (bool)gtk_label_get_use_underline((GtkLabel*)[self castedGObject]);

	return returnValue;
}

- (int)widthChars
{
	int returnValue = (int)gtk_label_get_width_chars((GtkLabel*)[self castedGObject]);

	return returnValue;
}

- (bool)wrap
{
	bool returnValue = (bool)gtk_label_get_wrap((GtkLabel*)[self castedGObject]);

	return returnValue;
}

- (PangoWrapMode)wrapMode
{
	PangoWrapMode returnValue = (PangoWrapMode)gtk_label_get_wrap_mode((GtkLabel*)[self castedGObject]);

	return returnValue;
}

- (float)xalign
{
	float returnValue = (float)gtk_label_get_xalign((GtkLabel*)[self castedGObject]);

	return returnValue;
}

- (float)yalign
{
	float returnValue = (float)gtk_label_get_yalign((GtkLabel*)[self castedGObject]);

	return returnValue;
}

- (void)selectRegionWithStartOffset:(int)startOffset endOffset:(int)endOffset
{
	gtk_label_select_region((GtkLabel*)[self castedGObject], startOffset, endOffset);
}

- (void)setAttributesWithAttrs:(PangoAttrList*)attrs
{
	gtk_label_set_attributes((GtkLabel*)[self castedGObject], attrs);
}

- (void)setEllipsizeWithMode:(PangoEllipsizeMode)mode
{
	gtk_label_set_ellipsize((GtkLabel*)[self castedGObject], mode);
}

- (void)setExtraMenuWithModel:(OGMenuModel*)model
{
	gtk_label_set_extra_menu((GtkLabel*)[self castedGObject], [model castedGObject]);
}

- (void)setJustifyWithJtype:(GtkJustification)jtype
{
	gtk_label_set_justify((GtkLabel*)[self castedGObject], jtype);
}

- (void)setLabelWithStr:(OFString*)str
{
	gtk_label_set_label((GtkLabel*)[self castedGObject], [str UTF8String]);
}

- (void)setLines:(int)lines
{
	gtk_label_set_lines((GtkLabel*)[self castedGObject], lines);
}

- (void)setMarkupWithStr:(OFString*)str
{
	gtk_label_set_markup((GtkLabel*)[self castedGObject], [str UTF8String]);
}

- (void)setMarkupWithMnemonicWithStr:(OFString*)str
{
	gtk_label_set_markup_with_mnemonic((GtkLabel*)[self castedGObject], [str UTF8String]);
}

- (void)setMaxWidthCharsWithNchars:(int)nchars
{
	gtk_label_set_max_width_chars((GtkLabel*)[self castedGObject], nchars);
}

- (void)setMnemonicWidget:(OGTKWidget*)widget
{
	gtk_label_set_mnemonic_widget((GtkLabel*)[self castedGObject], [widget castedGObject]);
}

- (void)setNaturalWrapMode:(GtkNaturalWrapMode)wrapMode
{
	gtk_label_set_natural_wrap_mode((GtkLabel*)[self castedGObject], wrapMode);
}

- (void)setSelectableWithSetting:(bool)setting
{
	gtk_label_set_selectable((GtkLabel*)[self castedGObject], setting);
}

- (void)setSingleLineMode:(bool)singleLineMode
{
	gtk_label_set_single_line_mode((GtkLabel*)[self castedGObject], singleLineMode);
}

- (void)setTabs:(PangoTabArray*)tabs
{
	gtk_label_set_tabs((GtkLabel*)[self castedGObject], tabs);
}

- (void)setTextWithStr:(OFString*)str
{
	gtk_label_set_text((GtkLabel*)[self castedGObject], [str UTF8String]);
}

- (void)setTextWithMnemonicWithStr:(OFString*)str
{
	gtk_label_set_text_with_mnemonic((GtkLabel*)[self castedGObject], [str UTF8String]);
}

- (void)setUseMarkupWithSetting:(bool)setting
{
	gtk_label_set_use_markup((GtkLabel*)[self castedGObject], setting);
}

- (void)setUseUnderlineWithSetting:(bool)setting
{
	gtk_label_set_use_underline((GtkLabel*)[self castedGObject], setting);
}

- (void)setWidthCharsWithNchars:(int)nchars
{
	gtk_label_set_width_chars((GtkLabel*)[self castedGObject], nchars);
}

- (void)setWrap:(bool)wrap
{
	gtk_label_set_wrap((GtkLabel*)[self castedGObject], wrap);
}

- (void)setWrapMode:(PangoWrapMode)wrapMode
{
	gtk_label_set_wrap_mode((GtkLabel*)[self castedGObject], wrapMode);
}

- (void)setXalign:(float)xalign
{
	gtk_label_set_xalign((GtkLabel*)[self castedGObject], xalign);
}

- (void)setYalign:(float)yalign
{
	gtk_label_set_yalign((GtkLabel*)[self castedGObject], yalign);
}


@end