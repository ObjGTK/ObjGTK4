/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKWidget.h"

#import <OGdk4/OGGdkCursor.h>
#import <OGPango/OGPangoFontMap.h>
#import <OGPango/OGPangoContext.h>
#import <OGdk4/OGGdkFrameClock.h>
#import "OGTKLayoutManager.h"
#import "OGTKStyleContext.h"
#import <OGdk4/OGGdkDisplay.h>
#import <OGPango/OGPangoLayout.h>
#import "OGTKSettings.h"
#import <OGdk4/OGGdkClipboard.h>
#import "OGTKEventController.h"
#import "OGTKSnapshot.h"

@implementation OGTKWidget

+ (GtkTextDirection)defaultDirection
{
	GtkTextDirection returnValue = gtk_widget_get_default_direction();

	return returnValue;
}

+ (void)setDefaultDirection:(GtkTextDirection)dir
{
	gtk_widget_set_default_direction(dir);
}

- (GtkWidget*)castedGObject
{
	return GTK_WIDGET([self gObject]);
}

- (void)actionSetEnabledWithActionName:(OFString*)actionName enabled:(bool)enabled
{
	gtk_widget_action_set_enabled([self castedGObject], [actionName UTF8String], enabled);
}

- (bool)activate
{
	bool returnValue = gtk_widget_activate([self castedGObject]);

	return returnValue;
}

- (bool)activateActionVariantWithName:(OFString*)name args:(GVariant*)args
{
	bool returnValue = gtk_widget_activate_action_variant([self castedGObject], [name UTF8String], args);

	return returnValue;
}

- (void)activateDefault
{
	gtk_widget_activate_default([self castedGObject]);
}

- (void)addController:(OGTKEventController*)controller
{
	gtk_widget_add_controller([self castedGObject], [controller castedGObject]);
}

- (void)addCssClass:(OFString*)cssClass
{
	gtk_widget_add_css_class([self castedGObject], [cssClass UTF8String]);
}

- (void)addMnemonicLabel:(OGTKWidget*)label
{
	gtk_widget_add_mnemonic_label([self castedGObject], [label castedGObject]);
}

- (guint)addTickCallbackWithCallback:(GtkTickCallback)callback userData:(gpointer)userData notify:(GDestroyNotify)notify
{
	guint returnValue = gtk_widget_add_tick_callback([self castedGObject], callback, userData, notify);

	return returnValue;
}

- (void)allocateWithWidth:(int)width height:(int)height baseline:(int)baseline transform:(GskTransform*)transform
{
	gtk_widget_allocate([self castedGObject], width, height, baseline, transform);
}

- (bool)childFocus:(GtkDirectionType)direction
{
	bool returnValue = gtk_widget_child_focus([self castedGObject], direction);

	return returnValue;
}

- (bool)computeBoundsWithTarget:(OGTKWidget*)target outBounds:(graphene_rect_t*)outBounds
{
	bool returnValue = gtk_widget_compute_bounds([self castedGObject], [target castedGObject], outBounds);

	return returnValue;
}

- (bool)computeExpand:(GtkOrientation)orientation
{
	bool returnValue = gtk_widget_compute_expand([self castedGObject], orientation);

	return returnValue;
}

- (bool)computePointWithTarget:(OGTKWidget*)target point:(const graphene_point_t*)point outPoint:(graphene_point_t*)outPoint
{
	bool returnValue = gtk_widget_compute_point([self castedGObject], [target castedGObject], point, outPoint);

	return returnValue;
}

- (bool)computeTransformWithTarget:(OGTKWidget*)target outTransform:(graphene_matrix_t*)outTransform
{
	bool returnValue = gtk_widget_compute_transform([self castedGObject], [target castedGObject], outTransform);

	return returnValue;
}

- (bool)containsWithX:(double)x y:(double)y
{
	bool returnValue = gtk_widget_contains([self castedGObject], x, y);

	return returnValue;
}

