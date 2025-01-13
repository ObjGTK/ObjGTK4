/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKStyleContext.h"

#import <OGdk4/OGdkDisplay.h>

@implementation OGTKStyleContext

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_STYLE_CONTEXT;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (void)addProviderForDisplay:(OGdkDisplay*)display provider:(GtkStyleProvider*)provider priority:(guint)priority
{
	gtk_style_context_add_provider_for_display([display castedGObject], provider, priority);
}

+ (void)removeProviderForDisplay:(OGdkDisplay*)display provider:(GtkStyleProvider*)provider
{
	gtk_style_context_remove_provider_for_display([display castedGObject], provider);
}

- (GtkStyleContext*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkStyleContext, GtkStyleContext);
}

- (void)addClassWithClassName:(OFString*)className
{
	gtk_style_context_add_class([self castedGObject], [className UTF8String]);
}

- (void)addProvider:(GtkStyleProvider*)provider priority:(guint)priority
{
	gtk_style_context_add_provider([self castedGObject], provider, priority);
}

- (void)borderWithBorder:(GtkBorder*)border
{
	gtk_style_context_get_border([self castedGObject], border);
}

- (void)colorWithColor:(GdkRGBA*)color
{
	gtk_style_context_get_color([self castedGObject], color);
}

- (OGdkDisplay*)display
{
	GdkDisplay* gobjectValue = gtk_style_context_get_display([self castedGObject]);

	OGdkDisplay* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (void)marginWithMargin:(GtkBorder*)margin
{
	gtk_style_context_get_margin([self castedGObject], margin);
}

- (void)paddingWithPadding:(GtkBorder*)padding
{
	gtk_style_context_get_padding([self castedGObject], padding);
}

- (int)scale
{
	int returnValue = (int)gtk_style_context_get_scale([self castedGObject]);

	return returnValue;
}

- (GtkStateFlags)state
{
	GtkStateFlags returnValue = (GtkStateFlags)gtk_style_context_get_state([self castedGObject]);

	return returnValue;
}

- (bool)hasClassWithClassName:(OFString*)className
{
	bool returnValue = (bool)gtk_style_context_has_class([self castedGObject], [className UTF8String]);

	return returnValue;
}

- (bool)lookupColorWithColorName:(OFString*)colorName color:(GdkRGBA*)color
{
	bool returnValue = (bool)gtk_style_context_lookup_color([self castedGObject], [colorName UTF8String], color);

	return returnValue;
}

- (void)removeClassWithClassName:(OFString*)className
{
	gtk_style_context_remove_class([self castedGObject], [className UTF8String]);
}

- (void)removeProvider:(GtkStyleProvider*)provider
{
	gtk_style_context_remove_provider([self castedGObject], provider);
}

- (void)restore
{
	gtk_style_context_restore([self castedGObject]);
}

- (void)save
{
	gtk_style_context_save([self castedGObject]);
}

- (void)setDisplay:(OGdkDisplay*)display
{
	gtk_style_context_set_display([self castedGObject], [display castedGObject]);
}

- (void)setScale:(int)scale
{
	gtk_style_context_set_scale([self castedGObject], scale);
}

- (void)setStateWithFlags:(GtkStateFlags)flags
{
	gtk_style_context_set_state([self castedGObject], flags);
}

- (OFString*)toStringWithFlags:(GtkStyleContextPrintFlags)flags
{
	char* gobjectValue = gtk_style_context_to_string([self castedGObject], flags);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}


@end