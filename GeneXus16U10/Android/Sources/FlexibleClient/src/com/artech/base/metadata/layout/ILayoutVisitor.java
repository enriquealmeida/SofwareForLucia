package com.artech.base.metadata.layout;


public interface ILayoutVisitor {
	void enterVisitor(LayoutItemDefinition visitable);
	void visit(LayoutItemDefinition visitable);
	void leaveVisitor(LayoutItemDefinition visitable);
}


