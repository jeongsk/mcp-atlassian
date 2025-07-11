# MCP Atlassian Jira Desktop Extension

This is a Desktop Extension (DXT) package for MCP Atlassian Jira integration, enabling seamless connection between AI language models and Atlassian Jira.

## Installation

1. Download the `mcp-atlassian-jira.dxt` file
2. Install it in your Claude Desktop application:
   - Open Claude Desktop settings
   - Navigate to Extensions
   - Click "Install Extension" and select the `.dxt` file
   - Configure your Jira credentials in the extension settings

## Configuration

After installation, configure the extension with your Jira credentials:

### For Atlassian Cloud:
- **Jira URL**: `https://yourcompany.atlassian.net`
- **Username**: Your email address
- **API Token**: Generate at https://id.atlassian.com/manage-profile/security/api-tokens

### For Server/Data Center:
- **Jira URL**: Your server URL (e.g., `https://jira.yourcompany.com`)
- **Personal Access Token**: Generate from your profile settings
- **SSL Verification**: Set to false only for self-signed certificates

## Features

### Issue Management
- **Search Issues**: Use JQL (Jira Query Language) to find issues
- **View Issue Details**: Get comprehensive issue information
- **Create Issues**: Create new issues with fields and attachments
- **Update Issues**: Modify existing issues
- **Delete Issues**: Remove issues (write operations)
- **Transition Issues**: Move issues through workflows
- **Add Comments**: Comment on issues
- **Batch Operations**: Create multiple issues efficiently

### Project Management
- **View Projects**: Get all accessible projects
- **Project Issues**: Get issues from specific projects
- **Project Versions**: Manage project versions and releases
- **Custom Fields**: Search and work with custom fields

### Agile/Scrum Features
- **Agile Boards**: View and manage agile boards
- **Sprint Management**: Create and update sprints
- **Sprint Issues**: Get issues in specific sprints
- **Epic Management**: Link issues to epics
- **Board Issues**: Get issues from specific boards

### Time Tracking
- **Work Logs**: Add and view work logs
- **Time Tracking**: Track time spent on issues

### Issue Links & Attachments
- **Issue Links**: Create and manage links between issues
- **Remote Links**: Create external links
- **Attachments**: Download issue attachments
- **Link Types**: Get available link types

### Advanced Features
- **Batch Changelogs**: Get change history for multiple issues
- **User Profiles**: Get user information
- **Transitions**: View available workflow transitions

### JQL Search Examples

#### Basic Searches
```
project = "PROJ" AND status = "Open"
assignee = currentUser()
reporter = "user@example.com"
status in ("To Do", "In Progress")
```

#### Advanced Searches
```
project = "PROJ" AND created >= -1w
assignee = currentUser() AND status != "Done"
text ~ "important feature" AND project = "PROJ"
labels = "urgent" AND component = "backend"
fixVersion = "1.0" AND status = "Resolved"
sprint in openSprints()
epic = "PROJ-123"
```

## Security Options

- **Read-Only Mode**: Enable to prevent any write operations (safer for browsing)
- **Tool Filtering**: Specify which tools to enable/disable using comma-separated tool names
- **Multiple Auth Methods**: Basic Auth, Personal Access Token, or OAuth 2.0

## Available Tools

### Read Operations
- `get_user_profile` - Get user profile information
- `get_issue` - Get issue details
- `search` - Search issues with JQL
- `get_transitions` - Get available transitions
- `get_all_projects` - Get all projects
- `get_project_issues` - Get issues from project
- `get_agile_boards` - Get agile boards
- `get_board_issues` - Get issues from board
- `get_sprints_from_board` - Get sprints from board
- `get_sprint_issues` - Get issues in sprint
- `get_worklog` - Get work logs
- `get_project_versions` - Get project versions
- `get_link_types` - Get issue link types
- `download_attachments` - Download attachments
- `batch_get_changelogs` - Get changelogs
- `search_fields` - Search custom fields

### Write Operations
- `create_issue` - Create new issues
- `update_issue` - Update existing issues
- `delete_issue` - Delete issues
- `transition_issue` - Transition issues
- `add_comment` - Add comments
- `batch_create_issues` - Create multiple issues
- `create_sprint` - Create sprints
- `update_sprint` - Update sprints
- `add_worklog` - Add work logs
- `create_version` - Create versions
- `batch_create_versions` - Create multiple versions
- `link_to_epic` - Link issues to epics
- `create_issue_link` - Create issue links
- `remove_issue_link` - Remove issue links
- `create_remote_issue_link` - Create remote links

## Troubleshooting

### Common Issues

1. **Authentication Failed**
   - Verify your API token is correct
   - Check that your user has appropriate permissions
   - For Cloud: Ensure you're using email as username
   - For Server/DC: Verify Personal Access Token

2. **Tools Not Appearing**
   - Verify Jira is configured properly
   - Check that authentication is working
   - Review enabled_tools configuration if filtering is active

3. **Connection Errors**
   - Verify the URL format is correct
   - Check network connectivity
   - For Server/DC: Verify SSL certificates if needed

4. **JQL Search Issues**
   - Verify JQL syntax is correct
   - Check project permissions
   - Use simple searches first, then add complexity

5. **Issue Creation/Update Issues**
   - Verify you have create/edit permissions in the project
   - Check if read-only mode is enabled
   - Ensure required fields are provided
   - Verify field values are valid for the issue type

6. **Sprint/Agile Issues**
   - Check if you have agile permissions
   - Verify the board exists and is accessible
   - Ensure sprint permissions are granted

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