#!/usr/bin/env python3

import os
from mcp_atlassian.servers.confluence import confluence_mcp

if __name__ == "__main__":
    os.environ["TRANSPORT"] = "stdio"
    confluence_mcp.run()
