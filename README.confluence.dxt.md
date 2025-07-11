# MCP Atlassian Confluence Desktop Extension

This is a Desktop Extension (DXT) package for MCP Atlassian Confluence integration, enabling seamless connection between AI language models and Atlassian Confluence.

## Installation

1. Download the `mcp-atlassian-confluence.dxt` file
2. Install it in your Claude Desktop application:
   - Open Claude Desktop settings
   - Navigate to Extensions
   - Click "Install Extension" and select the `.dxt` file
   - Configure your Confluence credentials in the extension settings

## Configuration

After installation, configure the extension with your Confluence credentials:

### For Atlassian Cloud:
- **Confluence URL**: `https://yourcompany.atlassian.net/wiki`
- **Username**: Your email address
- **API Token**: Generate at https://id.atlassian.com/manage-profile/security/api-tokens

### For Server/Data Center:
- **Confluence URL**: Your server URL (e.g., `https://confluence.yourcompany.com`)
- **Personal Access Token**: Generate from your profile settings
- **SSL Verification**: Set to false only for self-signed certificates

## Features

### Confluence Tools
- **Search Pages**: Search with CQL (Confluence Query Language) or simple text
- **Read Page Content**: Get page content converted to Markdown
- **Create Pages**: Create new pages with content
- **Update Pages**: Modify existing pages
- **Delete Pages**: Remove pages (write operations)
- **Page Hierarchy**: Navigate parent-child relationships
- **Comments**: Add and view page comments
- **Labels**: Manage page labels and tags
- **User Search**: Find Confluence users

### Search Examples

#### Simple Text Search
```
project documentation
```

#### CQL (Confluence Query Language) Examples
```
type=page AND space=DEV
title~"Meeting Notes"
siteSearch ~ "important concept"
text ~ "API documentation"
created >= "2023-01-01"
label=documentation
lastModified > startOfMonth("-1M")
creator = currentUser() AND lastModified > startOfYear()
contributor = currentUser() AND lastModified > startOfWeek()
```

## Security Options

- **Read-Only Mode**: Enable to prevent any write operations (safer for browsing)
- **Tool Filtering**: Specify which tools to enable/disable using comma-separated tool names
- **Multiple Auth Methods**: Basic Auth, Personal Access Token, or OAuth 2.0

## Available Tools

### Read Operations
- `confluence_search` - Search Confluence content
- `confluence_get_page` - Get page content
- `confluence_get_page_children` - Get child pages
- `confluence_get_comments` - Get page comments
- `confluence_get_labels` - Get page labels
- `confluence_search_user` - Search for users

### Write Operations
- `confluence_create_page` - Create new pages
- `confluence_update_page` - Update existing pages
- `confluence_delete_page` - Delete pages
- `confluence_add_comment` - Add comments
- `confluence_add_label` - Add labels

## Troubleshooting

### Common Issues

1. **Authentication Failed**
   - Verify your API token is correct
   - Check that your user has appropriate permissions
   - For Cloud: Ensure you're using email as username
   - For Server/DC: Verify Personal Access Token

2. **Tools Not Appearing**
   - Verify Confluence is configured properly
   - Check that authentication is working
   - Review enabled_tools configuration if filtering is active

3. **Connection Errors**
   - Verify the URL format is correct
   - Check network connectivity
   - For Server/DC: Verify SSL certificates if needed

4. **Search Not Working**
   - Check space permissions
   - Verify CQL syntax for complex queries
   - Try simple text search first

5. **Page Creation/Update Issues**
   - Verify you have edit permissions in the target space
   - Check if read-only mode is enabled
   - Ensure proper page content format

### Debug Mode

Enable verbose logging by setting the environment variable:
```bash
MCP_VERBOSE=true
```

## Support

- GitHub Issues: https://github.com/sooperset/mcp-atlassian/issues
- Documentation: https://github.com/sooperset/mcp-atlassian/blob/main/README.md

## License

MIT License - See LICENSE file for details.