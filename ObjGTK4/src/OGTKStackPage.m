/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKStackPage.h"

#import "OGTKWidget.h"

@implementation OGTKStackPage

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_STACK_PAGE;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_STACK_PAGE);
	return gObjectClass;
}

- (GtkStackPage*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_STACK_PAGE, GtkStackPage);
}

- (OGTKWidget*)child
{
	GtkWidget* gobjectValue = gtk_stack_page_get_child((GtkStackPage*)[self castedGObject]);

	OGTKWidget* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OFString*)iconName
{
	const char* gobjectValue = gtk_stack_page_get_icon_name((GtkStackPage*)[self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OFString*)name
{
	const char* gobjectValue = gtk_stack_page_get_name((GtkStackPage*)[self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (bool)needsAttention
{
	bool returnValue = (bool)gtk_stack_page_get_needs_attention((GtkStackPage*)[self castedGObject]);

	return returnValue;
}

- (OFString*)title
{
	const char* gobjectValue = gtk_stack_page_get_title((GtkStackPage*)[self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (bool)useUnderline
{
	bool returnValue = (bool)gtk_stack_page_get_use_underline((GtkStackPage*)[self castedGObject]);

	return returnValue;
}

- (bool)visible
{
	bool returnValue = (bool)gtk_stack_page_get_visible((GtkStackPage*)[self castedGObject]);

	return returnValue;
}

- (void)setIconNameWithSetting:(OFString*)setting
{
	gtk_stack_page_set_icon_name((GtkStackPage*)[self castedGObject], [setting UTF8String]);
}

- (void)setNameWithSetting:(OFString*)setting
{
	gtk_stack_page_set_name((GtkStackPage*)[self castedGObject], [setting UTF8String]);
}

- (void)setNeedsAttentionWithSetting:(bool)setting
{
	gtk_stack_page_set_needs_attention((GtkStackPage*)[self castedGObject], setting);
}

- (void)setTitleWithSetting:(OFString*)setting
{
	gtk_stack_page_set_title((GtkStackPage*)[self castedGObject], [setting UTF8String]);
}

- (void)setUseUnderlineWithSetting:(bool)setting
{
	gtk_stack_page_set_use_underline((GtkStackPage*)[self castedGObject], setting);
}

- (void)setVisible:(bool)visible
{
	gtk_stack_page_set_visible((GtkStackPage*)[self castedGObject], visible);
}


@end