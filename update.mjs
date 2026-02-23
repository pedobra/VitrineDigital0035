import fs from 'fs';
import path from 'path';

function walk(dir, filelist = []) {
    const files = fs.readdirSync(dir);
    for (const file of files) {
        const filepath = path.join(dir, file);
        if (fs.statSync(filepath).isDirectory()) {
            if (file !== 'node_modules' && file !== '.git' && file !== 'dist') walk(filepath, filelist);
        } else {
            if (filepath.endsWith('.html') || filepath.endsWith('.js')) {
                filelist.push(filepath);
            }
        }
    }
    return filelist;
}

const allFiles = walk(process.cwd());
let changedFiles = 0;

for (const filepath of allFiles) {
    let content = fs.readFileSync(filepath, 'utf8');
    let original = content;

    // Fix ImobiMaster -> ImobiRecife
    content = content.replace(/ImobiMaster/g, 'ImobiRecife');

    // Inject favicon on .html files
    if (filepath.endsWith('.html') && !content.includes('favicon.svg')) {
        content = content.replace('<title>', '<link rel="icon" type="image/svg+xml" href="/favicon.svg" />\n    <title>');
    }

    if (content !== original) {
        fs.writeFileSync(filepath, content, 'utf8');
        changedFiles++;
    }
}
console.log(`Updated ${changedFiles} files`);
