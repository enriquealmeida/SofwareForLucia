package com.artech.base.model;

import java.util.ArrayList;

public class EntityHelper
{
	/**
	 * Gets the entity from which a code expression should be evaluated (e.g. the same entity
	 * when it's provided by a DP, or the root entity when it's part of an SDT structure).
	 */
	public static Entity forEvaluation(Entity entity, boolean setCurrent)
	{
		return forEvaluation(entity, setCurrent, null);
	}

	public static Entity forEvaluation(Entity entity, boolean setCurrent, ArrayList<Integer> childIndexes)
	{
		// Get the "TRUE" root entity for executing the action.
		// For a normal Entity (e.g. the Form entity, or an entity in a grid row with a DP) it's the same one.
		// For a "member" entity (e.g. an SDT variable or an SDT collection item) it's the first parent entity
		// that is not a member itself (i.e. one of the "normal" cases outlined above).
		while (entity != null && entity.getParentInfo().isMember())
		{
			if (entity.getParentInfo().getParentCollection() != null) {
				entity.getParentInfo().getParentCollection().setCurrentItem(entity);

				// wa for sdt set current in local event
				if (setCurrent)
				{
					// should set current item , also to this entity, if is entity list of sdt.? sdt grid, vs sdt form...
					for (Object enValue : entity.getParentInfo().getParent().getPropertyValues())
					{
						if (enValue instanceof EntityList)
						{
							EntityList list = ((EntityList) enValue);

							// set current for collection of same type
							if (list.getDefinition()!=null && entity.getDefinition()!=null
								&& list.getDefinition().equals(entity.getDefinition()) )
									list.setCurrentItem(entity);

							// if not have type, set current for collection of items of same type
							if (list.getDefinition()==null && list.size()>0)
							{
								Entity sampleEntity = list.get(0);
								if (sampleEntity.getDefinition()!=null && entity.getDefinition()!=null
										&& sampleEntity.getDefinition().equals(entity.getDefinition()) )
									list.setCurrentItem(entity);
							}
						}
					}
				}

				if (childIndexes != null) {
					childIndexes.add(0, entity.getParentInfo().getParentCollection().indexOf(entity));
				}
			}

			entity = entity.getParentInfo().getParent();
		}

		return entity;
	}
}
