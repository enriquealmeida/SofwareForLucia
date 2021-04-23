package com.artech.base.metadata.expressions;

/**
 * Interface for method calls (can be either expressions or statements).
 */
public interface IMethodCall extends Expression
{
	Expression getTarget();
	String getMethod();
}
