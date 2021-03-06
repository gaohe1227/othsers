package org.red5.server.adapter;

/*
 * RED5 Open Source Flash Server - http://code.google.com/p/red5/
 * 
 * Copyright (c) 2006-2010 by respective authors (see below). All rights reserved.
 * 
 * This library is free software; you can redistribute it and/or modify it under the 
 * terms of the GNU Lesser General Public License as published by the Free Software 
 * Foundation; either version 2.1 of the License, or (at your option) any later 
 * version. 
 * 
 * This library is distributed in the hope that it will be useful, but WITHOUT ANY 
 * WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
 * PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
 * 
 * You should have received a copy of the GNU Lesser General Public License along 
 * with this library; if not, write to the Free Software Foundation, Inc., 
 * 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA 
 */

import org.red5.server.api.IClient;
import org.red5.server.api.IConnection;
import org.red5.server.api.IScope;

/**
 *
 * @author Dominick Accattato (daccattato@gmail.com) 
 */
public class ApplicationLifecycle implements IApplication {

	/*
	 * (non-Javadoc)
	 * 
	 * @seeorg.red5.server.adapter.IApplication#appConnect(org.red5.server.api.
	 * IConnection, java.lang.Object[])
	 */
	public boolean appConnect(IConnection conn, Object[] params) {
		return true;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * org.red5.server.adapter.IApplication#appDisconnect(org.red5.server.api
	 * .IConnection)
	 */
	public void appDisconnect(IConnection conn) {
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * org.red5.server.adapter.IApplication#appJoin(org.red5.server.api.IClient,
	 * org.red5.server.api.IScope)
	 */
	public boolean appJoin(IClient client, IScope app) {
		return true;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * org.red5.server.adapter.IApplication#appLeave(org.red5.server.api.IClient
	 * , org.red5.server.api.IScope)
	 */
	public void appLeave(IClient client, IScope app) {
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * org.red5.server.adapter.IApplication#appStart(org.red5.server.api.IScope)
	 */
	public boolean appStart(IScope app) {
		return true;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * org.red5.server.adapter.IApplication#appStop(org.red5.server.api.IScope)
	 */
	public void appStop(IScope app) {
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * org.red5.server.adapter.IApplication#roomConnect(org.red5.server.api.
	 * IConnection, java.lang.Object[])
	 */
	public boolean roomConnect(IConnection conn, Object[] params) {
		return true;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * org.red5.server.adapter.IApplication#roomDisconnect(org.red5.server.api
	 * .IConnection)
	 */
	public void roomDisconnect(IConnection conn) {

	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * org.red5.server.adapter.IApplication#roomJoin(org.red5.server.api.IClient
	 * , org.red5.server.api.IScope)
	 */
	public boolean roomJoin(IClient client, IScope room) {
		return true;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * org.red5.server.adapter.IApplication#roomLeave(org.red5.server.api.IClient
	 * , org.red5.server.api.IScope)
	 */
	public void roomLeave(IClient client, IScope room) {
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * org.red5.server.adapter.IApplication#roomStart(org.red5.server.api.IScope
	 * )
	 */
	public boolean roomStart(IScope room) {
		return true;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * org.red5.server.adapter.IApplication#roomStop(org.red5.server.api.IScope)
	 */
	public void roomStop(IScope room) {
	}

}