- (OGPangoContext*)createPangoContext
{
	PangoContext* gobjectValue = PANGO_CONTEXT(gtk_widget_create_pango_context([self castedGObject]));

	OGPangoContext* returnValue = [OGPangoContext withGObject:gobjectValue];
	g_object_unref(gobjectValue);

	return returnValue;
}

- (OGPangoLayout*)createPangoLayout:(OFString*)text
{
	PangoLayout* gobjectValue = PANGO_LAYOUT(gtk_widget_create_pango_layout([self castedGObject], [text UTF8String]));

	OGPangoLayout* returnValue = [OGPangoLayout withGObject:gobjectValue];
	g_object_unref(gobjectValue);

	return returnValue;
}

- (void)disposeTemplate:(GType)widgetType
{
	gtk_widget_dispose_template([self castedGObject], widgetType);
}

- (bool)dragCheckThresholdWithStartX:(int)startX startY:(int)startY currentX:(int)currentX currentY:(int)currentY
{
	bool returnValue = gtk_drag_check_threshold([self castedGObject], startX, startY, currentX, currentY);

	return returnValue;
}

- (void)errorBell
{
	gtk_widget_error_bell([self castedGObject]);
}

- (int)allocatedBaseline
{
	int returnValue = gtk_widget_get_allocated_baseline([self castedGObject]);

	return returnValue;
}

- (int)allocatedHeight
{
	int returnValue = gtk_widget_get_allocated_height([self castedGObject]);

	return returnValue;
}

- (int)allocatedWidth
{
	int returnValue = gtk_widget_get_allocated_width([self castedGObject]);

	return returnValue;
}

- (void)allocation:(GtkAllocation*)allocation
{
	gtk_widget_get_allocation([self castedGObject], allocation);
}

- (OGTKWidget*)ancestor:(GType)widgetType
{
	GtkWidget* gobjectValue = GTK_WIDGET(gtk_widget_get_ancestor([self castedGObject], widgetType));

	OGTKWidget* returnValue = [OGTKWidget withGObject:gobjectValue];
	return returnValue;
}

- (bool)canFocus
{
	bool returnValue = gtk_widget_get_can_focus([self castedGObject]);

	return returnValue;
}

- (bool)canTarget
{
	bool returnValue = gtk_widget_get_can_target([self castedGObject]);

	return returnValue;
}

- (bool)childVisible
{
	bool returnValue = gtk_widget_get_child_visible([self castedGObject]);

	return returnValue;
}

- (OGGdkClipboard*)clipboard
{
	GdkClipboard* gobjectValue = GDK_CLIPBOARD(gtk_widget_get_clipboard([self castedGObject]));

	OGGdkClipboard* returnValue = [OGGdkClipboard withGObject:gobjectValue];
	return returnValue;
}

- (char**)cssClasses
{
	char** returnValue = gtk_widget_get_css_classes([self castedGObject]);

	return returnValue;
}

