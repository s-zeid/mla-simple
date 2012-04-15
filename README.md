MLA Simple
==========
Copyright (c) 2012 Scott Zeid.  Released under the X11 License.

This is a LaTeX file, `mla-simple.tex`, that simplifiies the creation
of MLA papers using LaTeX.  It defines an environment called `mla-simple`,
a wrapper of mla-paper's `mla` environment that automatically handles
Works Cited pages.  It also fixes various formatting issues which exist
when using the MLA package by itself, specifically:

* Uses the correct date format (DD MMMMM YYYY).
* Removes the extraneous "References" heading when using BibTeX on the
  Works Cited page.
* Re-enables two spaces after periods.
* Uses the correct 12 point font size.
* Includes and uses a BibTeX style called "mla-new" by Patrick W. Daly.
* Fixes the above BibTeX style to use proper formatting for URLs.

Other features of MLA Simple include:

* Support for UTF-8 encoded input files (using inputenc).
* A Makefile and shell script that help automate the process of writing
  LaTeX files on the command line.  They should work with any basic LaTeX
  document, not just ones that use MLA Simple.

Requirements
------------
* Packages
   * datetime
   * ifpdf
   * inputenc
   * mla (mla-paper)
   * natbib

Usage
-----
Simply include mla-simple using `\input{mla-simple.tex}`.  Then, begin
your document environment as usual (but you do not need to declare the
document class; MLA Simple does this for you) and then create an instance
of the `mla-simple` environment, passing your name, instructor, course
name, date, and paper title as arguments.  Then write your paper inside
that environment.

For your Works Cited page, make a BibTeX file with the same name as your
LaTeX file, but with the .bib extension, and cite your sources using the
`\mcite` command.  (You can use a different file name by using the
`\wcfile` command.) These two commands, as well as the `\nowc` command
described later, are defined by MLA Simple.  `\mcite` is equivalent to
`(\citealt{source})`, with `\citealt` being part of the `natbib` package.

If you have no sources, you can just use the `mla` environment which is
part of the `mla` package.  You can also insert the `\nowc` command
somewhere in your document.

If you want to define your sources manually, use the `mla` environment
instead of the `mla-simple` environment, and wrap your sources within
the `workscited` enviroment (both part of the `mla` package).

Finally, convert your document into the appropriate format.  The included
Makefile can convert your document into PDF or DVI format for you.

Example
-------
    \input{mla-simple.tex}
    \begin{document}
    \begin{mla-simple}
    {Scott}{Zeid}{Professor Jane Doe}{Compositon II}{\today}
    {Test MLA Simple Document}
    
    This is a test MLA Simple document \mcite{mla-simple}.
    
    \end{mla-simple}
    \end{document}

Formatting tips
---------------
* Sometimes, you have to cite full dates, not just the year.  However, you
  could simply put the whole date field, like this:

         year    = "4 April 1984"


* When citing Web resources, you usually have to include the date on which
  you retrieved it.  You can do this using the note field.  For example:

        @misc{starbucks,
         author  = "Starbucks Coffee",
         title   = "Starbucks Coffee",
         note    = "Web. 16 April 2012",
         url     = "http://www.starbucks.com/"
        }

* To restore the default US date format when using `\today`, do `\usdate`.
  (This is part of the `datetime` package.)  To go back to MLA dates, do
  `\mladate` (from MLA Simple).  See [the `datetime` documentation]
  [datetime] for more date formats.

Makefile usage
--------------
The included Makefile is intended to help simplify the process of
converting a LaTeX document into other formats.  Currently DVI and PDF
are supported.

### Targets
(assuming your document's filename is `starbucks.tex`)

* `starbucks`
* `starbucks.pdf`
  Makes PDF *AND* DVI files from the document.
* `starbucks.dvi`
  Makes a DVI file from the document.
* `clean`
  Removes all intermediate files in the current directory.  This is done
  automatically by the other targets.
* `clean-all`
  Removes all intermediate files, as well as all DVI and PDF files, in the
  current directory.

`write` usage
-------------
MLA Simple includes a shell script, `write`, that runs the editor defined
in `$EDITOR` and then runs the Makefile on the given LaTeX file.  It will
be created with a simple template if it does not exist, and an empty
BibTeX file will also be created if necessary.  If the editor is Vim or
Gvim, it will open both the LaTeX file and the BibTeX file in tabs.  (Vim
7 or later is required for this to work.)

### Invocation
`./write <filename without .tex extension> [<extension of output file>]`

If the output file extension is not given, it will default to `pdf`.  This
argument is simply passed on to the Makefile.  For PDFs, the Makefile will
also leave behind a DVI file.

Credits
-------
* [mla-good.bst obtained from the Reed College Help Desk.][mla-good.bst]
  This version actually works with recent versions of BibTeX.  I have
  modified this to fix the formatting of URLs.  (They should be enclosed
  in angle brackets, while the original version prefixed the text "URL".)
* [`Stefan_K` from latex-community.org][hide-bib-heading]
  for information on how to suppress the default bibliography heading
  without leaving extra vertical space.

License
-------
The template is released under the X11 License.  However, please note
that the included `mla-simple.bst` BibTeX style, based on `mla-new.bst` by
Patrick W. Daaly, is released under the LaTeX Project Public License (version
1.0 or later), which [is not compatible with the GNU General Public License]
[lppl-gpl].

[datetime]:
 http://theoval.cmp.uea.ac.uk/~nlct/latex/packages/datetime/datetime-manual.html
[hide-bib-heading]:
 http://www.latex-community.org/forum/viewtopic.php?f=5&t=4089#p16041
[lppl-gpl]:
 http://www.gnu.org/licenses/license-list.html#LPPL-1.2
[mla-good.bst]:
 http://web.reed.edu/cis/help/latex/bibtexstyles.html#reedsty

    Copyright (C) 2012 Scott Zeid.

    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be included in
    all copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
    THE SOFTWARE.

    Except as contained in this notice, the name(s) of the above copyright holders
    shall not be used in advertising or otherwise to promote the sale, use or
    other dealings in this Software without prior written authorization.
