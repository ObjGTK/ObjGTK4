/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKLabel.h"

#import <OGio/OGMenuModel.h>
#import <OGPango/OGPangoLayout.h>

@implementation OGTKLabel

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_LABEL;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)label:(OFString*)str
{
	GtkLabel* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_label_new([str UTF8String]), GtkLabel, GtkLabel);

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

+ (instancetype)labelWithMnemonic:(OFString*)str
{
	GtkLabel* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_label_new_with_mnemonic([str UTF8String]), GtkLabel, GtkLabel);

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
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkLabel, GtkLabel);
}

- (PangoAttrList*)attributes
{
	PangoAttrList* returnValue = (PangoAttrList*)gtk_label_get_attributes([self castedGObject]);

	return returnValue;
}

- (OFString*)currentUri
{
	const char* gobjectValue = gtk_label_get_current_uri([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (PangoEllipsizeMode)ellipsize
{
	PangoEllipsizeMode returnValue = (PangoEllipsizeMode)gtk_label_get_ellipsize([self castedGObject]);

	return returnValue;
}

- (OGMenuModel*)extraMenu
{
	GMenuModel* gobjectValue = gtk_label_get_extra_menu([self castedGObject]);

	OGMenuModel* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (GtkJustification)justify
{
	GtkJustification returnValue = (GtkJustification)gtk_label_get_justify([self castedGObject]);

	return returnValue;
}

- (OFString*)label
{
	const char* gobjectValue = gtk_label_get_label([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OGPangoLayout*)layout
{
	PangoLayout* gobjectValue = gtk_label_get_layout([self castedGObject]);

	OGPangoLayout* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (void)layoutOffsetsWithX:(int*)x y:(int*)y
{
	gtk_label_get_layout_offsets([self castedGObject], x, y);
}

- (int)lines
{
	int returnValue = (int)gtk_label_get_lines([self castedGObject]);

	return returnValue;
}

- (int)maxWidthChars
{
	int returnValue = (int)gtk_label_get_max_width_chars([self castedGObject]);

	return returnValue;
}

- (guint)mnemonicKeyval
{
	guint returnValue = (guint)gtk_label_get_mnemonic_keyval([self castedGObject]);

	return returnValue;
}

- (OGTKWidget*)mnemonicWidget
{
	GtkWidget* gobjectValue = gtk_label_get_mnemonic_widget([self castedGObject]);

	OGTKWidget* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (GtkNaturalWrapMode)naturalWrapMode
{
	GtkNaturalWrapMode returnValue = (GtkNaturalWrapMode)gtk_label_get_natural_wrap_mode([self castedGObject]);

	return returnValue;
}

- (bool)selectable
{
	bool returnValue = (bool)gtk_label_get_selectable([self castedGObject]);

	return returnValue;
}

- (bool)selectionBoundsWithStart:(int*)start end:(int*)end
{
	bool returnValue = (bool)gtk_label_get_selection_bounds([self castedGObject], start, end);

	return returnValue;
}

- (bool)singleLineMode
{
	bool returnValue = (bool)gtk_label_get_single_line_mode([self castedGObject]);

	return returnValue;
}

- (PangoTabArray*)tabs
{
	PangoTabArray* returnValue = (PangoTabArray*)gtk_label_get_tabs([self castedGObject]);

	return returnValue;
}

- (OFString*)text
{
	const char* gobjectValue = gtk_label_get_text([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (bool)useMarkup
{
	bool returnValue = (bool)gtk_label_get_use_markup([self castedGObject]);

	return returnValue;
}

- (bool)useUnderline
{
	bool returnValue = (bool)gtk_label_get_use_underline([self castedGObject]);

	return returnValue;
}

- (int)widthChars
{
	int returnValue = (int)gtk_label_get_width_chars([self castedGObject]);

	return returnValue;
}

- (bool)wrap
{
	bool returnValue = (bool)gtk_label_get_wrap([self castedGObject]);

	return returnValue;
}

- (PangoWrapMode)wrapMode
{
	PangoWrapMode returnValue = (PangoWrapMode)gtk_label_get_wrap_mode([self castedGObject]);

	return returnValue;
}

- (float)xalign
{
	float returnValue = (float)gtk_label_get_xalign([self castedGObject]);

	return returnValue;
}

- (float)yalign
{
	float returnValue = (float)gtk_label_get_yalign([self castedGObject]);

	return returnValue;
}

- (void)selectRegionWithStartOffset:(int)startOffset endOffset:(int)endOffset
{
	gtk_label_select_region([self castedGObject], startOffset, endOffset);
}

- (void)setAttributes:(PangoAttrList*)attrs
{
	gtk_label_set_attributes([self castedGObject], attrs);
}

- (void)setEllipsize:(PangoEllipsizeMode)mode
{
	gtk_label_set_ellipsize([self castedGObject], mode);
}

- (void)setExtraMenu:(OGMenuModel*)model
{
	gtk_label_set_extra_menu([self castedGObject], [model castedGObject]);
}

- (void)setJustify:(GtkJustification)jtype
{
	gtk_label_set_justify([self castedGObject], jtype);
}

- (void)setLabel:(OFString*)str
{
	gtk_label_set_label([self castedGObject], [str UTF8String]);
}

- (void)setLines:(int)lines
{
	gtk_label_set_lines([self castedGObject], lines);
}

- (void)setMarkup:(OFString*)str
{
	gtk_label_set_markup([self castedGObject], [str UTF8String]);
}

- (void)setMarkupWithMnemonic:(OFString*)str
{
	gtk_label_set_markup_with_mnemonic([self castedGObject], [str UTF8String]);
}

- (void)setMaxWidthChars:(int)nchars
{
	gtk_label_set_max_width_chars([self castedGObject], nchars);
}

- (void)setMnemonicWidget:(OGTKWidget*)widget
{
	gtk_label_set_mnemonic_widget([self castedGObject], [widget castedGObject]);
}

- (void)setNaturalWrapMode:(GtkNaturalWrapMode)wrapMode
{
	gtk_label_set_natural_wrap_mode([self castedGObject], wrapMode);
}

- (void)setSelectable:(bool)setting
{
	gtk_label_set_selectable([self castedGObject], setting);
}

- (void)setSingleLineMode:(bool)singleLineMode
{
	gtk_label_set_single_line_mode([self castedGObject], singleLineMode);
}

- (void)setTabs:(PangoTabArray*)tabs
{
	gtk_label_set_tabs([self castedGObject], tabs);
}

- (void)setText:(OFString*)str
{
	gtk_label_set_text([self castedGObject], [str UTF8String]);
}

- (void)setTextWithMnemonic:(OFString*)str
{
	gtk_label_set_text_with_mnemonic([self castedGObject], [str UTF8String]);
}

- (void)setUseMarkup:(bool)setting
{
	gtk_label_set_use_markup([self castedGObject], setting);
}

- (void)setUseUnderline:(bool)setting
{
	gtk_label_set_use_underline([self castedGObject], setting);
}

- (void)setWidthChars:(int)nchars
{
	gtk_label_set_width_chars([self castedGObject], nchars);
}

- (void)setWrap:(bool)wrap
{
	gtk_label_set_wrap([self castedGObject], wrap);
}

- (void)setWrapMode:(PangoWrapMode)wrapMode
{
	gtk_label_set_wrap_mode([self castedGObject], wrapMode);
}

- (void)setXalign:(float)xalign
{
	gtk_label_set_xalign([self castedGObject], xalign);
}

- (void)setYalign:(float)yalign
{
	gtk_label_set_yalign([self castedGObject], yalign);
}


@end