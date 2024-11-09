# CLI Tools Collection

This repository contains a collection of useful command-line interface (CLI) tools designed to simplify and automate various development workflows. Each tool in this collection serves a specific purpose, such as managing Laravel development tasks, automating processes, and more.

## Table of Contents

1. [Laradev](#laradev)

---

### Laradev

**Description**:  
`Laradev` is a command-line tool that helps you automate the launching of common Laravel development processes, including running Laravel's development server (`php artisan serve`), starting the NPM development environment (`npm run dev`), listening to Laravel queues (`php artisan queue:listen`), and more.

**Installation and Setup**:  
Follow these steps to install and use the `laradev` tool.

1. **Download the `laradev.sh` script**:

2. **Make the script executable**:

   Run the following command to make the script executable:

   ```bash
   chmod +x ~/laradev.sh
   ```

3. **Add the script to your `PATH`**:

   Add the following line to your shell configuration file (e.g., `.bashrc` or `.zshrc`):

   ```bash
   export PATH="$HOME:$PATH"
   ```

4. **Create an alias for `laradev`** (optional):

   You can create an alias for this command:

   ```bash
   alias laradev="bash ~/laradev.sh"
   ```

5. **Use the tool**:

   You can now run the `laradev` command to start multiple Laravel processes simultaneously. Example:

   ```bash
   laradev serve npm queue schedule
   ```

---

## Contributing

We welcome contributions to improve this project! If you'd like to contribute, please follow these steps:

### 1. Fork the Repository

Begin by forking the repository to your own GitHub account by clicking the "Fork" button at the top right of the page.

### 2. Clone Your Fork

Clone the forked repository to your local machine using the following command:

```bash
git clone https://github.com/B45T13N/cli-tools.git
```

### 3. Create a New Branch

Before making any changes, create a new branch for your work. Use a descriptive name for your branch, such as `feature/add-new-tool` or `bugfix/fix-issue-xyz`.

```bash
git checkout -b your-branch-name
```

### 4. Make Your Changes

Make the necessary changes or improvements to the codebase. Ensure that your code follows the existing style and conventions used in the project.

### 5. Test Your Changes

If applicable, write tests for your changes and ensure that they pass successfully. Make sure the tool works as expected by running the commands and testing the functionality.

### 6. Commit Your Changes

Once you're happy with your changes, commit them to your branch with a clear and concise commit message.

```bash
git add .
git commit -m "Description of the changes you made"
```

### 7. Push to Your Fork

Push your changes back to your forked repository on GitHub.

```bash
git push origin your-branch-name
```

### 8. Create a Pull Request

Open a pull request (PR) from your branch to the main repository. Provide a clear description of the changes and any relevant information. We will review your PR and merge it if everything looks good.

### Thank You!

Thank you for contributing to this project! We appreciate your help in making this tool better for everyone.

---

## License

This project is open-source and available under the [MIT License](LICENSE).
