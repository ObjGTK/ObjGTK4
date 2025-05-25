/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKNotebook.h"

#import "OGTKNotebookPage.h"

@implementation OGTKNotebook

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_NOTEBOOK;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_NOTEBOOK);
	return gObjectClass;
}

+ (instancetype)notebook
{
	GtkNotebook* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_notebook_new(), GTK_TYPE_NOTEBOOK, GtkNotebook);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKNotebook* wrapperObject;
	@try {
		wrapperObject = [[OGTKNotebook alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkNotebook*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_NOTEBOOK, GtkNotebook);
}

- (int)appendPageWithChild:(OGTKWidget*)child tabLabel:(OGTKWidget*)tabLabel
{
	int returnValue = (int)gtk_notebook_append_page((GtkNotebook*)[self castedGObject], [child castedGObject], [tabLabel castedGObject]);

	return returnValue;
}

- (int)appendPageMenuWithChild:(OGTKWidget*)child tabLabel:(OGTKWidget*)tabLabel menuLabel:(OGTKWidget*)menuLabel
{
	int returnValue = (int)gtk_notebook_append_page_menu((GtkNotebook*)[self castedGObject], [child castedGObject], [tabLabel castedGObject], [menuLabel castedGObject]);

	return returnValue;
}

- (void)detachTabWithChild:(OGTKWidget*)child
{
	gtk_notebook_detach_tab((GtkNotebook*)[self castedGObject], [child castedGObject]);
}

- (OGTKWidget*)actionWidgetWithPackType:(GtkPackType)packType
{
	GtkWidget* gobjectValue = gtk_notebook_get_action_widget((GtkNotebook*)[self castedGObject], packType);

	OGTKWidget* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (int)currentPage
{
	int returnValue = (int)gtk_notebook_get_current_page((GtkNotebook*)[self castedGObject]);

	return returnValue;
}

- (OFString*)groupName
{
	const char* gobjectValue = gtk_notebook_get_group_name((GtkNotebook*)[self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OGTKWidget*)menuLabelWithChild:(OGTKWidget*)child
{
	GtkWidget* gobjectValue = gtk_notebook_get_menu_label((GtkNotebook*)[self castedGObject], [child castedGObject]);

	OGTKWidget* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OFString*)menuLabelTextWithChild:(OGTKWidget*)child
{
	const char* gobjectValue = gtk_notebook_get_menu_label_text((GtkNotebook*)[self castedGObject], [child castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (int)npages
{
	int returnValue = (int)gtk_notebook_get_n_pages((GtkNotebook*)[self castedGObject]);

	return returnValue;
}

- (OGTKWidget*)nthPageWithPageNum:(int)pageNum
{
	GtkWidget* gobjectValue = gtk_notebook_get_nth_page((GtkNotebook*)[self castedGObject], pageNum);

	OGTKWidget* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OGTKNotebookPage*)pageWithChild:(OGTKWidget*)child
{
	GtkNotebookPage* gobjectValue = gtk_notebook_get_page((GtkNotebook*)[self castedGObject], [child castedGObject]);

	OGTKNotebookPage* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (GListModel*)pages
{
	GListModel* returnValue = (GListModel*)gtk_notebook_get_pages((GtkNotebook*)[self castedGObject]);

	return returnValue;
}

- (bool)scrollable
{
	bool returnValue = (bool)gtk_notebook_get_scrollable((GtkNotebook*)[self castedGObject]);

	return returnValue;
}

- (bool)showBorder
{
	bool returnValue = (bool)gtk_notebook_get_show_border((GtkNotebook*)[self castedGObject]);

	return returnValue;
}

- (bool)showTabs
{
	bool returnValue = (bool)gtk_notebook_get_show_tabs((GtkNotebook*)[self castedGObject]);

	return returnValue;
}

- (bool)tabDetachableWithChild:(OGTKWidget*)child
{
	bool returnValue = (bool)gtk_notebook_get_tab_detachable((GtkNotebook*)[self castedGObject], [child castedGObject]);

	return returnValue;
}

- (OGTKWidget*)tabLabelWithChild:(OGTKWidget*)child
{
	GtkWidget* gobjectValue = gtk_notebook_get_tab_label((GtkNotebook*)[self castedGObject], [child castedGObject]);

	OGTKWidget* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OFString*)tabLabelTextWithChild:(OGTKWidget*)child
{
	const char* gobjectValue = gtk_notebook_get_tab_label_text((GtkNotebook*)[self castedGObject], [child castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (GtkPositionType)tabPos
{
	GtkPositionType returnValue = (GtkPositionType)gtk_notebook_get_tab_pos((GtkNotebook*)[self castedGObject]);

	return returnValue;
}

- (bool)tabReorderableWithChild:(OGTKWidget*)child
{
	bool returnValue = (bool)gtk_notebook_get_tab_reorderable((GtkNotebook*)[self castedGObject], [child castedGObject]);

	return returnValue;
}

- (int)insertPageWithChild:(OGTKWidget*)child tabLabel:(OGTKWidget*)tabLabel position:(int)position
{
	int returnValue = (int)gtk_notebook_insert_page((GtkNotebook*)[self castedGObject], [child castedGObject], [tabLabel castedGObject], position);

	return returnValue;
}

- (int)insertPageMenuWithChild:(OGTKWidget*)child tabLabel:(OGTKWidget*)tabLabel menuLabel:(OGTKWidget*)menuLabel position:(int)position
{
	int returnValue = (int)gtk_notebook_insert_page_menu((GtkNotebook*)[self castedGObject], [child castedGObject], [tabLabel castedGObject], [menuLabel castedGObject], position);

	return returnValue;
}

- (void)nextPage
{
	gtk_notebook_next_page((GtkNotebook*)[self castedGObject]);
}

- (int)pageNumWithChild:(OGTKWidget*)child
{
	int returnValue = (int)gtk_notebook_page_num((GtkNotebook*)[self castedGObject], [child castedGObject]);

	return returnValue;
}

- (void)popupDisable
{
	gtk_notebook_popup_disable((GtkNotebook*)[self castedGObject]);
}

- (void)popupEnable
{
	gtk_notebook_popup_enable((GtkNotebook*)[self castedGObject]);
}

- (int)prependPageWithChild:(OGTKWidget*)child tabLabel:(OGTKWidget*)tabLabel
{
	int returnValue = (int)gtk_notebook_prepend_page((GtkNotebook*)[self castedGObject], [child castedGObject], [tabLabel castedGObject]);

	return returnValue;
}

- (int)prependPageMenuWithChild:(OGTKWidget*)child tabLabel:(OGTKWidget*)tabLabel menuLabel:(OGTKWidget*)menuLabel
{
	int returnValue = (int)gtk_notebook_prepend_page_menu((GtkNotebook*)[self castedGObject], [child castedGObject], [tabLabel castedGObject], [menuLabel castedGObject]);

	return returnValue;
}

- (void)prevPage
{
	gtk_notebook_prev_page((GtkNotebook*)[self castedGObject]);
}

- (void)removePageWithPageNum:(int)pageNum
{
	gtk_notebook_remove_page((GtkNotebook*)[self castedGObject], pageNum);
}

- (void)reorderChild:(OGTKWidget*)child position:(int)position
{
	gtk_notebook_reorder_child((GtkNotebook*)[self castedGObject], [child castedGObject], position);
}

- (void)setActionWidget:(OGTKWidget*)widget packType:(GtkPackType)packType
{
	gtk_notebook_set_action_widget((GtkNotebook*)[self castedGObject], [widget castedGObject], packType);
}

- (void)setCurrentPageWithPageNum:(int)pageNum
{
	gtk_notebook_set_current_page((GtkNotebook*)[self castedGObject], pageNum);
}

- (void)setGroupName:(OFString*)groupName
{
	gtk_notebook_set_group_name((GtkNotebook*)[self castedGObject], [groupName UTF8String]);
}

- (void)setMenuLabelWithChild:(OGTKWidget*)child menuLabel:(OGTKWidget*)menuLabel
{
	gtk_notebook_set_menu_label((GtkNotebook*)[self castedGObject], [child castedGObject], [menuLabel castedGObject]);
}

- (void)setMenuLabelTextWithChild:(OGTKWidget*)child menuText:(OFString*)menuText
{
	gtk_notebook_set_menu_label_text((GtkNotebook*)[self castedGObject], [child castedGObject], [menuText UTF8String]);
}

- (void)setScrollable:(bool)scrollable
{
	gtk_notebook_set_scrollable((GtkNotebook*)[self castedGObject], scrollable);
}

- (void)setShowBorder:(bool)showBorder
{
	gtk_notebook_set_show_border((GtkNotebook*)[self castedGObject], showBorder);
}

- (void)setShowTabs:(bool)showTabs
{
	gtk_notebook_set_show_tabs((GtkNotebook*)[self castedGObject], showTabs);
}

- (void)setTabDetachableWithChild:(OGTKWidget*)child detachable:(bool)detachable
{
	gtk_notebook_set_tab_detachable((GtkNotebook*)[self castedGObject], [child castedGObject], detachable);
}

- (void)setTabLabelWithChild:(OGTKWidget*)child tabLabel:(OGTKWidget*)tabLabel
{
	gtk_notebook_set_tab_label((GtkNotebook*)[self castedGObject], [child castedGObject], [tabLabel castedGObject]);
}

- (void)setTabLabelTextWithChild:(OGTKWidget*)child tabText:(OFString*)tabText
{
	gtk_notebook_set_tab_label_text((GtkNotebook*)[self castedGObject], [child castedGObject], [tabText UTF8String]);
}

- (void)setTabPos:(GtkPositionType)pos
{
	gtk_notebook_set_tab_pos((GtkNotebook*)[self castedGObject], pos);
}

- (void)setTabReorderableWithChild:(OGTKWidget*)child reorderable:(bool)reorderable
{
	gtk_notebook_set_tab_reorderable((GtkNotebook*)[self castedGObject], [child castedGObject], reorderable);
}


@end