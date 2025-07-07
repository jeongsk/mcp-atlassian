# MCP Atlassian Desktop Extension

This is a Desktop Extension (DXT) package for the MCP Atlassian integration, enabling seamless connection between AI language models and Atlassian products (Jira and Confluence).

## Installation

1. Download the `mcp-atlassian.dxt` file
2. Install it in your Claude Desktop application:
   - Open Claude Desktop settings
   - Navigate to Extensions
   - Click "Install Extension" and select the `.dxt` file
   - Configure your Atlassian credentials in the extension settings

## Configuration

After installation, configure the extension with your Atlassian credentials:

### For Atlassian Cloud:
- **Jira URL**: `https://yourcompany.atlassian.net`
- **Confluence URL**: `https://yourcompany.atlassian.net/wiki`
- **Username**: Your email address
- **API Token**: Generate at https://id.atlassian.com/manage-profile/security/api-tokens

### For Server/Data Center:
- **URL**: Your server URL (e.g., `https://jira.yourcompany.com`)
- **Personal Access Token**: Generate from your profile settings

## Features

### Jira Tools
- Search issues with JQL
- View issue details and comments
- Create and update issues
- Transition issues through workflows
- Manage sprints and boards
- Track work logs
- Handle attachments and links

### Confluence Tools
- Search pages with CQL
- Read page content (converted to Markdown)
- Create and update pages
- Manage page hierarchy
- Add comments and labels

## Security Options

- **Read-Only Mode**: Enable to prevent any write operations
- **Tool Filtering**: Specify which tools to enable/disable
- **Multiple Auth Methods**: Basic Auth, PAT, or OAuth 2.0

## Troubleshooting

### Common Issues

1. **Authentication Failed**
   - Verify your API token is correct
   - Check that your user has appropriate permissions
   - For Cloud: Ensure you're using email as username

2. **Tools Not Appearing**
   - Verify at least one service (Jira/Confluence) is configured
   - Check that authentication is properly set up
   - Review enabled_tools configuration if filtering is active

3. **Connection Errors**
   - Verify the URL format is correct
   - Check network connectivity
   - For Server/DC: Verify SSL certificates if needed

### Debug Mode

Enable verbose logging by setting the environment variable:
```bash
MCP_VERBOSE=true
```

## Support

- GitHub Issues: https://github.com/jeongsk/mcp-atlassian/issues
- Documentation: https://github.com/jeongsk/mcp-atlassian/blob/main/README.md

## License

MIT License - See LICENSE file for details.