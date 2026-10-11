# Forge Cloud workspace

A ready-made place to build while you follow [Forge Cloud](https://forgecloud.si/), a hands-on course on Atlassian Forge. Node.js 24 and the Forge CLI are already installed, and the editor checks your `manifest.yml` as you type.

[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/ansar-rezaei/forge-cloud-workspace?quickstart=1)

## Open it

- **In the browser:** choose the button above. The workspace runs on your own GitHub account and its free monthly Codespaces hours. Choose **New with options** if you want to save your Atlassian email and token as Codespaces secrets first.
- **On your own machine:** with Docker and VS Code (or another editor that supports dev containers), clone this repository and choose **Reopen in Container**.

When you are done, stop or delete the codespace at [github.com/codespaces](https://github.com/codespaces) so it does not use up your free hours.

## Commands

| Command | What it does |
| --- | --- |
| `course-login` | Saves your Atlassian email and [API token](https://id.atlassian.com/manage-profile/security/api-tokens) for the Forge CLI. Use it instead of `forge login`, which cannot store the token here because there is no system keychain. `course-login --logout` forgets them. |
| `course-check` | Checks the general setup: Node.js, the Forge CLI and your login. |
| `course-catch-up` | Lists every point in the course you can start from. `course-catch-up level-1/after-04-look-up-the-vehicle` downloads the example app as it is after that lesson. |

In a codespace with the `FORGE_EMAIL` and `FORGE_API_TOKEN` secrets saved, you are already logged in.

## Follow the course

Start at the [general setup](https://forgecloud.si/#setup). Node.js and the Forge CLI are done here, so tick them and carry on from the login. Wherever a lesson says your laptop, read this workspace.

The token acts as you. Use your own, keep it out of code and screenshots, and revoke it when the course is over.

## AI coding tools

`.vscode/mcp.json` connects Atlassian's Forge MCP server for editors that read it, such as VS Code with GitHub Copilot, so your assistant reads current Forge documentation instead of guessing.
