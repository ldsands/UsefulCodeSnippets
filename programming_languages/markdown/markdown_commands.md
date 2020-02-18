# Useful Markdown Code

## Formatting Tips

- to create a "spoiler" tag which will collapse a section of text you can do the following:
    - Note: this is using html markdown itself (and github flavored markdown) does not support this format without any html code [you can find more details here](https://stackoverflow.com/questions/32814161/how-to-make-spoiler-text-in-github-wiki-pages)

    ```markdown
    <details> 
        <summary>Q1: What is the best Language in the World?</summary>
        A1: Julia
    </details>
    ```

    - Here is the result of that code:

    <details> 
      <summary>Q1: What is the best Language in the World? </summary>
       A1: Julia
    </details>

- to add links to markdown this is how you do it (code followed by how it looks in markdown)

    ```markdown
    [this will be the link text](www.bing.com)
    ```

    - [this will be the link text](www.bing.com)