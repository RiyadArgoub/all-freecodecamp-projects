import React from "react";
import {marked} from "marked";
import './App.css';

marked.setOptions({
  breaks:true
}
)

const defaultText = `# Welcome to my React Markdown Previewer!

## This is a sub-heading...
### And here's some other cool stuff:

Heres some code, \`<div></div>\`, between 2 backticks.

\`\`\`
// this is multi-line code:

function anotherExample(firstLine, lastLine) {
  if (firstLine == '\`\`\`' && lastLine == '\`\`\`') {
    return multiLineCode;
  }
}
\`\`\`

You can also make text **bold**... whoa!
Or _italic_.
Or... wait for it... **_both!_**
And feel free to go crazy ~~crossing stuff out~~.

There's also [links](https://www.freecodecamp.org), and
> Block Quotes!

And if you want to get really crazy, even tables:

Wild Header | Crazy Header | Another Header?
------------ | ------------- | -------------
Your content can | be here, and it | can be here....
And here. | Okay. | I think we get it.

- And of course there are lists.
  - Some are bulleted.
     - With different indentation levels.
        - That look like this.


1. And there are numbered lists too.
1. Use just 1s if you want!
1. And last but not least, let's not forget embedded images:

![Random Logo](https://upload.wikimedia.org/wikipedia/commons/a/a2/Icon_Add_256x256.png?20130512152618)
`

const renderer = new marked.Renderer();

function App() {

  const [text,setText] = React.useState(defaultText);

  return (
    <div>
      <h2><i className="fa-brands fa-free-code-camp"></i> Editor </h2>
      <textarea className="textarea" id="editor" value={text} onChange={(e)=>setText(e.target.value)}>{{defaultText}}</textarea>
      <h2><i className="fa-brands fa-free-code-camp"></i>  Previewer </h2>
      <Preview markdown={text}/>
    </div>
  );
}

function Preview({markdown}) {
  return <div
    dangerouslySetInnerHTML={{
      __html: marked(markdown,{renderer:renderer}),
    }}
    id="preview"
  >

  </div>
}

export default App;