- (OFString*)cssName
{
	const char* gobjectValue = gtk_widget_get_css_name([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OGGdkCursor*)cursor
{
	GdkCursor* gobjectValue = GDK_CURSOR(gtk_widget_get_cursor([self castedGObject]));

	OGGdkCursor* returnValue = [OGGdkCursor withGObject:gobjectValue];
	return returnValue;
}

- (GtkTextDirection)direction
{
	GtkTextDirection returnValue = gtk_widget_get_direction([self castedGObject]);

	return returnValue;
}

- (OGGdkDisplay*)display
{
	GdkDisplay* gobjectValue = GDK_DISPLAY(gtk_widget_get_display([self castedGObject]));

	OGGdkDisplay* returnValue = [OGGdkDisplay withGObject:gobjectValue];
	return returnValue;
}

- (OGTKWidget*)firstChild
{
	GtkWidget* gobjectValue = GTK_WIDGET(gtk_widget_get_first_child([self castedGObject]));

	OGTKWidget* returnValue = [OGTKWidget withGObject:gobjectValue];
	return returnValue;
}

- (OGTKWidget*)focusChild
{
	GtkWidget* gobjectValue = GTK_WIDGET(gtk_widget_get_focus_child([self castedGObject]));

	OGTKWidget* returnValue = [OGTKWidget withGObject:gobjectValue];
	return returnValue;
}

- (bool)focusOnClick
{
	bool returnValue = gtk_widget_get_focus_on_click([self castedGObject]);

	return returnValue;
}

- (bool)focusable
{
	bool returnValue = gtk_widget_get_focusable([self castedGObject]);

	return returnValue;
}

- (OGPangoFontMap*)fontMap
{
	PangoFontMap* gobjectValue = PANGO_FONT_MAP(gtk_widget_get_font_map([self castedGObject]));

	OGPangoFontMap* returnValue = [OGPangoFontMap withGObject:gobjectValue];
	return returnValue;
}

- (const cairo_font_options_t*)fontOptions
{
	const cairo_font_options_t* returnValue = gtk_widget_get_font_options([self castedGObject]);

	return returnValue;
}

- (OGGdkFrameClock*)frameClock
{
	GdkFrameClock* gobjectValue = GDK_FRAME_CLOCK(gtk_widget_get_frame_clock([self castedGObject]));

	OGGdkFrameClock* returnValue = [OGGdkFrameClock withGObject:gobjectValue];
	return returnValue;
}

- (GtkAlign)halign
{
	GtkAlign returnValue = gtk_widget_get_halign([self castedGObject]);

	return returnValue;
}

- (bool)hasTooltip
{
	bool returnValue = gtk_widget_get_has_tooltip([self castedGObject]);

	return returnValue;
}

- (int)height
{
	int returnValue = gtk_widget_get_height([self castedGObject]);

	return returnValue;
}

- (bool)hexpand
{
	bool returnValue = gtk_widget_get_hexpand([self castedGObject]);

	return returnValue;
}

- (bool)hexpandSet
{
	bool returnValue = gtk_widget_get_hexpand_set([self castedGObject]);

	return returnValue;
}

- (OGTKWidget*)lastChild
{
	GtkWidget* gobjectValue = GTK_WIDGET(gtk_widget_get_last_child([self castedGObject]));

	OGTKWidget* returnValue = [OGTKWidget withGObject:gobjectValue];
	return returnValue;
}

- (OGTKLayoutManager*)layoutManager
{
	GtkLayoutManager* gobjectValue = GTK_LAYOUT_MANAGER(gtk_widget_get_layout_manager([self castedGObject]));

	OGTKLayoutManager* returnValue = [OGTKLayoutManager withGObject:gobjectValue];
	return returnValue;
}

- (bool)mapped
{
	bool returnValue = gtk_widget_get_mapped([self castedGObject]);

	return returnValue;
}

- (int)marginBottom
{
	int returnValue = gtk_widget_get_margin_bottom([self castedGObject]);

	return returnValue;
}

- (int)marginEnd
{
	int returnValue = gtk_widget_get_margin_end([self castedGObject]);

	return returnValue;
}

- (int)marginStart
{
	int returnValue = gtk_widget_get_margin_start([self castedGObject]);

	return returnValue;
}

- (int)marginTop
{
	int returnValue = gtk_widget_get_margin_top([self castedGObject]);

	return returnValue;
}

- (OFString*)name
{
	const char* gobjectValue = gtk_widget_get_name([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (GtkNative*)native
{
	GtkNative* returnValue = gtk_widget_get_native([self castedGObject]);

	return returnValue;
}

- (OGTKWidget*)nextSibling
{
	GtkWidget* gobjectValue = GTK_WIDGET(gtk_widget_get_next_sibling([self castedGObject]));

	OGTKWidget* returnValue = [OGTKWidget withGObject:gobjectValue];
	return returnValue;
}

- (double)opacity
{
	double returnValue = gtk_widget_get_opacity([self castedGObject]);

	return returnValue;
}

- (GtkOverflow)overflow
{
	GtkOverflow returnValue = gtk_widget_get_overflow([self castedGObject]);

	return returnValue;
}

- (OGPangoContext*)pangoContext
{
	PangoContext* gobjectValue = PANGO_CONTEXT(gtk_widget_get_pango_context([self castedGObject]));

	OGPangoContext* returnValue = [OGPangoContext withGObject:gobjectValue];
	return returnValue;
}

- (OGTKWidget*)parent
{
	GtkWidget* gobjectValue = GTK_WIDGET(gtk_widget_get_parent([self castedGObject]));

	OGTKWidget* returnValue = [OGTKWidget withGObject:gobjectValue];
	return returnValue;
}

- (void)preferredSizeWithMinimumSize:(GtkRequisition*)minimumSize naturalSize:(GtkRequisition*)naturalSize
{
	gtk_widget_get_preferred_size([self castedGObject], minimumSize, naturalSize);
}

- (OGTKWidget*)prevSibling
{
	GtkWidget* gobjectValue = GTK_WIDGET(gtk_widget_get_prev_sibling([self castedGObject]));

	OGTKWidget* returnValue = [OGTKWidget withGObject:gobjectValue];
	return returnValue;
}

- (OGGdkClipboard*)primaryClipboard
{
	GdkClipboard* gobjectValue = GDK_CLIPBOARD(gtk_widget_get_primary_clipboard([self castedGObject]));

	OGGdkClipboard* returnValue = [OGGdkClipboard withGObject:gobjectValue];
	return returnValue;
}

- (bool)realized
{
	bool returnValue = gtk_widget_get_realized([self castedGObject]);

	return returnValue;
}

- (bool)receivesDefault
{
	bool returnValue = gtk_widget_get_receives_default([self castedGObject]);

	return returnValue;
}

- (GtkSizeRequestMode)requestMode
{
	GtkSizeRequestMode returnValue = gtk_widget_get_request_mode([self castedGObject]);

	return returnValue;
}

- (GtkRoot*)root
{
	GtkRoot* returnValue = gtk_widget_get_root([self castedGObject]);

	return returnValue;
}

- (int)scaleFactor
{
	int returnValue = gtk_widget_get_scale_factor([self castedGObject]);

	return returnValue;
}

- (bool)sensitive
{
	bool returnValue = gtk_widget_get_sensitive([self castedGObject]);

	return returnValue;
}

- (OGTKSettings*)settings
{
	GtkSettings* gobjectValue = GTK_SETTINGS(gtk_widget_get_settings([self castedGObject]));

	OGTKSettings* returnValue = [OGTKSettings withGObject:gobjectValue];
	return returnValue;
}

- (int)size:(GtkOrientation)orientation
{
	int returnValue = gtk_widget_get_size([self castedGObject], orientation);

	return returnValue;
}

- (void)sizeRequestWithWidth:(int*)width height:(int*)height
{
	gtk_widget_get_size_request([self castedGObject], width, height);
}

- (GtkStateFlags)stateFlags
{
	GtkStateFlags returnValue = gtk_widget_get_state_flags([self castedGObject]);

	return returnValue;
}

- (OGTKStyleContext*)styleContext
{
	GtkStyleContext* gobjectValue = GTK_STYLE_CONTEXT(gtk_widget_get_style_context([self castedGObject]));

	OGTKStyleContext* returnValue = [OGTKStyleContext withGObject:gobjectValue];
	return returnValue;
}

- (GObject*)templateChildWithWidgetType:(GType)widgetType name:(OFString*)name
{
	GObject* returnValue = gtk_widget_get_template_child([self castedGObject], widgetType, [name UTF8String]);

	return returnValue;
}

- (OFString*)tooltipMarkup
{
	const char* gobjectValue = gtk_widget_get_tooltip_markup([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OFString*)tooltipText
{
	const char* gobjectValue = gtk_widget_get_tooltip_text([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (GtkAlign)valign
{
	GtkAlign returnValue = gtk_widget_get_valign([self castedGObject]);

	return returnValue;
}

- (bool)vexpand
{
	bool returnValue = gtk_widget_get_vexpand([self castedGObject]);

	return returnValue;
}

- (bool)vexpandSet
{
	bool returnValue = gtk_widget_get_vexpand_set([self castedGObject]);

	return returnValue;
}

- (bool)visible
{
	bool returnValue = gtk_widget_get_visible([self castedGObject]);

	return returnValue;
}

- (int)width
{
	int returnValue = gtk_widget_get_width([self castedGObject]);

	return returnValue;
}

- (bool)grabFocus
{
	bool returnValue = gtk_widget_grab_focus([self castedGObject]);

	return returnValue;
}

- (bool)hasCssClass:(OFString*)cssClass
{
	bool returnValue = gtk_widget_has_css_class([self castedGObject], [cssClass UTF8String]);

	return returnValue;
}

- (bool)hasDefault
{
	bool returnValue = gtk_widget_has_default([self castedGObject]);

	return returnValue;
}

- (bool)hasFocus
{
	bool returnValue = gtk_widget_has_focus([self castedGObject]);

	return returnValue;
}

- (bool)hasVisibleFocus
{
	bool returnValue = gtk_widget_has_visible_focus([self castedGObject]);

	return returnValue;
}

- (void)hide
{
	gtk_widget_hide([self castedGObject]);
}

- (bool)inDestruction
{
	bool returnValue = gtk_widget_in_destruction([self castedGObject]);

	return returnValue;
}

- (void)initTemplate
{
	gtk_widget_init_template([self castedGObject]);
}

- (void)insertActionGroupWithName:(OFString*)name group:(GActionGroup*)group
{
	gtk_widget_insert_action_group([self castedGObject], [name UTF8String], group);
}

- (void)insertAfterWithParent:(OGTKWidget*)parent previousSibling:(OGTKWidget*)previousSibling
{
	gtk_widget_insert_after([self castedGObject], [parent castedGObject], [previousSibling castedGObject]);
}

- (void)insertBeforeWithParent:(OGTKWidget*)parent nextSibling:(OGTKWidget*)nextSibling
{
	gtk_widget_insert_before([self castedGObject], [parent castedGObject], [nextSibling castedGObject]);
}

- (bool)isAncestor:(OGTKWidget*)ancestor
{
	bool returnValue = gtk_widget_is_ancestor([self castedGObject], [ancestor castedGObject]);

	return returnValue;
}

- (bool)isDrawable
{
	bool returnValue = gtk_widget_is_drawable([self castedGObject]);

	return returnValue;
}

- (bool)isFocus
{
	bool returnValue = gtk_widget_is_focus([self castedGObject]);

	return returnValue;
}

- (bool)isSensitive
{
	bool returnValue = gtk_widget_is_sensitive([self castedGObject]);

	return returnValue;
}

- (bool)isVisible
{
	bool returnValue = gtk_widget_is_visible([self castedGObject]);

	return returnValue;
}

- (bool)keynavFailed:(GtkDirectionType)direction
{
	bool returnValue = gtk_widget_keynav_failed([self castedGObject], direction);

	return returnValue;
}

- (GList*)listMnemonicLabels
{
	GList* returnValue = gtk_widget_list_mnemonic_labels([self castedGObject]);

	return returnValue;
}

- (void)map
{
	gtk_widget_map([self castedGObject]);
}

- (void)measureWithOrientation:(GtkOrientation)orientation forSize:(int)forSize minimum:(int*)minimum natural:(int*)natural minimumBaseline:(int*)minimumBaseline naturalBaseline:(int*)naturalBaseline
{
	gtk_widget_measure([self castedGObject], orientation, forSize, minimum, natural, minimumBaseline, naturalBaseline);
}

- (bool)mnemonicActivate:(bool)groupCycling
{
	bool returnValue = gtk_widget_mnemonic_activate([self castedGObject], groupCycling);

	return returnValue;
}

- (GListModel*)observeChildren
{
	GListModel* returnValue = gtk_widget_observe_children([self castedGObject]);

	return returnValue;
}

- (GListModel*)observeControllers
{
	GListModel* returnValue = gtk_widget_observe_controllers([self castedGObject]);

	return returnValue;
}

- (OGTKWidget*)pickWithX:(double)x y:(double)y flags:(GtkPickFlags)flags
{
	GtkWidget* gobjectValue = GTK_WIDGET(gtk_widget_pick([self castedGObject], x, y, flags));

	OGTKWidget* returnValue = [OGTKWidget withGObject:gobjectValue];
	return returnValue;
}

- (void)queueAllocate
{
	gtk_widget_queue_allocate([self castedGObject]);
}

- (void)queueDraw
{
	gtk_widget_queue_draw([self castedGObject]);
}

- (void)queueResize
{
	gtk_widget_queue_resize([self castedGObject]);
}

- (void)realize
{
	gtk_widget_realize([self castedGObject]);
}

- (void)removeController:(OGTKEventController*)controller
{
	gtk_widget_remove_controller([self castedGObject], [controller castedGObject]);
}

- (void)removeCssClass:(OFString*)cssClass
{
	gtk_widget_remove_css_class([self castedGObject], [cssClass UTF8String]);
}

- (void)removeMnemonicLabel:(OGTKWidget*)label
{
	gtk_widget_remove_mnemonic_label([self castedGObject], [label castedGObject]);
}

- (void)removeTickCallback:(guint)id
{
	gtk_widget_remove_tick_callback([self castedGObject], id);
}

- (void)setCanFocus:(bool)canFocus
{
	gtk_widget_set_can_focus([self castedGObject], canFocus);
}

- (void)setCanTarget:(bool)canTarget
{
	gtk_widget_set_can_target([self castedGObject], canTarget);
}

- (void)setChildVisible:(bool)childVisible
{
	gtk_widget_set_child_visible([self castedGObject], childVisible);
}

- (void)setCssClasses:(const char**)classes
{
	gtk_widget_set_css_classes([self castedGObject], classes);
}

- (void)setCursor:(OGGdkCursor*)cursor
{
	gtk_widget_set_cursor([self castedGObject], [cursor castedGObject]);
}

- (void)setCursorFromName:(OFString*)name
{
	gtk_widget_set_cursor_from_name([self castedGObject], [name UTF8String]);
}

- (void)setDirection:(GtkTextDirection)dir
{
	gtk_widget_set_direction([self castedGObject], dir);
}

- (void)setFocusChild:(OGTKWidget*)child
{
	gtk_widget_set_focus_child([self castedGObject], [child castedGObject]);
}

- (void)setFocusOnClick:(bool)focusOnClick
{
	gtk_widget_set_focus_on_click([self castedGObject], focusOnClick);
}

- (void)setFocusable:(bool)focusable
{
	gtk_widget_set_focusable([self castedGObject], focusable);
}

- (void)setFontMap:(OGPangoFontMap*)fontMap
{
	gtk_widget_set_font_map([self castedGObject], [fontMap castedGObject]);
}

- (void)setFontOptions:(const cairo_font_options_t*)options
{
	gtk_widget_set_font_options([self castedGObject], options);
}

- (void)setHalign:(GtkAlign)align
{
	gtk_widget_set_halign([self castedGObject], align);
}

- (void)setHasTooltip:(bool)hasTooltip
{
	gtk_widget_set_has_tooltip([self castedGObject], hasTooltip);
}

- (void)setHexpand:(bool)expand
{
	gtk_widget_set_hexpand([self castedGObject], expand);
}

- (void)setHexpandSet:(bool)set
{
	gtk_widget_set_hexpand_set([self castedGObject], set);
}

- (void)setLayoutManager:(OGTKLayoutManager*)layoutManager
{
	gtk_widget_set_layout_manager([self castedGObject], [layoutManager castedGObject]);
}

- (void)setMarginBottom:(int)margin
{
	gtk_widget_set_margin_bottom([self castedGObject], margin);
}

- (void)setMarginEnd:(int)margin
{
	gtk_widget_set_margin_end([self castedGObject], margin);
}

- (void)setMarginStart:(int)margin
{
	gtk_widget_set_margin_start([self castedGObject], margin);
}

- (void)setMarginTop:(int)margin
{
	gtk_widget_set_margin_top([self castedGObject], margin);
}

- (void)setName:(OFString*)name
{
	gtk_widget_set_name([self castedGObject], [name UTF8String]);
}

- (void)setOpacity:(double)opacity
{
	gtk_widget_set_opacity([self castedGObject], opacity);
}

- (void)setOverflow:(GtkOverflow)overflow
{
	gtk_widget_set_overflow([self castedGObject], overflow);
}

- (void)setParent:(OGTKWidget*)parent
{
	gtk_widget_set_parent([self castedGObject], [parent castedGObject]);
}

- (void)setReceivesDefault:(bool)receivesDefault
{
	gtk_widget_set_receives_default([self castedGObject], receivesDefault);
}

- (void)setSensitive:(bool)sensitive
{
	gtk_widget_set_sensitive([self castedGObject], sensitive);
}

- (void)setSizeRequestWithWidth:(int)width height:(int)height
{
	gtk_widget_set_size_request([self castedGObject], width, height);
}

- (void)setStateFlagsWithFlags:(GtkStateFlags)flags clear:(bool)clear
{
	gtk_widget_set_state_flags([self castedGObject], flags, clear);
}

- (void)setTooltipMarkup:(OFString*)markup
{
	gtk_widget_set_tooltip_markup([self castedGObject], [markup UTF8String]);
}

- (void)setTooltipText:(OFString*)text
{
	gtk_widget_set_tooltip_text([self castedGObject], [text UTF8String]);
}

- (void)setValign:(GtkAlign)align
{
	gtk_widget_set_valign([self castedGObject], align);
}

- (void)setVexpand:(bool)expand
{
	gtk_widget_set_vexpand([self castedGObject], expand);
}

- (void)setVexpandSet:(bool)set
{
	gtk_widget_set_vexpand_set([self castedGObject], set);
}

- (void)setVisible:(bool)visible
{
	gtk_widget_set_visible([self castedGObject], visible);
}

- (bool)shouldLayout
{
	bool returnValue = gtk_widget_should_layout([self castedGObject]);

	return returnValue;
}

- (void)show
{
	gtk_widget_show([self castedGObject]);
}

- (void)sizeAllocateWithAllocation:(const GtkAllocation*)allocation baseline:(int)baseline
{
	gtk_widget_size_allocate([self castedGObject], allocation, baseline);
}

- (void)snapshotChildWithChild:(OGTKWidget*)child snapshot:(OGTKSnapshot*)snapshot
{
	gtk_widget_snapshot_child([self castedGObject], [child castedGObject], [snapshot castedGObject]);
}

- (bool)translateCoordinatesWithDestWidget:(OGTKWidget*)destWidget srcX:(double)srcX srcY:(double)srcY destX:(double*)destX destY:(double*)destY
{
	bool returnValue = gtk_widget_translate_coordinates([self castedGObject], [destWidget castedGObject], srcX, srcY, destX, destY);

	return returnValue;
}

- (void)triggerTooltipQuery
{
	gtk_widget_trigger_tooltip_query([self castedGObject]);
}

- (void)unmap
{
	gtk_widget_unmap([self castedGObject]);
}

- (void)unparent
{
	gtk_widget_unparent([self castedGObject]);
}

- (void)unrealize
{
	gtk_widget_unrealize([self castedGObject]);
}

- (void)unsetStateFlags:(GtkStateFlags)flags
{
	gtk_widget_unset_state_flags([self castedGObject], flags);
}


@end