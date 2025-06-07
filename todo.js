#!/usr/bin/env node

const fs = require('fs');
const path = require('path');

// Find TODO.md file by searching up the directory tree
function findTodoFile() {
  let currentDir = process.cwd();
  
  while (currentDir !== path.parse(currentDir).root) {
    const todoPath = path.join(currentDir, 'TODO.md');
    if (fs.existsSync(todoPath)) {
      return todoPath;
    }
    currentDir = path.dirname(currentDir);
  }
  
  // If not found, create in current directory
  return path.join(process.cwd(), 'TODO.md');
}

// Parse command arguments
function parseArgs(args) {
  const command = args[0]?.toLowerCase();
  const rest = args.slice(1).join(' ');
  
  return { command, rest };
}

// Read TODO file
function readTodoFile(filePath) {
  if (!fs.existsSync(filePath)) {
    return null;
  }
  return fs.readFileSync(filePath, 'utf8');
}

// Write TODO file
function writeTodoFile(filePath, content) {
  fs.writeFileSync(filePath, content, 'utf8');
}

// Create default TODO.md structure
function createDefaultTodo() {
  return `# TODO List

## Priority Levels

- **P0** - Critical: Must be done immediately
- **P1** - High: Should be done soon
- **P2** - Medium: Nice to have
- **P3** - Low: Future considerations

## Categories

- **Features** - New functionality and capabilities
- **Bugs** - Issues to fix
- **UI/UX** - User interface and experience improvements
- **Infrastructure** - Backend, deployment, and system architecture
- **Documentation** - Code documentation and user guides

---

### P0 - Critical

### P1 - High Priority

### P2 - Medium Priority

### P3 - Low Priority

---

## Completed

`;
}

// Add a new TODO item
function addTodo(content, item, priority = 'P2', category = 'Features') {
  const lines = content.split('\n');
  const newItem = `- [ ] **${category}** - ${item}`;
  
  // Find the right priority section
  const priorityHeader = `### ${priority} - `;
  let insertIndex = -1;
  
  for (let i = 0; i < lines.length; i++) {
    if (lines[i].startsWith(priorityHeader)) {
      // Find next empty line or next section
      let j = i + 1;
      while (j < lines.length && lines[j].trim() !== '' && !lines[j].startsWith('###')) {
        j++;
      }
      insertIndex = j;
      break;
    }
  }
  
  if (insertIndex === -1) {
    console.error(`Priority level ${priority} not found in TODO.md`);
    return content;
  }
  
  // Insert the new item
  lines.splice(insertIndex, 0, newItem);
  if (lines[insertIndex + 1]?.trim() !== '') {
    lines.splice(insertIndex + 1, 0, '');
  }
  
  return lines.join('\n');
}

// Complete a TODO item
function completeTodo(content, searchTerm) {
  const lines = content.split('\n');
  const lowerSearch = searchTerm.toLowerCase();
  let foundIndex = -1;
  let foundLine = '';
  
  // Find the todo item
  for (let i = 0; i < lines.length; i++) {
    const line = lines[i];
    if (line.includes('- [ ]') && line.toLowerCase().includes(lowerSearch)) {
      foundIndex = i;
      foundLine = line;
      break;
    }
  }
  
  if (foundIndex === -1) {
    console.error(`TODO item containing "${searchTerm}" not found`);
    return content;
  }
  
  // Remove from current location
  lines.splice(foundIndex, 1);
  
  // Clean up empty lines
  if (lines[foundIndex]?.trim() === '' && lines[foundIndex - 1]?.trim() === '') {
    lines.splice(foundIndex, 1);
  }
  
  // Add to completed section
  const completedIndex = lines.findIndex(line => line.includes('## Completed'));
  if (completedIndex !== -1) {
    const date = new Date().toISOString().split('T')[0];
    const completedItem = foundLine.replace('- [ ]', '- [x]') + ` ✅ - ${date}`;
    
    // Insert after the Completed header
    let insertAt = completedIndex + 1;
    while (insertAt < lines.length && lines[insertAt].trim() === '') {
      insertAt++;
    }
    lines.splice(insertAt, 0, completedItem);
  }
  
  return lines.join('\n');
}

// List todos with optional filter
function listTodos(content, filter = null) {
  const lines = content.split('\n');
  const todos = [];
  let currentPriority = '';
  let currentCategory = '';
  
  for (const line of lines) {
    if (line.startsWith('### P')) {
      currentPriority = line.split(' - ')[0].replace('### ', '');
    } else if (line.includes('- [ ]')) {
      // Extract category from the line
      const categoryMatch = line.match(/\*\*([^*]+)\*\*/);
      if (categoryMatch) {
        currentCategory = categoryMatch[1];
      }
      
      if (!filter || 
          line.toLowerCase().includes(filter.toLowerCase()) ||
          currentPriority.toLowerCase() === filter.toLowerCase() ||
          currentCategory.toLowerCase() === filter.toLowerCase()) {
        todos.push({
          priority: currentPriority,
          category: currentCategory,
          text: line
        });
      }
    }
  }
  
  return todos;
}

// Show usage
function showUsage() {
  console.log(`Usage: /todo [command] [arguments]

Commands:
  add <priority> <category> <description>  Add a new TODO item
      Example: /todo add P1 Features "Add dark mode support"
      
  complete <search term>                   Mark a TODO as complete
      Example: /todo complete "dark mode"
      
  list [filter]                           List all TODOs or filter by priority/category/keyword
      Example: /todo list P1
      Example: /todo list Features
      
  help                                    Show this help message

Priority levels: P0, P1, P2, P3
Categories: Features, Bugs, UI/UX, Infrastructure, Documentation`);
}

// Main function
function main() {
  const args = process.argv.slice(2);
  const { command, rest } = parseArgs(args);
  
  const todoPath = findTodoFile();
  let content = readTodoFile(todoPath);
  
  if (!content && command !== 'help') {
    console.log('TODO.md not found. Creating a new one...');
    content = createDefaultTodo();
    writeTodoFile(todoPath, content);
  }
  
  switch (command) {
    case 'add': {
      // Parse add command: priority category "description"
      const match = rest.match(/^(P\d)\s+(\w+)\s+["']?(.+?)["']?$/);
      if (!match) {
        console.error('Invalid add format. Use: /todo add P1 Features "Description"');
        break;
      }
      const [, priority, category, description] = match;
      const newContent = addTodo(content, description, priority, category);
      writeTodoFile(todoPath, newContent);
      console.log(`✅ Added TODO: ${description}`);
      break;
    }
    
    case 'complete':
    case 'done': {
      if (!rest) {
        console.error('Please provide a search term for the TODO to complete');
        break;
      }
      const newContent = completeTodo(content, rest);
      writeTodoFile(todoPath, newContent);
      console.log(`✅ Completed TODO containing: ${rest}`);
      break;
    }
    
    case 'list':
    case 'ls': {
      const todos = listTodos(content, rest || null);
      if (todos.length === 0) {
        console.log('No TODOs found' + (rest ? ` matching "${rest}"` : ''));
      } else {
        console.log('\nTODO Items:');
        let lastPriority = '';
        for (const todo of todos) {
          if (todo.priority !== lastPriority) {
            console.log(`\n${todo.priority}:`);
            lastPriority = todo.priority;
          }
          console.log(todo.text);
        }
      }
      break;
    }
    
    case 'help':
    case undefined:
      showUsage();
      break;
      
    default:
      console.error(`Unknown command: ${command}`);
      showUsage();
  }
}

main();