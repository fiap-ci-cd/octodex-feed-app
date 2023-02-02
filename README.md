# Actions Required Workflow
## **What is _required workflow_?**
Organization administrators need the ability to enforce the execution of workflows in repositories. Required workflows allow DevOps teams / CICD system administrators to define mandated workflows to run during the lifecycle of a repository’s pipeline. Individual development teams at the repository level will be able to see what required workflows have been applied to their repository, what actions that workflow performs, and whom to contact if they have questions. To learn more, check out [Actions Required Workflow guru card](https://app.getguru.com/card/coA5nz4i/Actions-Required-Workflow-Overview-Private-Beta).

<details id=1>
<summary><h2>Step 1: Create a new branch in Codespaces</h2></summary>

_Welcome to "Actions: Required Workflows" technical enablement! :wave:_

To get you started, follow the steps outline here.

### :keyboard: Activity: Create a workflow file

1. Open a new browser tab, and navigate to this same repository. Then, work on the steps in your second tab while you read the instructions in this tab.
1. Navigate to the **Code** tab.
1. From the **Codespaces** tab, click on the **+** button to create a new Codespaces.
1. Navigate to the newly created tab and wait until `npm ci` command finishes running.
1. In the terminal, enter `git switch -c <username>-required-workflows` which creates a new branch.

</details>

<!--
  <<< Author notes: Step 2 >>>
  Start this step by acknowledging the previous step.
  Define terms and link to docs.github.com.
  Historic note: The previous course had troubleshooting steps for people not using the GitHub UI.
-->

<details id=2>
<summary><h2>Step 2: Add a change to your branch</h2></summary>

_Nice work! :tada: You created a Codespaces environment!_

Next, we need to make a modification in the code to test the required workflows via a Pull Request.

In this step, we will make a modification to the title of the web application.
Note: For those more technically curious, please feel free to make modifications where you see fit to test.

### :keyboard: Activity: Add a change to your branch

1. From the side panel, navigate to `../components/octodexHeader.js`
2. Update the contents of the file to:
```javascript
...
<Typography variant="h2" noWrap>
GitHub Required Workflows
</Typography>
...
```
3. Save the file.
4. Stage and commit the file
```bash
git add .
git commit -m "change component"
```
5. Push the commit to the branch
```bash
git push --set-upstream origin <branch name>
```
6. Navigate to the link in the terminal to create a pull request.

</details>

<details id=X>
<summary><h2>Finish</h2></summary>

_Congratulations friend, you've learned the process for required workflows!_

<img src=https://octodex.github.com/images/jetpacktocat.png alt=celebrate width=300 align=right>

Here's a recap of all the tasks you've accomplished in your repository:

- You've created a GitHub codespaces.
- You learned to create a PR to trigger the required workflows.

### What's next?

- Learn more about Actions required workflows by reading "[Guru: Actions Required Workflow Overview](https://app.getguru.com/card/coA5nz4i/Actions-Required-Workflow-Overview-Private-Beta)".
- We'd love to hear what you thought of this course [in our #revenue-enablement channel](https://github.slack.com/archives/C02H7LZB58T).

</details>

## GitHub Octodex RSS Feed Renderer

This repository hosts a basic [Next.js](https://nextjs.org/) application that can consume the
[GitHub Octodex](https://octodex.github.com/) RSS feed and then render the extracted feed
items into a web page so the Octocats can be viewed in all their glory :tada:.

![Screenshot 2021-08-18 at 18 29 06](https://user-images.githubusercontent.com/681306/129948944-40269cd4-1e21-4d91-8dff-e1a34bc0368e.png)

## Building
This is a standard Next.js application that uses the `next` framework to develop and build the application.

To run the application locally, use `npm run dev` from the checked out source code (after installing the dependencies of course using `npm install`). The application will start up and bind to port `3000` making the server available from http://localhost:3000