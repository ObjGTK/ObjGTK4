/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKListItemFactory.h"

/**
 * `GtkBuilderListItemFactory` is a `GtkListItemFactory` that creates
 * widgets by instantiating `GtkBuilder` UI templates.
 * 
 * The templates must be extending `GtkListItem`, and typically use
 * `GtkExpression`s to obtain data from the items in the model.
 * 
 * Example:
 * ```xml
 *   <interface>
 *     <template class="GtkListItem">
 *       <property name="child">
 *         <object class="GtkLabel">
 *           <property name="xalign">0</property>
 *           <binding name="label">
 *             <lookup name="name" type="SettingsKey">
 *               <lookup name="item">GtkListItem</lookup>
 *             </lookup>
 *           </binding>
 *         </object>
 *       </property>
 *     </template>
 *   </interface>
 * ```
 *
 */
@interface OGTKBuilderListItemFactory : OGTKListItemFactory
{

}


/**
 * Constructors
 */
- (instancetype)initFromBytesWithScope:(GtkBuilderScope*)scope bytes:(GBytes*)bytes;
- (instancetype)initFromResourceWithScope:(GtkBuilderScope*)scope resourcePath:(OFString*)resourcePath;

/**
 * Methods
 */

- (GtkBuilderListItemFactory*)castedGObject;

/**
 * Gets the data used as the `GtkBuilder` UI template for constructing
 * listitems.
 *
 * @return The `GtkBuilder` data
 */
- (GBytes*)bytes;

/**
 * If the data references a resource, gets the path of that resource.
 *
 * @return The path to the resource
 */
- (OFString*)resource;

/**
 * Gets the scope used when constructing listitems.
 *
 * @return The scope used when constructing listitems
 */
- (GtkBuilderScope*)scope;

@end