package com.genexus.live_editing.executor;

import com.genexus.live_editing.commands.IServerCommand;

public interface ICommandExecutor {
	void enqueue(IServerCommand command);
}
