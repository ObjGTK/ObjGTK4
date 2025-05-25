/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKAssistant.h"

#import "OGTKAssistantPage.h"
#import "OGTKWidget.h"

@implementation OGTKAssistant

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_ASSISTANT;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_ASSISTANT);
	return gObjectClass;
}

+ (instancetype)assistant
{
	GtkAssistant* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_assistant_new(), GTK_TYPE_ASSISTANT, GtkAssistant);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKAssistant* wrapperObject;
	@try {
		wrapperObject = [[OGTKAssistant alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkAssistant*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_ASSISTANT, GtkAssistant);
}

- (void)addActionWidgetWithChild:(OGTKWidget*)child
{
	gtk_assistant_add_action_widget((GtkAssistant*)[self castedGObject], [child castedGObject]);
}

- (int)appendPage:(OGTKWidget*)page
{
	int returnValue = (int)gtk_assistant_append_page((GtkAssistant*)[self castedGObject], [page castedGObject]);

	return returnValue;
}

- (void)commit
{
	gtk_assistant_commit((GtkAssistant*)[self castedGObject]);
}

- (int)currentPage
{
	int returnValue = (int)gtk_assistant_get_current_page((GtkAssistant*)[self castedGObject]);

	return returnValue;
}

- (int)npages
{
	int returnValue = (int)gtk_assistant_get_n_pages((GtkAssistant*)[self castedGObject]);

	return returnValue;
}

- (OGTKWidget*)nthPageWithPageNum:(int)pageNum
{
	GtkWidget* gobjectValue = gtk_assistant_get_nth_page((GtkAssistant*)[self castedGObject], pageNum);

	OGTKWidget* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OGTKAssistantPage*)pageWithChild:(OGTKWidget*)child
{
	GtkAssistantPage* gobjectValue = gtk_assistant_get_page((GtkAssistant*)[self castedGObject], [child castedGObject]);

	OGTKAssistantPage* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (bool)pageCompleteWithPage:(OGTKWidget*)page
{
	bool returnValue = (bool)gtk_assistant_get_page_complete((GtkAssistant*)[self castedGObject], [page castedGObject]);

	return returnValue;
}

- (OFString*)pageTitleWithPage:(OGTKWidget*)page
{
	const char* gobjectValue = gtk_assistant_get_page_title((GtkAssistant*)[self castedGObject], [page castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (GtkAssistantPageType)pageTypeWithPage:(OGTKWidget*)page
{
	GtkAssistantPageType returnValue = (GtkAssistantPageType)gtk_assistant_get_page_type((GtkAssistant*)[self castedGObject], [page castedGObject]);

	return returnValue;
}

- (GListModel*)pages
{
	GListModel* returnValue = (GListModel*)gtk_assistant_get_pages((GtkAssistant*)[self castedGObject]);

	return returnValue;
}

- (int)insertPage:(OGTKWidget*)page position:(int)position
{
	int returnValue = (int)gtk_assistant_insert_page((GtkAssistant*)[self castedGObject], [page castedGObject], position);

	return returnValue;
}

- (void)nextPage
{
	gtk_assistant_next_page((GtkAssistant*)[self castedGObject]);
}

- (int)prependPage:(OGTKWidget*)page
{
	int returnValue = (int)gtk_assistant_prepend_page((GtkAssistant*)[self castedGObject], [page castedGObject]);

	return returnValue;
}

- (void)previousPage
{
	gtk_assistant_previous_page((GtkAssistant*)[self castedGObject]);
}

- (void)removeActionWidgetWithChild:(OGTKWidget*)child
{
	gtk_assistant_remove_action_widget((GtkAssistant*)[self castedGObject], [child castedGObject]);
}

- (void)removePageWithPageNum:(int)pageNum
{
	gtk_assistant_remove_page((GtkAssistant*)[self castedGObject], pageNum);
}

- (void)setCurrentPageWithPageNum:(int)pageNum
{
	gtk_assistant_set_current_page((GtkAssistant*)[self castedGObject], pageNum);
}

- (void)setForwardPageFunc:(GtkAssistantPageFunc)pageFunc data:(gpointer)data destroy:(GDestroyNotify)destroy
{
	gtk_assistant_set_forward_page_func((GtkAssistant*)[self castedGObject], pageFunc, data, destroy);
}

- (void)setPageComplete:(OGTKWidget*)page complete:(bool)complete
{
	gtk_assistant_set_page_complete((GtkAssistant*)[self castedGObject], [page castedGObject], complete);
}

- (void)setPageTitle:(OGTKWidget*)page title:(OFString*)title
{
	gtk_assistant_set_page_title((GtkAssistant*)[self castedGObject], [page castedGObject], [title UTF8String]);
}

- (void)setPageType:(OGTKWidget*)page type:(GtkAssistantPageType)type
{
	gtk_assistant_set_page_type((GtkAssistant*)[self castedGObject], [page castedGObject], type);
}

- (void)updateButtonsState
{
	gtk_assistant_update_buttons_state((GtkAssistant*)[self castedGObject]);
}


@end