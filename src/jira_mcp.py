#!/usr/bin/env python3

import os

from mcp_atlassian.servers.jira import jira_mcp

if __name__ == "__main__":
    os.environ["TRANSPORT"] = "stdio"
    jira_mcp.run()
